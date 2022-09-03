import 'package:flutter/material.dart';

class FloactionWake extends StatelessWidget {
  final GestureTapCallback? onTap;
  const FloactionWake({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.teal,
        image: DecorationImage(
          image: AssetImage('assets/images/button_fun.png'),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white.withAlpha(100),
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
