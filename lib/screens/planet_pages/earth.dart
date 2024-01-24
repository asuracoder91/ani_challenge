import 'package:flutter/material.dart';

class Earth extends StatelessWidget {
  const Earth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return SizedBox(
      width: widthSize - 24,
      height: 400,
      child: const Center(
        child: Text(
          "The Earth",
          style: TextStyle(
            color: Colors.white70,
            fontSize: 36,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.8,
          ),
        ),
      ),
    );
  }
}
