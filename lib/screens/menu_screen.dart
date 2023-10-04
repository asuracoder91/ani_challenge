import 'package:ani_challenge/screens/first_challenge.dart';
import 'package:ani_challenge/screens/first_challenge_starting.dart';
import 'package:ani_challenge/screens/second_challenge.dart';
import 'package:flutter/material.dart';

import 'first_challenge_refactor.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _goToPage(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Flutter Animations'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const FirstChallenge(),
                );
              },
              child: const Text('First Challenge'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const FirstChallengeStarting(),
                );
              },
              child: const Text('First Challenge Starting'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const FirstChallengeRefactor(),
                );
              },
              child: const Text('First Challenge(Refactor)'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const SecondChallenge(),
                );
              },
              child: const Text('Second Challenge'),
            ),
          ],
        ),
      ),
    );
  }
}
