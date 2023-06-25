# MidtermProject
[Coast-To-Coast SkyReport](http://18.116.157.70:8080/CoastToCoastSkyReport)

Create account or login with Username: spencerwilliams, Password: 1234.

# Overview

The name of this project is Coast-to-Coast SkyReport. This website allows users to report, view, and comment on any unusual aerial sighting in our database. Once a user logs into their account, they are taken to their account page, where they have a variety of tools to interact with including "View All Sightings", "Report a Sighting", "Delete a Sighting", "Search Sighting by Keyword" and "View My Account". 

Selecting "View All Sightings" will direct the user to a page that lists all sightings reported from every member of the site. Each sighting has a basic description of the event witnessed, date of sighting, along with a picture assciated with it. Clicking on a sighting will direct the user to a detailed description where there is a map of the sighting location, along with a comments section where users can interact with eachother. 

"Report a Sighting" is a tool that allows any registered user to add a new sighting to the database. Selecting this option takes the user to a page that allows them to fill out a form detailing the sighting. When a user adds a sighting, they must provide a location of the sighting. Optionally a title, description, image, and additional location information can be included. Once the sighting is added, other users can view and comment on the new posting. 

"Delete a Sighting" allows a user to delete any posting made by that user. To use this function, the user must be logged into the account associated with the posting they wish to delete. If a posting is deleted, it will permanently be removed from the database. In addition to the delete option, the user can also update the information of a sighting that they already posted.

"Search Sighting by Keyword" is a function that allows a user to search through the database for a sighting based on the keyword(s) of their choice. To use this tool, locate the search bar that is located on the top right corner of the website. Input the search phrase into the search box and click "Search" to the right of the search box. The search will look through the title and description of each posting in the database and return all results that match the user's input text. 

"View My Account" takes a logged-in user to their account page which displays a list of their recent postings. Next to each listing is a button with the label "edit sighting details" which allows the user to update the details related to that sighting. 



# Technologies Used

- Java
- Spring Boot
- SpringToolSuite
- JPA
- MySql Workbench
- HTML
- CSS
- Bootstrap

# Lesssons Learned

One of the more important lessons we learned was on designing our database. Before we started our project, we constructed a well designed database that allowed us to start our project with clear direction. This kept the integrity of our project which prevented uneccessary issues later on in our project.

Another imporant lesson we learned was on team communication. Throughout the project, the team maintained constant communication, mainly through Stand-Up Scrum Meetings each morning. In these meetings, each team member would take a moment to inform our team on their progress in the project. If there were any issues that were preventing us from achieving our goals, we would also discuss them. Additionally, we would asssign tasks to each member for the day. 

One lesson we learned was how entities should be persited in the DAO Impl - A "child" should be persisted before its "parent" otherwise an error will occur when attempting to run the program.
