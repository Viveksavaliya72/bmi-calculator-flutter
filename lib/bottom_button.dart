import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({ @required this.buttonName,@required this.onTap,});

  final Function onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        child: Center(
          child: Text(buttonName,
            style: kLargeText,
          ),
        ),
        height: kbottomContainerHeight,
        width: double.infinity,
        color:kbottomContainerColour ,
      ),
    );
  }
}