# Counter App using Bloc

## Description
This is a Simple flutter Counter application with bloc state management

## Features
- toggling between Light & Dark themes using a switch widget
- displaying the current value of the counter & updating it in case of increment/decrement events
- triggering a snackbar message if the counter value is a multiple of 5 

## code explanation
```
the code flow is done as the following:-  
counter part:  
 1- the counter value displayed is obtained from the provided counter bloc state (initially  set as 0)  
 2- on pressing the increment/decrement floating action button an event (CounterIncrement/CounterDecrement (provided by blocProvider) ) is triggered which emits the State Class that 
    increments then updates the current state count value which in turn is updated at the ui by the builder  
 3- when the counter value reaches a value that is a multiple of 5 a state is emitted which can be used inside the listener in the counter ui to display a snackbar message

Themes part:  
 1- the ThemeState is provided to the theme property in material app in main page and its set initially as dark theme, when the switch button is toggled (ThemeToggle) event is 
    triggered which emits a state that checks whether 
    the current theme is dark or light then it updates the state with the opposite theme
```
  


## Application Screenshots: 
|![s1](https://github.com/user-attachments/assets/33c8b919-92b7-4d13-9287-15ffe19b0411)|![s2](https://github.com/user-attachments/assets/c4a68599-df50-40fb-8186-2fce27cb1a30)|
|-|-|
