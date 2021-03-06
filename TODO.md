1. gems squared away 

    user functions
        /login
        /logout
        /register
    user auth 
        unique email / password_digest 

2. plan app 

    user 
        auth                    username 
        email password          password 
        many babies             email 
    babies 
        has many updates        name   user_id
        belongs to user         age    gender
    updates                 
        belongs to baby         weight  height
                                summay  baby_id?




3. 