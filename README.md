# User Admin

This project is attended to deploy Apache James and a Vuejs application.
The application manage the users of the Apache James service :
 - Create a new user
 - List all existing user

## Project setup with docker

```
docker-compose up -d
```

## Frontend 

Port : http://localhost:8080

### Add user

Only one domain is present at the beginning, it is localhost
So to add a new user it must follow this rule. [a link](https://james.apache.org/server/config-users.html)

## Backend 

Port : http://localhost:8000

### List the available domains:

```
curl http://localhost:8000/domains
```

### Add new features 

Follow this page [a link](https://james.apache.org/server/manage-webadmin.html#Create_a_user)





