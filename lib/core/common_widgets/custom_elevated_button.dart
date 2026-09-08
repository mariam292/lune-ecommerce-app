import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({
    super.key,
    required this.buttontext,
    required this.btntextstyle,
    required this.buttoncolor, required this.onpressed,
  });
  final String buttontext;
  final TextStyle btntextstyle;
  final Color buttoncolor;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttoncolor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onpressed,
        child: Text(buttontext, style: btntextstyle),
      ),
    );
  }
}
