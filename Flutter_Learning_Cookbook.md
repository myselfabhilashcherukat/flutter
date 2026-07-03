# Flutter Learning Cookbook

> Personal notes created while learning Flutter through a Tic-Tac-Toe
> project.

------------------------------------------------------------------------

# 1. Flutter Architecture

## `main()`

### Purpose

Entry point of every Flutter application.

### What it does

-   Flutter starts execution from `main()`.
-   Usually calls `runApp()`.

``` dart
void main() {
  runApp(const MyApp());
}
```

------------------------------------------------------------------------

## `runApp()`

### Purpose

Starts the Flutter application.

### What it expects

A Widget.

``` dart
runApp(MyApp());
```

Think of it as:

> "Render this widget tree."

------------------------------------------------------------------------

## `StatelessWidget`

### Purpose

Creates a widget that does not store mutable state.

### Use when

-   UI is static.
-   UI depends only on input.
-   No changing data inside the widget.

------------------------------------------------------------------------

## `build()`

### Purpose

Creates and returns the Widget Tree.

### Important

Flutter may call `build()` many times.

Never assume it runs only once.

------------------------------------------------------------------------

# 2. Flutter Philosophy

## Everything is a Widget

Examples:

-   MaterialApp
-   Scaffold
-   AppBar
-   Text
-   Row
-   Column
-   ElevatedButton

------------------------------------------------------------------------

## Widget Tree

    MaterialApp
        ↓
    Scaffold
        ↓
    Column
        ↓
    Row
        ↓
    ElevatedButton

Think in trees, not screens.

------------------------------------------------------------------------

# 3. Dart Concepts

## Constructor

Calling

``` dart
Scaffold()
```

creates and returns a Scaffold object.

------------------------------------------------------------------------

## Getter

Computes a value every time it is read.

``` dart
String get boardTitle {
  return 'Tic Tac Toe [$boardSize x $boardSize]';
}
```

Usage

``` dart
Text(boardTitle)
```

No parentheses.

------------------------------------------------------------------------

## final

Assigned only once.

``` dart
final int boardSize = 3;
```

------------------------------------------------------------------------

## const

Compile-time constant.

A `const` constructor requires all instance fields to be `final`.

------------------------------------------------------------------------

## References vs Copies

Wrong:

``` dart
b.add(a);
```

Stores a reference.

Correct:

``` dart
b.add(a.toList());
```

or better:

Create a new list every iteration.

------------------------------------------------------------------------

## Derived Data

If a value can always be calculated from another value, don't store it
unless it improves readability.

Examples: - boardTitle from boardSize - Current player from board matrix
(by counting X and O)

------------------------------------------------------------------------

# 4. Flutter Widgets

## MaterialApp

Root of a Material application.

------------------------------------------------------------------------

## Scaffold

Provides a screen.

Contains: - AppBar - Body - Drawer - FAB - Bottom Navigation

------------------------------------------------------------------------

## AppBar

Top application bar.

------------------------------------------------------------------------

## Text

Displays text.

Leaf widget.

------------------------------------------------------------------------

## Center

Centers a single child.

------------------------------------------------------------------------

## Row

Places widgets horizontally.

Requires:

``` dart
children: List<Widget>
```

------------------------------------------------------------------------

## Column

Places widgets vertically.

Requires:

``` dart
children: List<Widget>
```

------------------------------------------------------------------------

## Container

General-purpose box.

Can provide:

-   Background
-   Border
-   Width
-   Height
-   Alignment
-   Padding

------------------------------------------------------------------------

# 5. Buttons

## TextButton

Flat button.

Good for secondary actions.

------------------------------------------------------------------------

## ElevatedButton

Primary Material button.

Supports styling.

------------------------------------------------------------------------

## ButtonStyle

Reusable button style.

Instead of repeating styles, create one getter.

------------------------------------------------------------------------

## ElevatedButton.styleFrom()

Common properties:

-   backgroundColor
-   foregroundColor
-   minimumSize
-   textStyle
-   shape

------------------------------------------------------------------------

# 6. Layout

## Padding

Space around a widget.

The widget owns the spacing.

------------------------------------------------------------------------

## SizedBox

Fixed empty space.

Examples

``` dart
SizedBox(height:20)
SizedBox(width:20)
```

Use between sections.

------------------------------------------------------------------------

## Spacer

Consumes all remaining free space.

Useful for pushing widgets apart.

Difference:

-   SizedBox = Fixed gap.
-   Spacer = Flexible gap.

------------------------------------------------------------------------

# 7. Hot Reload

## Hot Reload (r)

Keeps existing widget tree and state.

Use for:

-   UI
-   Styling
-   Layout

------------------------------------------------------------------------

## Hot Restart (R)

Starts application from main() again.

Use when:

-   Initial values change.
-   Constructors change.
-   main() changes.

------------------------------------------------------------------------

# 8. Development Principles

## Think in Problems

Don't ask:

> Which widget?

Ask:

> What problem am I solving?

------------------------------------------------------------------------

## Learn on Demand

Only learn a widget when a real problem requires it.

------------------------------------------------------------------------

## One Goal at a Time

Current project goal:

-   Dynamic 3x3 board
-   Clickable cells

Ignore:

-   AI
-   Winner detection
-   Animations

------------------------------------------------------------------------

## Separate Responsibilities

Extract reusable logic:

-   boardTitle
-   buttonStyle
-   board

instead of putting everything inside build().

------------------------------------------------------------------------

## Use the Documentation

Workflow:

1.  Guess the widget.
2.  Open Flutter documentation.
3.  Read constructor and properties.
4.  Ask questions only when needed.

------------------------------------------------------------------------

## Build Your Own Cookbook

Don't memorize Flutter.

Build a personal reference based on things you've actually used.

------------------------------------------------------------------------

# 9. UX Lessons

Good UX decisions discussed:

-   Don't make users count the board size.
-   Don't make buttons microscopic.
-   Explain limitations instead of silently changing behavior.
-   Separate application title from game configuration.
-   Think about the user's comfort before visuals.

------------------------------------------------------------------------

# 10. Current Tic-Tac-Toe Roadmap

## Completed

-   Flutter project created.
-   Dynamic board generation.
-   AppBar.
-   Button styling.
-   Clickable buttons.
-   Dynamic board size.
-   Getter usage.
-   Board generated using loops.

## Next

-   Layout using wireframe.
-   Scoreboard.
-   Center the board.
-   Bottom controls.
-   Learn Expanded, Alignment, Flexible through implementation.
-   StatefulWidget.
-   Store board state.
-   Winner detection.
