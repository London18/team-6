from btcp.utils.nlp import extract_u_words
from btcp.database.database import DB


class Queries:
    """Contains all the queries."""

    def __init__(self):
        self.__connection = DB().get_connection()

    def select_all(self, table_name):
        """Performs a select (star) statement to a given table.

        Args:
            table_name: Name of table that data is to be retrieved from

        Returns:
            All data from table
        """
        with self.__connection.cursor() as cursor:
            sql = "SELECT * FROM `" + table_name + "`"
            cursor.execute(sql)
            return cursor.fetchall()

    def select_questions(self, cols, table):
        """Perform a select statement for a given list of columns.

        Args:
            cols: Columns to be selected [list]
            table: Name of table that data is to be retrieved from

        Returns:
            Data from columns specified
        """
        with self.__connection.cursor() as cursor:
            sql = "SELECT `" + "`, `".join(cols) + "` FROM `" + table + "` WHERE keywords IS NOT NULL"
            cursor.execute(sql)
            return cursor.fetchall()

    def find_results(self, cols, c_id, table):
        with self.__connection.cursor() as cursor:
            sql = "SELECT `" + "`, `".join(cols) + "` FROM `" + table + "` WHERE `id`=" + c_id
            print(sql)
            cursor.execute(sql)
            return cursor.fetchall()

    def produce_results(self, q):
        """Search Engine Core

        Args:
            q: Query (string)

        """
        q = sorted(extract_u_words(q))
        details = self.select_questions(['keywords', 'id'], 'qna')

        idx = dict()

        # Rebuild dictionary
        if details and len(details) > 0:
            for x in details:
                idx[x['keywords']] = 0
                keyword_pair = sorted(x['keywords'].split(','))

                if keyword_pair == q:
                    return self.find_results(['answer'], str(x['id']), 'qna')
            return ""

    def return_responses(self, cols, table):
        """Perform a select statement for a given list of columns.

        Args:
            cols: Columns to be selected [list]
            table: Name of table that data is to be retrieved from

        Returns:
            Data from columns specified
        """
        with self.__connection.cursor() as cursor:
            sql = "SELECT `" + "`, `".join(cols) + "` FROM `" + table + "`"
            cursor.execute(sql)
            return cursor.fetchall()
