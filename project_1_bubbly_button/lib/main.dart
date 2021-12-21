import 'package:flutter/material.dart';

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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const Text("Some Top Content"),
            BubblyButton(
              child: const Text(
                "Click me!",
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                //
              },
            ),
            // const Text("Some Bottom Content"),
          ],
        ),
      ),
    );
  }
}

class BubblyButton extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget child;

  const BubblyButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  State<BubblyButton> createState() => _BubblyButtonState();
}

class _BubblyButtonState extends State<BubblyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  var buttonPadding = const EdgeInsets.symmetric(vertical: 16, horizontal: 32);

  var buttonScale = 1.0;

  static const Color fuschia = Color(0xffff0081);
  static const Color buttonBg = fuschia;
  static const Color buttonTextColor = Color(0xffffffff);
  static const Color babyBlue = Color(0xfff8faff);

  late CurvedAnimation _offsetCurvedAnimation;
  late final Animation<double> _scaleAnimation;

  final bubbleWidth = 12;

  @override
  void initState() {
    super.initState();

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
                    color: fuschia,
                    width: bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(0, -.3),
                    slideEndOffset: const Offset(-5, -.5),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * 1.4,
                    filled: false,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(0, -.3),
                    slideEndOffset: const Offset(-2.5, -1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3, -.3),
                    slideEndOffset: const Offset(-6, -.8),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .7,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3, -.3),
                    slideEndOffset: const Offset(-2.8, -1.3),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .6,
                    filled: false,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3.5, -.3),
                    slideEndOffset: const Offset(-2.9, -1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .4,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-8, -.3),
                    slideEndOffset: const Offset(-10, -1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .5,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-6, -.3),
                    slideEndOffset: const Offset(-2, -.8),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .5,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(-3, -.3),
                    slideEndOffset: const Offset(0, -1.2),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .8,
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
                    color: fuschia,
                    width: bubbleWidth * .5,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(0, .3),
                    slideEndOffset: const Offset(-5, 1.2),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(1, .3),
                    slideEndOffset: const Offset(-2, 1.2),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .5,
                    filled: false,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(2, .3),
                    slideEndOffset: const Offset(0, .9),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .8,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(3, .3),
                    slideEndOffset: const Offset(0, 1.4),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .6,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(4.5, .3),
                    slideEndOffset: const Offset(3, 1.1),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .4,
                    filled: true,
                    slideAnimation: _offsetCurvedAnimation,
                    slideBeginOffset: const Offset(3, .3),
                    slideEndOffset: const Offset(10, 1.0),
                    scaleAnimation: _scaleAnimation,
                  ),
                  _AnimatedCircle(
                    color: fuschia,
                    width: bubbleWidth * .7,
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
          onTapDown: (details) {
            setState(() {
              buttonScale = .9;
            });
          },
          onTapUp: (details) {
            setState(() {
              buttonScale = 1;

              _animationController.reset();
              _animationController.forward();
            });
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: buttonScale,
            child: Container(
              constraints: BoxConstraints(minWidth: bubbleWidth * 9),
              padding: buttonPadding,
              decoration: BoxDecoration(
                  color:
                      buttonScale == 1.0 ? buttonBg : const Color(0xffe60074),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(
                        255,
                        0,
                        130,
                        buttonScale == 1.0 ? .5 : .3,
                      ),
                      offset: const Offset(0.0, 2.0),
                      blurRadius: 25.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: buttonTextColor,
                  fontSize: 16,
                ),
                child: widget.child,
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
