
  
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

## UserRequest    
### Create new UserRequest    
 - URL:  `/create_user_request` 
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | user_id | integer | User ID that creates the UserRequest |  
	 | helper_type_id | integer | HelperType ID that the User wants |  
	 | longitude | float | User's longitude coordinate |  
	 | latitude | float | User's latitude coordinate |  
	 | device_id | string | User device ID (Android) |  
 - Response  
	```  
	{  
		 "status": 200,
		 "message": "User successfuly created" 
	}
	```
  
### Filter UserRequest based on Helper location and type
 - URL:  `/retrieve_request` 
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | helper_type_id | integer | HelperType ID that the User wants |  
	 | longitude | float | User's longitude coordinate |  
	 | latitude | float | User's latitude coordinate |
 - Response
	```
	[
	    {
		    "id",
		    "user_id",
		    "longitude",
		    "latitude",
		    "device_id",
		    "created_at",
		    "updated_at",
		    "helper_type_id"
		}
	]
	```

### Accept UserRequest by ID
 - URL:  `/accept_request` 
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | helper_id | integer | Helper ID that wants to accept the request |  
	 | user_request_id | integer | UserRequest ID that wants to be accepted |  
 - Response
	- Success
	```
	{
	    "status": 200,
	    "message": "Request successfully accepted"
	}
	```
	- Failed
	```
	{
	    "status": 500,
	    "message": "Request already been accepted"
	}
	```