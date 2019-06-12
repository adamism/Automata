### Readme

###### Automata

An app written in Swift that implements Cellular Automaton Rule 30




###### Requirements

* Provide a visual representation of the output
* Demonstrate your ability to write unit tests
* Show off your creativity
* Be architected with an eye toward easy iteration
* Exhibit a thoughtful and consistent code style
* Include a README with a brief discussion of the implementation


###### Architectural Concepts
*
*
*
*
*


###### Installation
CocoaPods


###### Roadmap


###### License




An app that implements the Rule 30 Cellular Automata


topLeftCell != (topCell || topRightCell)

I started off hoping there was some kind of crazy efficient approach to drawing these simple cells. After some initial research, it seemed to make the most sense to implement a CollectionView, as they are so commonly utilized and would make a great example.


###### Readme
After nailing down a CollectionView implementation, I wanted to make sure to provide the required README.md in the project, but also make sure that the user has everything they need right in the app. I utilized a framework called [Down](https://github.com/iwasrobbed/Down) that allowed me to pull the README.md file in as a string, and convert it into a View. 
