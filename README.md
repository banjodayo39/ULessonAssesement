# ULessonAssesement
An iOS application that pulls subject/media content information from the API

### Tools
* Xcode 
* Swift 5

### Architecture 
* MVVM
- This patterns includes three component Model (Business logic), View (User interface) and the  ViewModel that keep bridge between the view and the model
- The ViewModel acts as an interface between Model and View. It provides databinding between View and model data as well as handles all UI actions by using
command.
- The View binds its control value to properties on a ViewModel, which, in turn, exposes data contained in Model objects. If property values in the ViewModel change, those new values automatically propagate to the view via data binding and via notification.

* Advantages of MVVM 

- MVVM makes your application architecture as Loosely coupled. You can change one layer without affecting the other layers.
- Extensible code : You can extends View, ViewModel and the Model layer separately without affecting the other layers.
- Testable code : You can write unit test cases for both ViewModel and Model layer without referencing the View. This makes the unit test cases easy to write.

### UIKit

- View were done using UIKit creating them declaratively as against using story board

