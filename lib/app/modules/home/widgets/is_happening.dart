import 'package:flutter/material.dart';

class IsHappening extends StatelessWidget {
  const IsHappening({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/icon_chat.png',
        ),
        const SizedBox(
          width: 10,
        ),
        const Text(
          'Está acontecendo...',
          style: TextStyle(
            fontSize: 20,
            color: Colors.indigo,
          ),
        ),
      ],
    );
  }
}
