import pandas as pd
from datetime import datetime as dt, timedelta as td

from llama_index.program.openai import OpenAIPydanticProgram
from llama_index.core import ChatPromptTemplate
from llama_index.core.llms import ChatMessage
from llama_index.core import SimpleDirectoryReader
from llama_index.llms.openai import OpenAI
from llama_index.agent.openai import OpenAIAgent
from llama_index.core import (
    load_index_from_storage,
    StorageContext,
    VectorStoreIndex,
)
from llama_index.core.tools import QueryEngineTool

from datamodel import *


from dotenv import load_dotenv
import os

load_dotenv()

OPENAI_API_KEY =os.getenv("OPENAI_API_KEY")

file_path = 'errors.jsonl'

llm = OpenAI()#OpenAI(model="gpt-4-turbo")#OpenAI(model="gpt-3.5-turb-o0613")#OpenAI(model="gpt-4-turbo")
def getLongFixes(scooter, benchmark):
    df = pd.read_json(file_path, lines=True)
    df['changed'] = pd.to_datetime(df['changed'])
    df = df[(df["name"] == scooter)][["prev", "now", "changed", "info"]]
    df1 = df[df['prev'] == 'None']
    df1.reset_index(drop=True, inplace=True)
    df2 = df[df['now'] == 'None']
    df2.reset_index(drop=True, inplace=True)
    df1 = df1.copy()[['changed', 'now', 'info']]
    df2 = df2.copy()[['changed', 'info']]
    df = pd.concat([df1, df2], axis=1)
    df.columns = ['died', 'error_died', 'info_died', 'recovered', 'info_recovered']
    df['delta'] = df['recovered'] - df['died']
    df = df[df['delta'] > td(seconds=benchmark)]
    # df=df[['died', 'recovered', 'delta', 'error_died', 'info_died', 'info_recovered']]
    return df[['error_died', 'info_died', 'info_recovered']]

def get_new_TypicalProblem(query):
    return query['description'] # returns new TypicalProblem from query

def get_correspondance(query, description):
    prompt=(
        f"Given the following query:\n{query}\n\n"
        f"and description:\n{description}\n"
        "Provide a score, how similar they are from 0 to 1. Only give a number."
    )
    return float(llm.complete(prompt).text)

def new_Typical_Problem_setup(text):

    prompt = ChatPromptTemplate(
        message_templates=[
            ChatMessage(
                role="system",
                content=(
                    "You are an expert assistant for summarizing and extracting information relevant for generating simple yet explicit FAQs to resolve hypothetical issues which could occur in praxis based on the documents and other information provided to you by the user. If you don't find information, leave it as an empty string."
                ),
            ),
            ChatMessage(
                role="user",
                content=(
                    "Here is the text: \n"
                    "------\n"
                    "{text}\n"
                    "------"
                ),
            ),
        ]
    )

    program1, program2, program3 = (
        OpenAIPydanticProgram.from_defaults(
        output_cls=TypicalProblem,
        llm=llm,
        prompt=prompt,
        verbose=True,
    ), OpenAIPydanticProgram.from_defaults(
        output_cls=TypicalProblem,
        llm=llm,
        prompt=prompt,
        verbose=True,
    ), OpenAIPydanticProgram.from_defaults(
        output_cls=TypicalProblem,
        llm=llm,
        prompt=prompt,
        verbose=True,
    ))

    return program1(text=text), program2(text=text), program3(text=text)


