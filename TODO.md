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
                                summary  baby_id?

    application controller - 
        '/' - index (get)
        current_user? + logged_in? (helper methods)
    user controller - 
        /register - username, email, password params + save 
        /login - username and password auth
        /logout - clear session 
    baby controller - 
        /babies - shows all babies of user  (get)
        /babies/new - create new baby  (get, post)
        /babies/id - baby by id (get)
        /babies/id/edit - edit baby  (post)
        DELETE request (?)
    updates controller - 
        /updates - shows all updates (get)
        /updates/new - creeate new update  (get, post)
        /updates/id - shows update by id (get)
        /updates/id/edit - edit or delte update by id (get, post)
        DELETE request (?)
    
    user needs to  sign in, sign up, logout, view their babies, view their updates, edit and elte babies or updates, see TL for other users babies and updates

    4. Bootstrap - 
        place in layout.erb 
        


         
