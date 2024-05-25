import shutil

import pandas as pd

from fastapi import FastAPI, WebSocket, UploadFile, File, HTTPException
from fastapi.responses import JSONResponse
from datamodel import *
import uvicorn
from typing import List
import bisect


from utils import *

file_path = 'errors.*'

app = FastAPI()

#src=pd.read_json(file_path, lines=True)
#longFixes=pd.DataFrame(columns=['error_died', 'info_died', 'info_recovered'])
#for s in src['name'].unique():
#    longFixes=pd.concat([longFixes, getLongFixes(s, 60)], ignore_index=True)
    #print(s, longFixes)
    #longFixes.to_csv('output.csv', index=True)
    #print(longFixes['error_died'].unique())

@app.post("/db", response_model=List[TypicalProblem])
async def related_typical_problems(query_input: QueryInput):
    benchmark=0.5
    result_map = []
    for p in query_input.problems:
        correspondance = get_correspondance(query_input.query, p.description)
        if correspondance>benchmark:
            bisect.insort(result_map,[p, correspondance], key=lambda pair: -pair[1])
    result=[pair[0] for pair in result_map]
    print(result)
    return JSONResponse(content={"problems":result},status_code=200)#result#[TypicalProblemModel.from_orm(res) for res in result]
#{"request", "problems":List[TypicalProblem]}

@app.post("/setup")
async def setup(file: UploadFile = File(...)):
    if(file.content_type!='application/pdf'):
        raise HTTPException(status_code=400, detail="Only pdf files allowed")
    upload_folder="data"
    os.makedirs(upload_folder,exist_ok=True)
    file_path=os.path.join(upload_folder,file.filename)
    with open(file_path, 'wb') as buf:
        shutil.copyfileobj(file.file, buf)
    with open(file_path, 'r') as f:
        p1,p2,p3=new_Typical_Problem_setup(f.read())
    return JSONResponse(content={"problems":[p1,p2,p3]},status_code=200)#JSONResponse(content={"filename":file.filename, "message":"File uploaded successfully"},status_code=200)

'''@app.post("/desc")
def process_query(query):
    return get_new_TypicalProblem(query)'''




if __name__ == '__main__':
    uvicorn.run(app, host='127.0.0.1', port=8000)

#uvicorn main:app --reload