from nltk.tokenize import RegexpTokenizer
from nltk.corpus import stopwords


def extract_u_words(q):
    """Extracts the unique words from a given sentence.

    Converts the given string to lower, removes stopwords,
    and converts into a unique set.

    Args:
        q: The given question

    Returns:
        A filtered list of words
    """
    tokenizer = RegexpTokenizer(r'\w+')
    q = tokenizer.tokenize(q.lower())
    u_words = [word for word in q if word not in stopwords.words('english')]
    return list(set(u_words))
