A VERY small todo app written in rails.
Why?
Just a memory refresh

Uses devise for user authentication   
Uses grape for the API

# API endpoints
All requests require an access token. Sending a POST request to   
/api/sessiona/sessions will give you one.

```shell   
curl -X POST -H "Content-Type: application/json" localhost:3000/api/sessions/sessions -d '{"email": "someemail@example.com", "password": "<abc123>"}'
```

Should give you something like:   
"{\"status\":\"ok\",\"token\":\"Ws6wcgDekFKpIGWZbiGyw3W2xHRx3_I9eF5OQg98cI0\"}"

Using the token attribute of the JSON response you can then access Todos and create them

POST /api/todos/post ---> Creates a new todo  
example:   
```shell   
curl -X POST -H "Content-Type: application/json" localhost:3000/api/todos/post -d '{"todo_title": "Calling from API...", "todo_text": "Always pass the access token to server", "access_token": "Ws6wcgDekFKpIGWZbiGyw3W2xHRx3_I9eF5OQg98cI0"}'
```

GET /api/todos/all ---> Get all Todos   
example:   
```shell   
curl http://127.0.0.1:3000/api/todos/all/?access_token=Ws6wcgDekFKpIGWZbiGyw3W2xHRx3_I9eF5OQg98cI0
```

Get /api/todos/get ---> Get a single Todo by Id   
```shell
curl http://127.0.0.1:3000/api/todos/get/?access_token=Ws6wcgDekFKpIGWZbiGyw3W2xHRx3_I9eF5OQg98cI0&id=1
```

API examples are in the api_examples directory
