import 'package:assignment/models/transcriptModel.dart';
import 'package:assignment/viewModels/viewModel.dart';
import 'package:flutter/cupertino.dart';

class TranscriptsWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TranscriptsWidget();
  }
}

class _TranscriptsWidget extends State<TranscriptsWidget> {
  String speaker = '';
  String transcript = '';
  
  _TranscriptsWidget() {
    ViewModel().loadTranscript();
    ViewModel().subscribeForVideoProgression(_update);
  }

  _update(TranscriptModel item) {
    setState(() {
    speaker = item.speaker;
    transcript = item.snippet;
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.fromLTRB(0, 23, 0, 0),
                child: Text(this.speaker,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'NotoSans-Regular',
                      fontSize: 12,
                      color: Color.fromARGB(255, 51, 51, 51),
                    )))),
        Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0xf7, 0xf7, 0xf7),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            height: 39,
            margin: EdgeInsets.fromLTRB(10, 22, 0, 0),
            child: Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 0, 0),
                child: Text(this.transcript,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      backgroundColor: Color.fromARGB(255, 0xf7, 0xf7, 0xf7),
                      fontFamily: 'NotoSans-Regular',
                      fontSize: 12,
                      color: Color.fromARGB(255, 51, 51, 51),
                    )))),
        Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0xf7, 0xf7, 0xf7),
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            height: 175,
            margin: EdgeInsets.fromLTRB(10, 22, 0, 0),
            child: Padding(
                padding: EdgeInsets.fromLTRB(8, 12, 0, 0),
                child: Text('Touch the video to start or pause',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'NotoSans-Regular',
                      backgroundColor: Color.fromARGB(255, 0xf7, 0xf7, 0xf7),
                      fontSize: 12,
                      color: Color.fromARGB(255, 51, 51, 51),
                    )))),
      ],
    );
  }
}
