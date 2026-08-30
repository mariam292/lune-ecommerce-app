import 'package:flutter/material.dart';

class Elevatedbutton extends StatelessWidget {
  const Elevatedbutton({
    super.key,
    required this.buttontext,
    required this.btntextstyle,
    required this.buttoncolor,
  });
  final String buttontext;
  final TextStyle btntextstyle;
  final Color buttoncolor;

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
        onPressed: () {},
        child: Text(buttontext, style: btntextstyle),
      ),
    );
  }
}
