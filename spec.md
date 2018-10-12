# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - Sinatra is used for controllers
- [x] Use ActiveRecord for storing information in a database - All models and migrations inherit from activerecord
- [x] Include more than one model class (e.g. User, Post, Category) - User, VitaminBlend, and Note models are included
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) - User has_many VitaminBlends, VitaminBlend has many notes
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) Notes belong to a VitaminBlend and a user, VitaminBlends belong to a user.
- [x] Include user accounts with unique login attribute (username or email) - Each user cannot register with a username that isn't unique
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - Both VitaminBlends and Notes can be edited, viewed, created, and deleted.
- [x] Ensure that users can't modify content created by other users - Users can't edit anything unless they're logged in as the original user who created it
- [x] Include user input validations - You can't submit anything that's blank
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code - Readme filled out

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
