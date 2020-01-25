class TranscriptModel {
  String snippet;
  String speaker;
  int timeMs;

  TranscriptModel(this.snippet, this.speaker, this.timeMs);

  factory TranscriptModel.fromJSON(Map<String, dynamic> json) {
    return TranscriptModel(
        json['snippet'], json['speaker'], ( json['time'] as double).toInt());
  }
}