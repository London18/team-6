from btcp.database.queries import Queries

from wit import Wit
from random import shuffle

WIT_TOKEN = "BNEKES5EPOWSRKMB3EPK4QI46G7TRPT2"
FB_TOKEN = "EAACmu2Arr2MBAAwJzraQh5y90SoCLWoxERwiLKA2LThnHW36kQqgmqDqhytIZBsAYAZAeBhZBV8cZB4hM8Yo9Gpx6KCOOYgjaZC9ygAxr8HdZAbf6mMnUMnRn6wDAos3ExE7VlgxMd2CTZAqHu0DCpNGPEMD7r8wPNrx313W3sEhQZDZD"
THRESHOLD = 0.5

q = Queries()
temp = q.return_responses(['intent', 'response'], 'chatbot')
responses = dict()

for r in temp:
    responses[r['intent']] = [r['response']]


def select_answer(intent):
    answers = responses[intent]
    shuffle(answers)
    return answers[0]


def get_first_intent(response):
    if response['entities']:
        confidence = response['entities']['intent'][0]['confidence']
        if confidence > THRESHOLD:
            intent = response['entities']['intent'][0]['value']
        else:
            intent = 'rephrase'
    else:
        intent = 'unknown'
    return intent


def main():
    message_input = input()
    if message_input.lower() not in ['goodbye', 'bye', 'bye bye']:
        client = Wit(access_token=WIT_TOKEN)
        response = client.message(message_input)
        intent = get_first_intent(response)
        print(select_answer(intent))
    else:
        print(select_answer('bye'))
        exit()
