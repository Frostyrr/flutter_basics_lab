# Flutter Basics Lab

Name: Marc Elson Rebato  
Section: ILFV3  
Student ID: 241-00680  
GitHub link: [Frostyrr/flutter_basics_lab](https://github.com/Frostyrr/flutter_basics_lab)

## Activity changes

1. Added my name, program, email and phone number to the profile card.
2. Changed the water goal to 6 glasses and added the message "Six glasses complete! Stay hydrated!"
3. Changed the hometown to Magallanes, Agusan del Norte and added a Feels like box showing 35 degrees.
4. Added Ice Cream for PHP 55 and Chocolate Cake for PHP 95. Chocolate Cake has a Best seller badge.
5. Added an HTML skill chip and changed the elevated-button corner radius from 8 to 20.

## Activity 2 build output

These are the last three build lines from the Flutter widget-test console:

```text
build() called: 6 glasses
build() called: 5 glasses
build() called: 0 glasses
```

They show an add attempt at the goal, removing one glass, and resetting.

## Experiment observations

The experiments were checked using temporary copies of the code in Flutter widget tests. The final apps keep the working versions.

- **Activity 2:** Without calling setState, pressing Add changed the count in memory, but the screen still showed the old count. Moving the increment outside the callback still worked when setState was called afterward.
- **Activity 3:** Removing Expanded made the humidity box narrower than the other boxes. Putting it back made all four boxes equal again.
- **Activity 4:** Three columns made the menu cards smaller. The final grid uses two columns.
- **Activity 5:** Changing the radius from 8 to 20 made the elevated button's corners rounder. Dark mode changed the colors of the whole page.

## Review answers

### 1. StatelessWidget and StatefulWidget

A StatelessWidget has no mutable state of its own, like ProfileCard. A StatefulWidget uses a State object to keep values that change, like the glass count in WaterTrackerPage.

### 2. Why are there two classes?

The StatefulWidget class holds the widget's configuration and creates its State. The State class stores changing values, handles actions and builds the screen.

### 3. What happened without setState?

The count changed, but the screen did not update until another rebuild happened. If setState was still called after changing the count, the screen updated normally.

### 4. When is build called?

It is called when the screen first appears and after setState requests a rebuild. Parent or theme changes can also cause it to run again.

### 5. Main axis and cross axis

For a Row, the main axis is horizontal and the cross axis is vertical. For a Column, the main axis is vertical and the cross axis is horizontal.

### 6. What does Expanded do?

Expanded makes a child take a share of the available space. Without it, one stat box used its natural width. With Expanded around all four boxes, they shared the row equally.

### 7. Why use GridView.builder?

It arranges the items in a scrolling grid and creates them as needed near the visible area. A Column only stacks items vertically and does not scroll by itself.

### 8. How is the Best seller badge placed?

Stack draws the badge over the menu card's content. Positioned places it near the top-left corner. It only appears on items marked as best sellers.

### 9. ThemeData versus a style on one widget

ThemeData sets shared styles, like the elevated buttons' shape and padding in Activity 5. A style on one widget only affects that widget, like the colors set directly on the profile avatar in the settings page.

### 10. How does dark mode work?

_ThemeDemoAppState stores _isDark. The switch calls the callback, which updates that value using setState. MaterialApp then uses the matching light or dark theme.

## Submission note

The seven screenshots are in the screenshots folder. The GitHub repository link is listed above.
