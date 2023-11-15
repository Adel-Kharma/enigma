import 'package:enigma/shared/components/constants.dart';
import 'package:flutter/material.dart';

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
        hintStyle: TextStyle(color: const Color(0xff767676).withOpacity(0.5)),
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


Widget roundedButton ({
  required String text,
  required Color textColor,
  required Color backgroundColor,
})
{
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(45),
      color: backgroundColor
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
      child: Text(text, style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold
      ),
      ),
    ),
  );
}