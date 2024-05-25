import openai
from openai.error import APIConnectionError

openai.api_key = 'your-api-key-here'

try:
    response = openai.Completion.create(
        engine="text-davinci-003",
        prompt="Hello, world!",
        max_tokens=5
    )
    print(response.choices[0].text.strip())
except APIConnectionError as e:
    print(f"Connection error: {e}")
    # Optionally, implement a retry mechanism or other error handling logic here


'''from llama_index.core import VectorStoreIndex, SimpleDirectoryReader

documents = SimpleDirectoryReader("data").load_data()
index = VectorStoreIndex.from_documents(documents)

query_engine = index.as_query_engine()
response = query_engine.query("What did the author do growing up?")
print(response)'''

'''from llama_index.core import VectorStoreIndex
import openai

# Create and populate the LlamaIndex
index = VectorStoreIndex()
index.add_document("doc1", "The first document contains information about Python programming.")
index.add_document("doc2", "The second document provides details on machine learning algorithms.")
index.add_document("doc3", "The third document discusses the applications of AI in healthcare.")

# Retrieve relevant information
query = "Tell me about the applications of AI in different industries."
results = index.query(query, top_k=3)

# Create a prompt for GPT-4-turbo
relevant_texts = [result['text'] for result in results]
prompt = "Based on the following information, provide a detailed explanation of the applications of AI in different industries:\n\n"
for i, text in enumerate(relevant_texts):
    prompt += f"Document {i+1}:\n{text}\n\n"
prompt += "Please summarize the information and provide additional insights if possible."

# Use the prompt with GPT-4-turbo
response = openai.ChatCompletion.create(
    model="gpt-4-turbo",
    messages=[
        {"role": "system", "content": "You are a helpful assistant."},
        {"role": "user", "content": prompt}
    ]
)

# Print the response from GPT-4-turbo
print(response['choices'][0]['message']['content'])'''