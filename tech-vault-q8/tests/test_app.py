import pytest
from app import add, app

# Test fungsi sederhana add
def test_add():
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0

# Test endpoint Flask
def test_hello():
    tester = app.test_client()
    response = tester.get('/')
    assert response.status_code == 200
    assert response.data == b"Hello, World!"

