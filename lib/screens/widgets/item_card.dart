import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  ItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.newPrice,
    required this.category,
    this.backgroundColor = const Color(0xfff8f5f5),
    this.isFavorite = false,
    this.saleText = '',
    this.oldPrice = '',
    required this.onTap,
  });

  final Color backgroundColor;
  final String image;
  final bool isFavorite;
  final String saleText;
  final String title;
  final String category;
  final String oldPrice;
  final String newPrice;
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
                            child: Image.asset(image),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: (saleText == ''
                                ? Colors.transparent
                                : Colors.red),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              saleText,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          borderRadius: BorderRadius.circular(18.0),
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
