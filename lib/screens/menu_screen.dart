import 'package:ani_challenge/screens/card_challenge.dart';
import 'package:ani_challenge/screens/first_challenge.dart';
import 'package:ani_challenge/screens/last_challenge.dart';
import 'package:ani_challenge/screens/pomodoro.dart';
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
              child: const Text('First Challenge (Explicit)'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const FirstChallengeRefactor(),
                );
              },
              child: const Text('First Challenge(Implicit)'),
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
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const Pomodoro(),
                );
              },
              child: const Text('Pomodoro'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const CardChallenge(),
                );
              },
              child: const Text('Card Challenge'),
            ),
            ElevatedButton(
              onPressed: () {
                _goToPage(
                  context,
                  const LastChallenge(),
                );
              },
              child: const Text('The Last Challenge'),
            ),
          ],
        ),
      ),
    );
  }
}
