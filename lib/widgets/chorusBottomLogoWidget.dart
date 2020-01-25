import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChorusBottomLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
      child:
          SvgPicture.network("https://static.chorus.ai/images/chorus-logo.svg"),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Color.fromARGB(255, 47, 169, 214), width: 5))),
    );
  }
}
