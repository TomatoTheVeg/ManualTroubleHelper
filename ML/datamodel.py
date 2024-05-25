from pydantic import BaseModel
from typing import List

class Step(BaseModel):
    description: str
    command: str
    picture: str

class TypicalProblem(BaseModel):
    description: str
    tags: List[str]
    steps: List[Step]

class QueryInput(BaseModel):
    query: str
    problems: List[TypicalProblem]


'''class StepModel(BaseModel):
    description: str
    causes: List[str]
    command: str
    picture: str
    class Config:
        orm_mode = True

class TypicalProblemModel(BaseModel):
    description: str
    tags: List[str]
    solutions: List[StepModel]
    class Config:
        orm_mode = True


class QueryInputModel(BaseModel):
    query: str
    problems: List[TypicalProblemModel]
    class Config:
        orm_mode = True




class Step:
    def __init__(self, description: str, causes: List[str], command: str, picture: str):
        self.description = description
        self.causes = causes
        self.command = command
        self.picture = picture

class TypicalProblem:
    def __init__(self, description: str, tags: List[str], solutions: List[Step]):
        self.description = description
        self.tags = tags
        self.solutions = solutions

class QueryInput:
    def __init__(self, query: str, problems: List[TypicalProblem]):
        self.query = query
        self.problems = problems*'''
