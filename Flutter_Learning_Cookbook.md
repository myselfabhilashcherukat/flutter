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

# BuildContext

## Purpose

`BuildContext` represents a widget's location in the widget tree. Flutter uses it to locate inherited services such as `Theme`, `Navigator`, `MediaQuery`, and `MaterialLocalizations`.

---

## Mental Model

Think of `BuildContext` as a GPS location.

A widget is **what** you are.

A `BuildContext` is **where** you are.

Flutter starts searching upward from that location to find the services it needs.

---

## Common Uses

```dart
Theme.of(context)

Navigator.of(context)

MediaQuery.of(context)

showDialog(context: context)
```

Each of these starts searching from the current widget's location.

---

## Important Rule

Different widgets have different `BuildContext` objects.

Even if two widgets are instances of the same class, their contexts may resolve different themes, navigators, or inherited widgets depending on where they are placed in the widget tree.

---

## Common Mistakes

- Thinking `BuildContext` is the widget itself.
- Assuming all contexts are interchangeable.
- Using a context from above `MaterialApp` when an API needs services provided by `MaterialApp`.


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

# Container

## Purpose

`Container` is a general-purpose widget used to create a rectangular area that can control the size, position, spacing, and appearance of its child.

Think of it as a customizable box.

---

## When to Use

Use `Container` when you need one or more of the following:

- Add padding around a widget.
- Add margin outside a widget.
- Set a background color.
- Apply borders or rounded corners.
- Add shadows.
- Control width and height.
- Apply transformations or alignment.

---

## When NOT to Use

Avoid using `Container` when:

- You only need empty space between widgets. Use `SizedBox` instead.
- You want to represent a Material Design card. Use `Card` instead.
- Another widget already provides the required functionality.

Using the most appropriate widget makes your code easier to understand.

---

## Simple Example

```dart
Container(
  padding: const EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
  ),
  child: const Text('Player X'),
)
```

---

## Mental Model

> A customizable rectangular box that can hold one child.

It answers the question:

*"I need an area that I can size, position, and decorate."*

---

# Card

## Purpose

`Card` is a Material Design widget used to display related content inside a card-like surface.

It comes with Material behavior such as elevation and rounded corners.

---

## When to Use

Use `Card` when:

- Displaying grouped information.
- Showing list items.
- Creating dashboards.
- Presenting content that should visually stand out.

---

## When NOT to Use

Avoid using `Card` when:

- You only need a generic layout container.
- You don't want Material Design styling.

In those cases, `Container` is usually a better choice.

---

## Simple Example

```dart
Card(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Text('Player X'),
  ),
)
```

---

## Mental Model

> A Material Design surface for presenting related content.

It answers the question:

*"This content should look and behave like a card."*

---

# SizedBox

## Purpose

`SizedBox` creates empty space or forces a widget to have a fixed size.

Unlike `Container`, it is not meant for decoration.

---

## When to Use

Use `SizedBox` when:

- Adding vertical spacing.
- Adding horizontal spacing.
- Giving a widget a fixed width.
- Giving a widget a fixed height.
- Reserving empty space in a layout.

---

## When NOT to Use

Avoid using `SizedBox` when:

- You need padding or margin.
- You need a background color.
- You need borders or shadows.
- You need to decorate the area.

Use `Container` instead.

---

## Simple Examples

### Add Space

```dart
Column(
  children: [
    Text('Player X'),
    SizedBox(height: 20),
    Text('Player O'),
  ],
)
```

### Give a Widget a Fixed Size

```dart
SizedBox(
  width: 100,
  height: 100,
  child: ElevatedButton(
    onPressed: () {},
    child: Text('X'),
  ),
)
```

---

## Mental Model

> An invisible box used only for spacing or sizing.

It answers the question:

*"I need some space here."*

---

# Quick Comparison

| Widget | Primary Purpose | Decoration | Spacing | Material Design |
|---------|-----------------|------------|----------|-----------------|
| `Container` | General-purpose layout and decoration | ✅ | ⚠️ Possible but not recommended | ❌ |
| `Card` | Material Design card | ✅ | ❌ | ✅ |
| `SizedBox` | Empty space or fixed size | ❌ | ✅ | ❌ |

---

# Engineering Rule

Before choosing a widget, ask yourself:

1. **Am I creating an area that needs styling?**
   - Use `Container`.

2. **Am I presenting information as a Material card?**
   - Use `Card`.

3. **Do I only need space or a fixed size?**
   - Use `SizedBox`.

Choosing widgets based on **intent** rather than just appearance makes Flutter code easier to read, maintain, and extend.

# Container Sizing

## Purpose

A `Container` sizes itself based on its child unless its parent or its own properties impose constraints.

---

## When to Use

Rely on the default sizing when you want the container to wrap its content naturally.

---

## When NOT to Use

Don't expect a `Container` to always wrap its child. Its final size depends on the constraints provided by its parent.

---

## Example

```dart
Container(
  color: Colors.blue,
  child: Text("Player X"),
)
```

If the parent allows it, the container will be just large enough to hold the text.

---

## Mental Model

> A `Container` doesn't decide its size in isolation—it negotiates its size with its parent based on the available constraints.

---

## Common Mistakes

- Assuming `Container` always wraps its child.
- Setting `width: double.infinity` and expecting it to shrink.
- Forgetting that the parent widget controls the available space.

# Scaffold Body Constraints

## Purpose

`Scaffold` provides the main visual structure for a Material Design screen. Its `body` occupies all available space below the `AppBar` (and other scaffold elements like `bottomNavigationBar` if present).

---

## When to Use

Use the `body` to place the primary content of your screen.

---

## When NOT to Assume

Do not assume that widgets placed directly in the `body` will automatically size themselves to their content.

The `Scaffold` gives its body the full available screen space.

---

## Example

```dart
Scaffold(
  appBar: AppBar(title: Text('Game')),
  body: Container(
    color: Colors.cyan,
    child: Text('Hello'),
  ),
)
```

The `Container` receives the full body area from the `Scaffold`, so its background color fills the screen.

---

## Mental Model

> The `Scaffold` says: "This space is yours. Decide how to use it."

---

## Common Mistakes

- Expecting the `body` to wrap its child's size.
- Assuming the child alone decides its dimensions.
- Forgetting that Flutter layouts are driven by parent constraints.

# AppColors

## Purpose

Centralize all application colors in one place to improve consistency and maintainability.

---

## When to Use

Use an `AppColors` class when your application has custom colors that are reused across multiple screens or widgets.

---

## When NOT to Use

Avoid creating an `AppColors` file for a quick prototype with only one or two temporary colors. Flutter's built-in `Colors` class is sufficient for simple cases.

---

## Example

```dart
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFFFF006E);
  static const Color boardBackground = Color(0xFFFFFFFF);
  static const Color tileBackground = Color(0xFFFF006E);
}
```

Usage:

```dart
Container(
  color: AppColors.boardBackground,
)
```

---

## Mental Model

> `AppColors` is the application's paint palette. Every widget should pick its colors from this palette instead of mixing its own paint.

---

## Common Mistakes

- Hardcoding color values throughout the application.
- Using different shades of the same color without a clear reason.
- Naming colors by appearance (`pinkColor`) instead of purpose (`primary`, `tileBackground`, `error`).

# Padding Around Text

## Purpose

Add space around a `Text` widget without changing its appearance.

---

## When to Use

- Create space between text and surrounding widgets.
- Improve readability.
- Match a design's spacing requirements.

---

## When NOT to Use

Do not look for a `padding` property in `TextStyle`. `TextStyle` only controls the visual appearance of the text.

---

## Example

```dart
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child: Text(
    'Match Arena',
    style: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
  ),
)
```

---

## Mental Model

> `TextStyle` paints the text. `Padding` positions the text.

---

## Common Mistakes

- Trying to add `padding` to `TextStyle`.
- Using spaces (`"   Hello"`) to simulate padding.
- Wrapping text in a `Container` only to add padding when a `Padding` widget is sufficient.


# Border Radius on a Container

## Purpose

Round the corners of a `Container` by applying a `BoxDecoration`.

---

## When to Use

Use `BoxDecoration` when you need to style a `Container` with:

- Background color
- Rounded corners
- Borders
- Shadows
- Gradients
- Background images

---

## When NOT to Use

Do not use the `color` property of `Container` together with the `decoration` property.

If a `Container` has a `decoration`, specify the color inside `BoxDecoration`.

---

## Example

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
  ),
)
```

Round only selected corners:

```dart
Container(
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(16),
      topRight: Radius.circular(16),
    ),
  ),
)
```

---

## Mental Model

> `Container` defines the box.
>
> `BoxDecoration` defines how the box looks.

---

## Common Mistakes

- Using `Container.color` together with `decoration`.
- Looking for a `borderRadius` property directly on `Container`.
- Forgetting that `borderRadius` belongs to `BoxDecoration`.



