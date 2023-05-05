import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:lottie/lottie.dart';

class RotationAnimation extends StatefulWidget {
  const RotationAnimation({Key? key}) : super(key: key);

  static final dimensionsTween = Tween<double>(begin: 100.0, end: 200.0);

  @override
  State<RotationAnimation> createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation> {
  bool _bigger = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Implicit Animation')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _bigger = !_bigger;
        }),
      ),
      body: LottieAnimationExample(),
    );
  }

  AnimatedContainer _containerAnimation() {
    return AnimatedContainer(
      decoration: BoxDecoration(
          gradient: RadialGradient(
              colors: [Colors.yellow, Colors.transparent],
              stops: [_bigger ? 0.2 : 0.5, 1.0])),
      width: _bigger ? 100 : 900,
      duration: const Duration(seconds: 1),
      //curve: Curves.bounceIn,
      //curve: Curves.bounceIn,
      //curve: Curves.bounceInOut,
      //curve: Curves.easeInCubic,
      //child: Text('Checkl'),
      child: Image.asset('assets/stars.png'),
    );
  }
}

class RotateLogo extends StatefulWidget {
  @override
  _RotateLogoState createState() => _RotateLogoState();
}

class _RotateLogoState extends State<RotateLogo>
    with SingleTickerProviderStateMixin {
  /*

  In Flutter, the SingleTickerProviderStateMixin is a mixin that provides a single-tick animation controller.
  It is often used in combination with the StatefulWidget class to create widgets that can be animated.
  The SingleTickerProviderStateMixin provides a single AnimationController to its
  subclass and is useful when building widgets that only need to run a single animation. 
  For example, you might use it to create an animation that runs when a widget is first 
  displayed or when a user interacts with the widget in some way.
   */
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 8),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: SizedBox(
        width: 200.0,
        height: 100.0,
        child: Image.asset("assets/stars.png"),
      ),
      builder: (context, child) {
        return SizedBox(
          child: Transform.rotate(
            angle: _controller.value * 2.2 * math.pi,
            child: child,
          ),
        );
      },
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderExampleState createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) {
        return Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: const [Colors.purple, Colors.pink, Colors.yellow],
              stops: [0, _controller.value, 1],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.white),
          ),
        );
      },
    );
  }
}

class GradientTransition extends AnimatedWidget {
  final Animation<double> stop;

  const GradientTransition({
    Key? key,
    required this.stop,
  }) : super(key: key, listenable: stop);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [Colors.purple, Colors.pink, Colors.yellow],
          stops: [0, stop.value, 1],
        ),
      ),
    );
  }
}

class LottieAnimationExample extends StatefulWidget {
  @override
  LottieAnimationExampleState createState() => LottieAnimationExampleState();
}

class LottieAnimationExampleState extends State<LottieAnimationExample>
    with TickerProviderStateMixin {
  late AnimationController _lottieAnimationController;

  @override
  void initState() {
    _lottieAnimationController = AnimationController(vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   'assets/lottie_file.json',
            //   repeat: true,
            //   reverse: true,
            //   animate: true,
            // ),
            Lottie.network(
              'https://assets8.lottiefiles.com/packages/lf20_HX0isy.json',
              repeat: true,
              reverse: true,
              animate: true,
            ),
          ],
        ),
      ),
    );
  }
}
