from wit import Wit
from random import shuffle

access_token = "BNEKES5EPOWSRKMB3EPK4QI46G7TRPT2"


responses = {
    'rephrase': ['Could you please rephrase that?','I am having trouble understanding your question. It would be helpful if you would word it in another way'],
    'unknown': ['Unfortunately I am not able to answer that. Please see our site for FAQs: https://www.thebraintumourcharity.org/frequently-asked-questions/'],
    'symptoms': ['Severe, persistent headaches. Persistent nausea, vomitting and drowsiness. Progressive weakness or paralysis on one side of the body.'],
    'tumour_info_carer': ['It is important to remember that brain tumours are very rare. If your child is experiencing symptoms listed on our information pages, '
                         'or you have any concerns, you should speak to your doctor. Read our information on childhood brain tumour symptoms '
                         ' https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/child-brain-tumour-symptoms/.'],
    'tumour_info': ['It is important to remember that brain tumours are very rare, however if you have any concerns at all you should always speak to your doctor. '
                   'Our page on adult brain tumour symptoms will inform you about the symptoms of a brain tumour: '
                   ' https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/adult-brain-tumour-symptoms/.'],
    'bye': ['Thank you for contacting the Brain Tumour Charity. Goodbye!', 'Bye bye!', 'Goodbye']
}


def select_answer(intent):
    answers = responses[intent]
    shuffle(answers)
    return answers[0]

def get_first_intent(response):
    if response['entities']:
        confidence = response['entities']['intent'][0]['confidence']
        if confidence>0.5:
            intent = response['entities']['intent'][0]['value']
        else:
            intent = 'rephrase'
    else:
        intent = 'unknown'
    return intent


def main():
    message_input = input()
    if message_input.lower() not in ['goodbye','bye','bye bye']:
        client = Wit(access_token=access_token)
        response = client.message(message_input)
        intent = get_first_intent(response)
        print(select_answer(intent))
    else:
        print(select_answer('bye'))
        exit(0)

if __name__ == "__main__":
    while (True):
        main()


