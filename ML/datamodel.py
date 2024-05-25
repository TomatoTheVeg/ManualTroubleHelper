from pydantic import BaseModel, Field
from typing import List

class Step(BaseModel):
    description: str = Field(..., description="Short but full description of the step to take to resolve the issue.")
    command: str=Field(..., description="A few lines of code from the manual, which should help at this solution step with corresponding manual page number in the comments")
    picture: str=Field(..., description="The page number at the manual where the most important image for this step could be found")
    link: int=Field(..., description="The number of the most important for this step page in the manual")

class Solution(BaseModel):
    steps: List[Step]=Field(..., description="A short step-by-step manual based solution to the occured problem")

class TypicalProblem(BaseModel):
    description: str=Field(..., description="Short but full description of the problem")
    tags: List[str]=Field(..., description="Keyword tags associated with this problem")
    solutions: List[Solution]=Field(..., description="Corresponding possible solutions to this problem")
class QueryElement(BaseModel):
    index: int
    description: str
class QueryInput(BaseModel):
    query: str
    problems: List[QueryElement]

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
