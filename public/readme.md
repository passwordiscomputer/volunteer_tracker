volunteer-tracker
Appp to track volunteers and projects for a non profit
By Chase Bowden
Setup/Installation Requirements

Clone to your desktop or other folder. navigate to the root directory of the project in terminal Recreate the database by using the following commands in terminal:

createdb [volunteer_tracker] psql [volunteer_tracker] < my_database.sql createdb -T [volunteer_tracker] [volunteer_tracker_test]

Use this command in terminal to run app on the localhost: $ ruby app.rb

visit localhost:4567 and have the time of your life

Specifications (use case scenarios)
User can view, add, update and delete projects.
User can add volunteers to the project
User can view volunteers for the project
User can edit and delete volunteers for the project
Support and contact details


Technologies Used
Ruby, Sinatra, Postgres, HTML, CSS including template from w3 schools

License
Anyone is free to use this project in any form
