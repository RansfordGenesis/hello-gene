from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def hello_gene():
    return {"message": "Hello Genesis"}
