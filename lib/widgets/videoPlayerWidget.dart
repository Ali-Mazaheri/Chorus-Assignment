import 'package:assignment/viewModels/viewModel.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController cont = VideoPlayerController.network(
      "https://static.chorus.ai/api/4d79041e-f25f-421d-9e5f-3462459b9934.mp4");

  VideoPlayerWidget() {
    this.cont.initialize();
    cont.addListener(() {
      this.cont.position.then((duration) {
        if (this.cont.value.position.inMilliseconds ==
            this.cont.value.duration.inMilliseconds) {
          this.cont.pause();
          this.cont.seekTo(new Duration());
        }
        ViewModel().notify(this.cont.value.position.inSeconds);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.fromLTRB(0, 42, 0, 5),
              child: Text('Moment from meeting with two pillars',
                  style: TextStyle(
                    fontFamily: 'NotoSans-Regular',
                    fontSize: 12,
                    color: Color.fromARGB(255, 0x33, 0x33, 0x33),
                  ))),
          Container(
              decoration:
                  BoxDecoration(color: Colors.orange, border: Border.all()),
              height: 203,
              width: double.infinity,
              child: GestureDetector(
                onTap: () {
                  if (cont.value.isPlaying) {
                    cont.pause();
                  } else {
                    cont.play();
                  }
                },
                child: VideoPlayer(this.cont),
              ))
        ]);
  }
}
