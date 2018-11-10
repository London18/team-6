from wit import Wit

access_token = "BNEKES5EPOWSRKMB3EPK4QI46G7TRPT2"


responses = {
    'unknown': ['Could you please rephrase that?'],
    'symptoms': ['Severe, persistent headaches. Persistent nausea, vomitting and drowsiness. Progressive weakness or paralysis on one side of the body.'],
    'tumour_info_carer': ['It is important to remember that brain tumours are very rare. If your child is experiencing symptoms listed on our information pages, '
                         '\or you have any concerns, you should speak to your doctor. Read our information on childhood brain tumour symptoms '
                         '\ https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/child-brain-tumour-symptoms/.'],
    'tumour_info': ['It is important to remember that brain tumours are very rare, however if you have any concerns at all you should always speak to your doctor. '
                   '\Our page on adult brain tumour symptoms will inform you about the symptoms of a brain tumour: '
                   '\ https://www.thebraintumourcharity.org/understanding-brain-tumours/symptoms-and-information/adult-brain-tumour-symptoms/.'],
}

# response = client.message(message_input)
#
# print(response)
def select_answer(entity):
    # Can shuffle answers to give choice of answers: shuffle(answer)
    answers = responses[entity]
    # shuffle(answers)
    return answers[0]

def get_first_entity(response):
    confidence = response['entities']['intent'][0]['confidence']
    if confidence>0.5:
        entity = response['entities']['intent'][0]['value']
    else:
        entity = 'unknown'
    return entity

message_input = "I don't know"

client = Wit(access_token = access_token)
response = client.message(message_input)

entity = get_first_entity(response)
print("Entity is :" + entity)
print("Answer is: " + select_answer(entity))

