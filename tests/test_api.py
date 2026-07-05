from fastapi.testclient import TestClient
from src.app.app import app

client = TestClient(app)

def test_api_is_running():
    response = client.get("/docs")
    assert response.status_code == 200

def test_ui_is_running():
    response = client.get("/ui")
    assert response.status_code == 200