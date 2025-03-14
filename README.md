# ojo: your eyes deserve a break

Ojo is a simple app to help computer jockeys take better care of their eyes.  For those working on a screen for hours at a time, experts recommend taking a 20 second break every 20 minutes to look at an object 20 feet away.  While 20-20-20 is easy enough to remember, it's easy to lose track of time when you find your flow.  Ojo aims to be a gentle reminder to give your eyes a break.

## Tech Stack

ojo is built with Flutter.

 ### Flutter Packages
  - Provider
  - Flex Color Scheme
  - Rive Runtime


## Features & Functionality

User is greeted by a start screen when the app opens.  When user clicks on the "Start" button, she is taken to the timer screen.  

If this is the first time the user has opened the app, she is shown a modal that explains how the app works.  The modal can be dismissed by either clicking/tapping outside of it or dismissing it with a "Let's get started" button.

Otherwise, the app begins the "work period" timer.  The app transitions to a dark color scheme during the "work period" timer.  This timer lasts for 20 minutes.  The amount of time left is displayed on the screen in minutes.  When the timer expires, the alarm.mp3 asset is played, the screen displays text indicating that it is time to rest along with a button to "Start Rest", and the app transitions back to a light color scheme.  Once the "Start Rest" button is pressed, a 20 second timer begins.  When that timer expires, the alarm.mps asset is played, and the screen displays text asking the user if she is ready to start working again along wit a button to "Start Work".  When the user presses "Start Work", the "work period" timer actions start over again.