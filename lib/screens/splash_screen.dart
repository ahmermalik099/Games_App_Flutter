/// Demonstrates playing a one-shot animation on demand

import 'package:flutter/material.dart';
import 'package:games_api/main.dart';
import 'package:games_api/screens/homepage.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(MaterialApp(home: PlayOneShotAnimation()));
}

class PlayOneShotAnimation extends StatefulWidget {
  const PlayOneShotAnimation({Key? key}) : super(key: key);

  @override
  _PlayOneShotAnimationState createState() => _PlayOneShotAnimationState();
}

class _PlayOneShotAnimationState extends State<PlayOneShotAnimation> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
    _afterSplash();
  }

  void _afterSplash() async {
    await Future.delayed(const Duration(seconds: 1), () {});
// ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RiveAnimation.network(
          'https://cdn.rive.app/animations/vehicles.riv',
          animations: const ['idle', 'curves'],
          controllers: [_controller],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   // disable the button while playing the animation
      //   onPressed: () => _isPlaying ? null : _controller.isActive = true,
      //   tooltip: 'Play',
      //   child: const Icon(Icons.arrow_upward),
      // ),
    );
  }
}

