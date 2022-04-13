select norm_gen.ts_all (						  				  
	 $${
     "title": "User account",
     "description":"all account details with DB mappings",
     "type": "array",
      "items": {
	              "$ref": "#/definitions/account"
                 },
     "db_mapping":{
     	   "db_schema":"norm"
     	            },
     "definitions": {
         "account":{
         "type": "object",
          "db_mapping": {
                  "db_table":"account",
                  "pk_col": "account_id",
                 "record_type": "account_record"
         },
         "properties": {
             "dob": {
                 "type": "string",
                 "format": "date",
                 "db_mapping":{                  
                   "db_col": "dob",
                   "db_type": "date"
                   }
             },
             "emails": {
                 "type": "array",
                 "items": {
                     "$ref": "#/definitions/email"
                 }
             },
             "phones": {
                 "type": "array",
                 "items": {
                     "$ref": "#/definitions/phone"
                 }
             },
             "username": {
                 "type": "string"
             },
             "last_name": {
                 "type": "string"
             },
             "account_id": {
                 "type": "number"
             },
             "first_name": {
                 "type": "string"
             }
         }
     },
         "email": {
                 "type": "object",
                 "db_mapping": {
                     "parent_fk_col": "account_id",
                     "record_type": "email_record",
                     "db_table": "email",
                     "pk_col":"email_id",      
                    "embedded":[
                        {"alias":"ep",
                         "db_table":"email_priority",
                         "pk_col":"email_priority_id",
                         "fk_col":"email_priority_id"
                         }
                         ]
                 },
             "properties": {
                     "email": {
                         "type": "string"
                     },
                     "email_id": {
                         "type": "number"               
                     },
                     "email_priority": {
                         "type": "string",                      
                        "db_mapping":{
                        "db_col":"email_priority",
                        "db_source_alias":"ep" 
                            }
                     },
                     "email_priority_id": {
                         "type": "number"
                     }
                 }
         },
         "phone": {
             "type": "object",              
             "db_mapping": {
                 "parent_fk_col": "account_id",
                 "record_type": "phone_record",
                 "db_table":"phone",
                 "pk_col": "phone_id",
                  "embedded":[
                        {"alias":"pt",
                         "db_table":"phone_type",
                         "pk_col":"phone_type_id",
                         "fk_col":"phone_type_id"
                         }
                         ]
             },
             "properties": {
                 "phone_id": {
                     "type": "number"
                 },
                 "phone_type": {
                     "type": "string",                   
                        "db_mapping":{
                            "db_col":"phone_type",
                            "db_source_alias":"pt" 
                             }
                 },
                 "phone_number": {
                     "type": "string",                 
                     "db_mapping":{                  
                     "db_col": "phone"
                     }                  
                 },
                 "phone_type_id": {
                     "type": "number"
                 }
             }
         }
     }
 }
$$::json		 
 );
								   
									   