
  
# Go-Help
Go-Help is an Android Application that simplify the process of helping Indonesian people from dangerous situation. It is also used as the project to complete the task given by Go-Jek Camp   

# Go-Help-Server-User
This part service that handles User and UserRequest. Here lies the API documentation. 
    
## User    
### Create new User    
 - URL:  `/create_user`
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | name | string | User name |  
	 | email | string | User email |  
	 | password | string | User password |  
	 | device_id | string | User device ID (Android) |
 - Response  
	```  
	{  
		 "status": 200,
		 "message": "User successfuly created" 
	}
	```

### Get list of Users    
 - URL:  `/get_users`
 - Method: `GET` 
 - Response
	```
	[
		{
		    "id",
		    "name",
		    "email",
		    "password"
		    "device_id"
		    "created_at",
		    "updated_at"
		}
	]
	```

### Get User by ID    
 - URL:  `/get_user`
 - Method: `POST`
 - Headers: `Content-Type: application/json`  
 - Body    
   
 	 | Field | Type | Description |    
 	 | ----- | ---- | ----------- |  
 	 | id | integer | User ID |  
 - Response
	```
	{
	    "id",
	    "name",
	    "email",
	    "password"
	    "device_id"
	    "created_at",
	    "updated_at"
	}
	```
  
---  