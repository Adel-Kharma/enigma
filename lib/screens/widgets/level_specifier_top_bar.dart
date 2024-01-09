import 'package:flutter/material.dart';

class LevelSpecifierTopBar extends StatelessWidget {
  final int index;

  LevelSpecifierTopBar({
    super.key,
    required this.index,
    this.onSec1,
    this.onSec2,
  });

  Color _selectedColor = const Color(0xFFF9F9F9);
  Color _unselectedColor = const Color(0xFF181C71);
  final Function? onSec1;
  final Function? onSec2;

  @override
  Widget build(BuildContext context) {
    if (index == 1) {
      _selectedColor = const Color(0xFF181C71);
      _unselectedColor = const Color(0xFFF9F9F9);
    }

    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 52,
          decoration: const ShapeDecoration(
            color: Color(0xFFF9F9F9),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  highlightColor: Colors.cyan,
                  onTap: () {
                    onSec2!();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: ShapeDecoration(
                      color: _selectedColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'تدريبات ونشاطات',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _unselectedColor,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                InkWell(
                  highlightColor: Colors.cyan,
                  onTap: () {
                    onSec1!();
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    decoration: ShapeDecoration(
                      color: _unselectedColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'دروس تعليميّة',
                      style: TextStyle(
                        color: _selectedColor,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 3,
          right: 3,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
