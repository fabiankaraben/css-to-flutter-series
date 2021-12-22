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
            // OutlinedButton(
            //   onPressed: () {},
            //   child: const Text("Some Top Content"),
            // ),
            // const SizedBox(height: 10),
            BubblyButton(
              child: const Text(
                "Click me!",
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                //
              },
            ),
            // const SizedBox(height: 10),
            // const Text("Some Bottom Content"),
            // OutlinedButton(
            //   onPressed: () {},
            //   child: const Text("Some Bottom Content"),
            // ),
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
  State<BubblyButton> createState() => _BubblyButtonState();
}

class _BubblyButtonState extends State<BubblyButton>
    with SingleTickerProviderStateMixin {
  // Input configuration
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

    _buttonColor = widget.color;
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
          onTapDown: (details) {
            setState(() {
              buttonScale = .93;
            });
          },
          child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: buttonScale,
            child: Container(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    buttonScale = 1;

                    _animationController.reset();
                    _animationController.forward();

                    widget.onPressed();
                  });
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
