import 'package:flutter/material.dart';

enum Type { primary, secondary }

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Type type;

  CustomButton({
    this.text,
    this.onPressed,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Map<Type, Widget> button = {
      Type.primary: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).accentColor,
          ),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(size.width * 0.40, 48.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      Type.secondary: OutlinedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0))),
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: Theme.of(context).primaryColor)),
          minimumSize: MaterialStateProperty.all<Size>(
            Size(size.width * 0.40, 48.0),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    };
    return button[type];
  }
}
