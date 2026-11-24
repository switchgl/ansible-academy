from fastapi import FastAPI
from fastapi.responses import HTMLResponse
from jinja2 import Environment, FileSystemLoader
import json, markdown, os
from pathlib import Path

ROOT = Path(os.environ.get("ACADEMY_ROOT", Path(__file__).parent.parent))
LABS = ROOT / "labs"
app = FastAPI()
jinja = Environment(loader=FileSystemLoader("templates"), autoescape=True)

def load_catalog():
    return json.loads((LABS / "catalog.json").read_text())

@app.get("/", response_class=HTMLResponse)
def home():
    return jinja.get_template("index.html").render(catalog=load_catalog(), progress={})

@app.get("/labs/{lab_id}", response_class=HTMLResponse)
def lab(lab_id: str):
    cat = load_catalog()
    meta = next((l for l in cat["labs"] if l["id"] == lab_id), None)
    if not meta:
        return HTMLResponse("not found", status_code=404)
    body = markdown.markdown((LABS / lab_id / "README.md").read_text(), extensions=["fenced_code"])
    return jinja.get_template("lab.html").render(lab=meta, body=body)
