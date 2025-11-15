import 'package:flutter/material.dart';

class Customtextformfeild extends StatelessWidget {
  const Customtextformfeild({
    super.key,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.validator,
    this.suffixWidget,
    this.keyboardType,
  });
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final String labelText;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 3),
          SizedBox(
            child: TextFormField(
              keyboardType: keyboardType,
              validator: validator,
              onChanged: onChanged,
              cursorColor: const Color.fromARGB(255, 97, 96, 96),
              cursorHeight: 18,
              decoration: InputDecoration(
                helperText: " ",
                hintText: hintText,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                contentPadding: EdgeInsets.only(top: 10, left: 10),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 107, 106, 106),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: suffixWidget,
              ),
              style: TextStyle(fontSize: 13.0),
            ),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
