import 'constants.dart';
import 'package:flutter/material.dart';

class CardChildMaterial extends StatelessWidget {
  CardChildMaterial({@required this.icon, this.text});
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
        ),
        SizedBox(
          height: 15,
        ),
        Text(text, style: kTextTextStyle)
      ],
    );
  }
}
