
## Readme
### Automata

An app written in Swift that implements the Cellular Automaton Rule 30


##### Requirements

* Provide a visual representation of the output
* Demonstrate your ability to write unit tests
* Show off your creativity
* Be architected with an eye toward easy iteration
* Exhibit a thoughtful and consistent code style
* Include a README with a brief discussion of the implementation  


##### Description

The app is built using a PageViewController, and `R30ViewController`'s that use CollectionViews to visualize output. The `R30ViewController`'s look to IBInspectable/Runtime Attributes on the Storyboard for their configuration: 
* `cellsPerRow`: The number of cells along the X axis of the grid.
* `r30ViewControllerVersion`: CellManager provides two methods of building the CollectionViews: **Full Grid** - Builds the entire grid once and renders, and **Single Cell** - uses a timer to add one cell at a time and renders the view after every iteration.


The logic that determines each cell's state is in the class `cellFor`, which works by:
1. Establishing the current cell's location
2. Identifies the `isActivated` state of it's top 3 neighbors
3. Applies the super simple Rule 30 formula: topLeft != (top || topRight).


To wrap things up, the last page is a 3rd party Markdown rendering framework that allows the user to read this very file from within the app!


##### 3rd Party Frameworks

[CocoaPods](https://github.com/CocoaPods/CocoaPods)
[Down (Markdown Renderer)](https://github.com/iwasrobbed/Down)


##### Notes
I tested the app build process on multiple machines, using various physical and simulator devices. The only issue I ran into was building it on a machine that had Xcode 10.1 installed. I made the app more backwards compatible by lowering the iOS Deployment Target from 12.2 to 11.0, which required dropping the Swift version from 5.0 to 4.2.


##### TODO

* Research a more efficient approach for high interval renderings
* Allow user to adjust the grid dimensions and interval speed
* Add loading timer on R30 VCs to measure changes in performance
* Show loading indicator on the ReadMe page while content is loading
* Continue to add unit tests by creating protocols and mocks


##### Top 5 most played songs during development

1. [chromonicci - Cerulean.](https://open.spotify.com/track/0ZF9zYpYQ15BLUvisLT2Mm?si=K0QgBnYORAWLKiT1rvsp3w)
2. [Yugi Boi + chromonicci - Drip](https://open.spotify.com/track/1QZkN1OS8bkTAizWZj14DC?si=ktW6rSYTRHaJO3BYJi7Twg)
3. [Chuck Sutton - Hot Tea Handshake](https://open.spotify.com/track/3dikcL9Qrd17J0csbJ7rXa?si=A33IbaMRT1qynIV9u25RXQ)
4. [aarabMUZIK - Sweet Symphony](https://open.spotify.com/track/4OO4NoEUTqrg2VdofxKQUq?si=DZVrRIVhQ9Cp5Vti9jLsTA)
5. [Close To You (Pola & Bryson Remix) - ARLE, Pola, Bryson](https://open.spotify.com/track/2iRnXSYSNDHLyDegMqs3HR?si=AXNNzJwNToiZid5gg306cQ)
