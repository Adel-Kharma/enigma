import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClosedSection extends StatelessWidget {
  const ClosedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 12),
      child: Container(
          alignment: Alignment.centerRight,
          height: 48,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(1.00, 0.02),
              end: Alignment(-1, -0.02),
              colors: [Color(0xFF1A6EFC), Color(0xCC0961F5)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18, left: 8),
                child: SvgPicture.asset('assets/images/locked.svg'),
              ),
              Text(
                'هذا الدرس مقفل',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xFFE9E9E9),
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w800,
                  height: 0,
                  letterSpacing: -0.48,
                ),
              ),
            ],
          )),
    );
  }
}
