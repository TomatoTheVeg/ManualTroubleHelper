import requests

url = "http://127.0.0.1:8000/db"
data = {
    "query": "Example query",
    "problems": [
        {
            "description": "Problem 1",
            "tags": ["tag1", "tag2"],
            "steps": [
                {
                    "description": "Step 1 description",
                    "command": "Step 1 command",
                    "picture": "Step 1 picture URL"
                },
                {
                    "description": "Step 2 description",
                    "command": "Step 2 command",
                    "picture": "Step 2 picture URL"
                }
            ]
        },
        {
            "description": "Problem 2",
            "tags": ["tag3", "tag4"],
            "steps": [
                {
                    "description": "Step 3 description",
                    "command": "Step 3 command",
                    "picture": "Step 3 picture URL"
                }
            ]
        }
    ]
}

response = requests.post(url, json=data)
print(response.json())
