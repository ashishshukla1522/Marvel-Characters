
## This app is created to list marverl characters in your iPhone and one can check the details listed with comics by selecting the characters from the list.    

## About the app

This app is created using MVVM design pattern which also includes the test cases for the app.

The app is build using UIKit framework and no third party is used to build this app.

This app uses the *Marvel API* i.e https://developer.marvel.com/ to list the marvel characters and related comics list.

## Features in the app

*Characters List* : This screen displays all the marvel characters fetched from the API. It have an pagination integrated which gets 10 Marvel characters at a time from the server. As you will reach to the bottom of the list, The app will automatically fetch more characters and will keep adding in the list. It dispays the short description, Name and image of the character.

*Characters Detail* : This screen displays the Image, full description, name and comics related to the character in the screen.


************** Technical Details ******

*Architecture* : This app is developed using MVVM design pattern which includes three layer i.e Model, View and View model. 
*Model* : This layer includes parsing of the json coming from the server.

*View* : This layer is reponsible performing the UI Related actions such as Button actions, Scrolls etc.
*ViewModel* : This layer contains the business logic, asynchronus networking code. 

*Test*: This app have test cases but the code coverage is not 100%. API Resources, view controllers, And helper functions like Image and request manager are tested.

## To Run the app

1. Download/Clone the app from the github
*Command to clone the app* : Open terminal and use this command *git clone (branch url)* to clone the app.

*API Keys* : You can create your own API keys(From : https://www.marvel.com/signin?referer=https%3A%2F%2Fdeveloper.marvel.com%2Faccount) and use it in the app.
