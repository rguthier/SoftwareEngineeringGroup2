def chat(query):
    import openai

    openai.api_key = 'sk-proj-8X98tpwlrxbMBQYFWJSoT3BlbkFJoVI62asQQZiMaZKdHGmL'
    assistant_id = 'asst_HDzK8KsR6YdQqIuRAIryPR1Q'

    assistant = openai.beta.assistants.retrieve(assistant_id)
    thread = openai.beta.threads.create()

    message = openai.beta.threads.messages.create(
        thread_id=thread.id,
        role='user',
        content=query
    )

    run = openai.beta.threads.runs.create_and_poll(
        thread_id=thread.id,
        assistant_id=assistant.id
    )

    messages = openai.beta.threads.messages.list(thread_id=thread.id)
    for message in messages:
        if message.role == "assistant":
            return str(message.content[0].text.value)

while True:
    print(chat(input('Input: ')))
