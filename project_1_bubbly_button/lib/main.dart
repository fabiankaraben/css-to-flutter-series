import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSS to Flutter #1 - Bubbly Button',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExampleLayout(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BubblyButton(
              child: const Text("Click me!"),
              onPressed: () async {
                //
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BubblyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color textColor;
  final Color shadowColor;
  final double bubbleWidth;
  final Color bubbleColor;

  const BubblyButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.color = const Color(0xffff0081),
    this.textColor = Colors.white,
    this.bubbleWidth = 12,
    this.shadowColor = const Color(0xffff0082),
    this.bubbleColor = const Color(0xffff0081),
  }) : super(key: key);

  @override
  _BubblyButtonState createState() => _BubblyButtonState();
}

class _BubblyButtonState extends State<BubblyButton>
    with SingleTickerProviderStateMixin {
  // Input configuration values
  late final Color _buttonColor;
  late final Color _textColor;
  late final double _bubbleWidth;
  late final Color _shadowColor;
  late final Color _bubbleColor;

  // Variable for implicit button animation
  var buttonScale = 1.0;

  // Variables for explicit bubble animation
  late AnimationController _animationController;
  late final CurvedAnimation _offsetCurvedAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _buttonColor = widget.bubbleColor;
    _textColor = widget.textColor;
    _bubbleWidth = widget.bubbleWidth;
    _shadowColor = widget.shadowColor;
    _bubbleColor = widget.bubbleColor;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _offsetCurvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInQuad,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Stack(
            children: [
              //
              // Top bubbles
              //
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(0.5, -.3),
                    slideEndOffset: const Offset(-5, -.5),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * 1.4,
                    filled: false,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(0, -.3),
                    slideEndOffset: const Offset(-2.5, -1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3, -.3),
                    slideEndOffset: const Offset(-6, -.8),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .7,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3, -.3),
                    slideEndOffset: const Offset(-2.8, -1.3),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .6,
                    filled: false,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3.5, -.3),
                    slideEndOffset: const Offset(-2.9, -1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .4,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-8, -.3),
                    slideEndOffset: const Offset(-10, -1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .5,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-6, -.3),
                    slideEndOffset: const Offset(-2, -.8),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .5,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3, -.3),
                    slideEndOffset: const Offset(0, -1.2),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .8,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3, -.3),
                    slideEndOffset: const Offset(2, -1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                ],
              ),
              //
              // Bottom bubbles
              //
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .5,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(0, .3),
                    slideEndOffset: const Offset(-5, 1.2),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(1, .3),
                    slideEndOffset: const Offset(-2, 1.2),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .5,
                    filled: false,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(2, .3),
                    slideEndOffset: const Offset(0, .9),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .8,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(3, .3),
                    slideEndOffset: const Offset(0, 1.4),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(4.5, .3),
                    slideEndOffset: const Offset(3, 1.1),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .4,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(3, .3),
                    slideEndOffset: const Offset(10, 1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: _bubbleColor,
                    width: _bubbleWidth * .7,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(0, .3),
                    slideEndOffset: const Offset(7, .5),
                    scaleAnimation: _scaleAnimation,
                  ),
                ],
              ),
            ],
          ),
        ),
        GestureDetector(
          onTapDown: (_) {
            setState(() {
              buttonScale = .93;
            });
          },
          child: AnimatedScale(
            duration: const Duration(microseconds: 100),
            scale: buttonScale,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    buttonScale = 1;
                  });

                  _animationController.reset();
                  _animationController.forward();

                  widget.onPressed();
                },
                child: DefaultTextStyle(
                  style: TextStyle(
                    color: _textColor,
                    fontSize: 16,
                  ),
                  child: widget.child,
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: _buttonColor,
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 32,
                  ),
                  minimumSize: Size(_bubbleWidth * 9, 16),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                boxShadow: [
                  BoxShadow(
                    color: _shadowColor.withOpacity(
                      buttonScale == 1.0 ? .5 : .3,
                    ),
                    offset: const Offset(0.0, 2.0),
                    blurRadius: 25.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AnimatedCircle extends StatelessWidget {
  final Color color;
  final double width;
  final bool filled;
  final Animation<double> slideAnimation;
  final Offset slideBeginOffset;
  final Offset slideEndOffset;
  final Animation<double> scaleAnimation;

  const _AnimatedCircle({
    Key? key,
    required this.color,
    this.width = double.infinity,
    this.filled = true,
    required this.slideAnimation,
    required this.slideBeginOffset,
    required this.slideEndOffset,
    required this.scaleAnimation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slidePosition = Tween<Offset>(
      begin: slideBeginOffset,
      end: slideEndOffset,
    ).animate(slideAnimation);

    return SlideTransition(
      position: slidePosition,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: filled ? color : null,
            border: !filled ? Border.all(color: color, width: 1) : null,
          ),
        ),
      ),
    );
  }
}

//
// The following widgets are only for organizing this example app.
//

class ExampleLayout extends StatelessWidget {
  final Widget child;

  const ExampleLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const ExampleHeader(),
            child,
            const ExampleFooter(),
          ],
        ),
      ),
    );
  }
}

class ExampleHeader extends StatelessWidget {
  const ExampleHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Text(
          'Bubbly Button 100% Dart for Flutter',
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 70),
      ],
    );
  }
}

class ExampleFooter extends StatelessWidget {
  const ExampleFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 70),
        Text(
          'Please consider supporting me',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 20),
        TextButton(
          child: Image.memory(
            base64Decode(
              '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G2DkmEcZGmTXD/4Hv7u18hPjXlI4DrS/OM7HEBDaBepVx/k+dpz6CRB8Bq70pr9cA6Y/Sa82tegR0LMNXFw3NWUPuNwB+p8M2ZRdKUhTyOeB9zP6pizQewt0rnq9NfZx+gCkqavkDXBwCAwXKHvN590drb39e6bR3w9I3HKW4WBXWwAADRppVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+Cjx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IlhNUCBDb3JlIDQuNC4wLUV4aXYyIj4KIDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+CiAgPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIKICAgIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIgogICAgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIKICAgIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIKICAgIHhtbG5zOkdJTVA9Imh0dHA6Ly93d3cuZ2ltcC5vcmcveG1wLyIKICAgIHhtbG5zOnRpZmY9Imh0dHA6Ly9ucy5hZG9iZS5jb20vdGlmZi8xLjAvIgogICAgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIgogICB4bXBNTTpEb2N1bWVudElEPSJnaW1wOmRvY2lkOmdpbXA6NWZiNGM5MjItMWZkZC00MzI5LTlhNDktNjNlZWM0ZjNmNzQ1IgogICB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjU0MzAxMDk0LWE0NDEtNGJmYy1iN2I1LTY4ZWYwY2QwMjZhMiIKICAgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjUyZGY5NjlhLTcxOTMtNGU3Ni1iMjE3LTlkYmQ4MDBjZDAxNSIKICAgZGM6Rm9ybWF0PSJpbWFnZS9wbmciCiAgIEdJTVA6QVBJPSIyLjAiCiAgIEdJTVA6UGxhdGZvcm09IkxpbnV4IgogICBHSU1QOlRpbWVTdGFtcD0iMTY0MDIyMDE3NTQzNDgxMCIKICAgR0lNUDpWZXJzaW9uPSIyLjEwLjI0IgogICB0aWZmOk9yaWVudGF0aW9uPSIxIgogICB4bXA6Q3JlYXRvclRvb2w9IkdJTVAgMi4xMCI+CiAgIDx4bXBNTTpIaXN0b3J5PgogICAgPHJkZjpTZXE+CiAgICAgPHJkZjpsaQogICAgICBzdEV2dDphY3Rpb249InNhdmVkIgogICAgICBzdEV2dDpjaGFuZ2VkPSIvIgogICAgICBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjQ1NjkyYzRiLWYwZWUtNDNiNi1iN2ExLTBlMmFlNmZmZTMzZSIKICAgICAgc3RFdnQ6c29mdHdhcmVBZ2VudD0iR2ltcCAyLjEwIChMaW51eCkiCiAgICAgIHN0RXZ0OndoZW49IjIwMjEtMTItMjJUMjE6NDI6NTUtMDM6MDAiLz4KICAgIDwvcmRmOlNlcT4KICAgPC94bXBNTTpIaXN0b3J5PgogIDwvcmRmOkRlc2NyaXB0aW9uPgogPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCiAgICAgICAgICAgICAgICAgICAgICAgICAgIAo8P3hwYWNrZXQgZW5kPSJ3Ij8+xk31EwAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAAd0SU1FB+UMFwAqN1W1y5EAABi5SURBVHja7Z13gBTl+cc/U7a32+uNOzpyimJBxIKAChbsBWONiSZqLD9L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',
            ),
          ),
          onPressed: () async {
            const _url = "https://www.buymeacoffee.com/fabiankaraben";
            if (!await launch(_url)) throw 'Could not launch $_url';
          },
        ),
        const SizedBox(height: 30),
        const Text('Original CSS and JavaScript code'),
        const SizedBox(height: 10),
        TextButton(
          child: const Text('CSS Bubbly Button'),
          onPressed: () async {
            const _url = "https://codepen.io/nourabusoud/pen/ypZzMM";
            if (!await launch(_url)) throw 'Could not launch $_url';
          },
        ),
        const SizedBox(height: 50),
      ],
    );
  }
}
