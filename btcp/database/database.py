import pymysql.cursors
import configparser


class DB:
    """Includes all the methods related to database connection."""
    # Specify file which includes credentials for connection to database
    CREDENTIALS_FILE = "../../config.ini"

    def __init__(self):
        """Constructor"""
        self.__hostname = None
        self.__username = None
        self.__password = None
        self.__database = None
        self.__charset = None
        self.__connection = None
        self.retrieve_credentials()
        self.connect_database()

    def retrieve_credentials(self):
        """Fetches credentials from credentials file in order to access database"""
        config = configparser.ConfigParser()
        config.read(DB.CREDENTIALS_FILE)

        if "mysql" in config:
            if "hostname" in config['mysql'] and "username" in config['mysql'] \
                    and "password" in config['mysql'] and "database" in config['mysql'] \
                    and "charset" in config['mysql']:
                self.__hostname = config['mysql']['hostname']
                self.__username = config['mysql']['username']
                self.__password = config['mysql']['password']
                self.__database = config['mysql']['database']
                self.__charset = config['mysql']['charset']
                print(self.__hostname)
                print(self.__username)
                print(self.__password)
                print(self.__database)
                print(self.__charset)
        else:
            print("Problem accessing the credentials file.")
            exit()

    def connect_database(self):
        """Performs connection to the database"""
        try:
            self.__connection = pymysql.connect(host=self.__hostname,
                                                user=self.__username,
                                                password=self.__password,
                                                db=self.__database,
                                                charset=self.__charset,
                                                cursorclass=pymysql.cursors.DictCursor)
        except Exception as ex:
            print("Problem connecting to the database. Reason: {}".format(str(ex)))
            exit()

    def get_connection(self):
        """Returns the connection"""
        return self.__connection

    def apply_changes(self):
        """Commits any changes made to the database
        """
        self.__connection.commit()

    def terminate_connection(self):
        """Terminates the connection to the database
        """
        self.__connection.close()
