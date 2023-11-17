import 'package:flutter/material.dart';

class NumBackground extends StatelessWidget {
  final Widget child;

  const NumBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.71, -0.71),
            end: Alignment(-0.71, 0.71),
            colors: [Color(0xEEABDCFF), Color(0xEE0396FF)],
          ),
        ),
        child: child,
      ),
    );
  }
}
