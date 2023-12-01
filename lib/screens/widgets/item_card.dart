import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.category,
    this.backgroundColor = const Color(0xfff8f5f5),
    this.isFavorite = false,
    required this.onTap,
  });

  final Color backgroundColor;
  final String imagePath;
  final bool isFavorite;
  final String title;
  final String category;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 260,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0,
            ),
          ),
          color: backgroundColor,
          elevation: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      const SizedBox(
                        width: 1000,
                        height: 160,
                      ),
                      SizedBox(
                        height: 160,
                        width: 1000,
                        child: Card(
                          margin: EdgeInsets.zero,
                          clipBehavior: Clip.antiAlias,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide:
                                  const BorderSide(color: Colors.transparent)),
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.asset(imagePath),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      category,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(color: Colors.black38),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xFF101C57),
                        ),
                        foregroundColor: MaterialStateColor.resolveWith(
                          (states) => const Color(0xFFFFFFFF),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                      ),
                      child: const Text('dkfl;j'),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
