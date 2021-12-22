# CSS to Flutter 1 - Bubbly Button

I found a really nice button in CodePen and decided to port it to Flutter as a practice in my learning about creating animations in Flutter.

## Original CSS code

This is the original CSS code (and a bit of JavaScript) for this button:

[Bubbly Button con CSS](https://codepen.io/nourabusoud/pen/ypZzMM)

## How to use BubblyButton in Flutter?

As simple as:

```dart
BubblyButton(
  child: const Text(
    "Click me!",
  ),
  onPressed: () {
    // Here the button actions
  },
),
```

The result will be:

![bubblyButton1.gif](https://cdn.hashnode.com/res/hashnode/image/upload/v1640131270090/h6fMGo1WX.gif)

The animation works perfectly when the button has other widgets around it, in the following example we can see this.

It is also possible to observe the operation of the button when the focus is received and then the ENTER key is pressed.

```dart
Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    OutlinedButton(
        onPressed: () {},
        child: const Text("Some Top Content"),
    ),
    const SizedBox(height: 10),
    BubblyButton(
      child: const Text(
        "Click me!",
        textAlign: TextAlign.center,
      ),
      onPressed: () {
        //
      },
    ),
    const SizedBox(height: 10),
    OutlinedButton(
      onPressed: () {},
      child: const Text("Some Bottom Content"),
    ),
  ],
)
```

You can even customize the colors and size of the bubbles:

```dart
BubblyButton(
  child: const Text(
    "Click me!",
  ),
  color: Colors.black,
  shadowColor: Colors.black,
  bubbleColor: Colors.pink,
  onPressed: () {
    // Here the button actions
  },
),
``` 

## Live demo of BubblyButton on Flutter

By clicking on the following link, you can see BubblyButton in action:

[BubblyButton en Flutter](https://css-to-flutter.fabdev.win/1-bubbly-button/)
