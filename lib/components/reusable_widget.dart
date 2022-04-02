import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCart extends StatelessWidget {
  ReusableCart({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, this.onTouch});
  final IconData icon;
  final Function onTouch;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTouch,
      // To make it rectangle uncomment below line of code
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: kButtonColor,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.onTap, this.buttonTitle});

  final Function onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kCalculateTextStyle,
          ),
        ),
        color: kBottomContainerColor,
        // Uncomment if working with an iPhone
        // padding: EdgeInsets.only(bottom: 20),
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
