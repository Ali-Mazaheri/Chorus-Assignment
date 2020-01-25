import 'dart:convert';
import 'package:assignment/models/transcriptModel.dart';
import 'package:http/http.dart' as http;

class ViewModel {
  static const TRANSCRIPT_ID = '4d79041e-f25f-421d-9e5f-3462459b9934';
  static final ViewModel _vm = new ViewModel._internal();
  final videoProgressionSubscription = [];
  Map<int, TranscriptModel> transcriptMap = {};

  ViewModel._internal();

  factory ViewModel() {
    return _vm;
  }

  subscribeForVideoProgression(callBack) {
    videoProgressionSubscription.add(callBack);
  }

  notify(int time) {
    var item = transcriptMap[time];
    if (item != null) {
      print(time);
      videoProgressionSubscription.forEach((cb) {
        cb(item);
      });
    }
  }

  loadTranscript() async {
    var response =
        await http.get("https://static.chorus.ai/api/$TRANSCRIPT_ID.json");

    if (response.statusCode == 200) {
      List l = json.decode(response.body);
      List<TranscriptModel> transcripts = l.map<TranscriptModel>((item) {
        return TranscriptModel.fromJSON(item);
      }).toList();

      transcripts.sort((a, b) => a.timeMs.compareTo(b.timeMs));

      transcriptMap = Map.fromIterable(transcripts,
          key: (k) => k.timeMs as int, value: (v) => v as TranscriptModel);
    } else {
      throw Exception('Failed to load post');
    }
  }

  readTranscript() {
    Future<String> v = http.read(
        "https://static.chorus.ai/api/4d79041e-f25f-421d-9e5f-3462459b9934.json");
    return v;
  }
}