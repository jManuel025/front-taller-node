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
    return type == Type.primary
        ? (ElevatedButton(
            style: ButtonStyle(
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
          ))
        : (OutlinedButton(
            style: ButtonStyle(
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
          ));
  }
}
