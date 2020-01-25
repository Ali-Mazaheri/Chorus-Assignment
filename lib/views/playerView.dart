import 'package:assignment/widgets/chorusBottomLogoWidget.dart';
import 'package:assignment/widgets/transcriptsWidget.dart';
import 'package:assignment/widgets/videoPlayerWidget.dart';
import 'package:flutter/material.dart';

class PlayerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(35, 123, 31, 0),
        color: Color.fromARGB(255, 0xf7, 0xf7, 0xf7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    color: Colors.white,
                    height: 608,
                    width: 348,
                    padding: EdgeInsets.fromLTRB(34, 0, 24, 0),
                    child: Column(children: <Widget>[
                      VideoPlayerWidget(),
                      TranscriptsWidget()
                    ]))
              ],
            ),
            ChorusBottomLogoWidget()
          ],
        ));
  }
}
