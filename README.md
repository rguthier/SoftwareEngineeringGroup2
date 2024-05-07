# SoftwareEngineeringGroup2
Towson shuttle web application
@Authors
  George Bishop
  Reese Guthier
  Saintgermain Lopez
  Nataly Quinonez

## Setup instructions
Download all files. Ensure they are in the same location. Run "npm init" to create node_modules folder. 
Run each of the .sql files in MySQL Workbench. Change "password" on line 11 of app.js to match the password for database user "root" on the local computer. 
Run "node app.js" in a code editor terminal to start the server. Open "index.html" to run the application.

# Chatbot Notes
The Chatbot that is currently connected to the web-app's help page is a vanilla gpt-3.5 model with no special information about the TU shuttle system, routes, stops, or times. To use the chatgpt assistant that is trained on TU Shuttle data, run the main.py file independently and type into the console.
