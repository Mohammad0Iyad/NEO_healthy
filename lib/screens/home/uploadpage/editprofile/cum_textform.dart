import 'package:flutter/material.dart';

class CustTextFormSign extends StatelessWidget {
  final String hint;
  final String? Function(String?) valid;
  final Function(String?) onChange;
  final Widget? sufIcon;
  final Widget? prefIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  const CustTextFormSign({
    Key? key,
    this.keyboardType,
    required this.hint,
    this.obscureText,
    required this.onChange,
    required this.valid,
    this.sufIcon,
    this.prefIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        onChanged: onChange,
        validator: valid,
        cursorColor: const Color(0xFFFFCE00),
        decoration: InputDecoration(
          suffixIcon: sufIcon,
          prefixIcon: prefIcon,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Color(0xff8889B9),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFFE4E4F9),
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
