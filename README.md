Sinatra Baby Journal App 
 
 Overview 

 The Baby Journal app provides a database and web interface for users to:
 - Create an Account that displays only their data within.
 - User can ONLY modify, create and delete objects and content that belong to them.
        - User can create an ccount, sign into their account and logout of their account with their own unique username.
        - User can noyl view data that belongs to them.
        - User can create mini-profiles for their children, view/read and edit and delete these profiles as they wish.
        - User can create "posts"(updates) for each child, as well as edit, view/read them and delete them as they wish. 
        - User inputs for each field related to creating, editing and singing in/up are validated and will not persist bad dats to database.

 This application was built with Sinatra and extended with Rake working with SQL Database using ActiveRecord ORM and styled with Bootstrap CSS.

Installation Instructions 

    Clone this repo into your local environment and run the following commands 
        1. Gem install bundler (to install Bundler)
        2. Bundle install (to install included gem dependencies)
        3. Shotgun (to access server at localhost)
    Then copy domain (in terminal with localhost) and paste into web browsers address bar to access the home page of the app.

 Usage 

 Baby Journal includes three model classes:

 1. User
 has many: babies
 has many :posts 
    has attributes:
    -username
    -email
    -password  (Secured with [Bcrypt](https://github.com/codahale/bcrypt-ruby) hashing algorithm)
2. Baby 
has many :posts 
belongs to :user
    has attributes:
    -name
    -age
    -gender
3. Post
belongs to :baby
belongs to :user 
    has attributes:
    -baby_id
    -user_id
    -title
    -height
    -weight
    -summary
    -created at
    -updated at

Contributing

    Bug reports and pull requests are welcome at https://github.com/sierraskyewallace/baby_journal.git

License 

MIT license available at https://github.com/sierraskyewallace/baby_journal/blob/master/LICENSE

 
