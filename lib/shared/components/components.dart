import 'package:enigma/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget searchBar({
  TextEditingController? controller,
  String text = 'ابحث عن ...',
  TextInputType? keyboardType,
  //String? Function(String?)? validator,
  Widget? suffix,
  bool obscure = false,
  IconData? prefixIcon = Icons.search,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28),
    child: TextFormField(
      controller: controller,
      obscureText: obscure,
      //validator: validator,
      keyboardType: keyboardType,
      cursorColor: primaryColor.withOpacity(.8),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF4F3FD),
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xff767676).withOpacity(0.5),
        ),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? primaryColor
                : Colors.grey),
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: text,
        hintStyle: TextStyle(
            color: const Color(0xff767676).withOpacity(0.5),
            fontFamily: 'Cairo'),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.8), width: 1.8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffF4F3FD), width: 0),
        ),
      ),
    ),
  );
}

Widget roundedButton({
  required String text,
  required Color textColor,
  required Color backgroundColor,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45), color: backgroundColor),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.bold, fontFamily: 'Cairo'),
      ),
    ),
  );
}

Widget doneCard(
    {required Color color,
    required String image,
    required int stars,
    required String title,
    required String subtitle}) {
  return Container(
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff0f0f0),
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(
                    Icons.star_border_rounded,
                    color: Color(0xfff0f0f0),
                  ),
                  const Icon(
                    Icons.star_border_rounded,
                    color: Color(0xfff0f0f0),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffFF8504),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffFF8504),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffFF8504),
                  ),
                  // SizedBox(
                  //   width: 6,
                  // )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Color(0xfff0f0f0),
                      fontSize: 10),
                ),
              )
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: Color(0xffFF8504),
                  borderRadius: BorderRadius.circular(45)),
              height: 66,
              width: 66,
              child: Image.asset(
                image,
                height: 60,
                width: 60,
              ))
        ],
      ));
}

Widget progressCard({
  required String title,
  required String subtitle,
  required String image,
  required double percent,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xfff9f9f9),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        color: Color(0xff181C71),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff181C71),
                    size: 13,
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 17,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                        color: Color(0xff767676),
                        fontSize: 8,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 135,
                  ),
                  Text(
                    '${(percent * 100).toInt()}%',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 7,
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: LinearPercentIndicator(
                      barRadius: Radius.circular(45),
                      percent: percent,
                      animation: true,
                      lineHeight: 10,
                      progressColor: Colors.lightGreenAccent,
                      width: 170,
                      backgroundColor: Color(0xffe0e0e0),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              height: 103,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                'assets/images/progress_screen_test_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
