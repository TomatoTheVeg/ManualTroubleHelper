import 'package:continental_manual_helper/models/problem.dart';

class Message {
  final String text;
  final bool isMe;
  final String timeSent;
  final List<Problem>? problems;

  Message({
    this.problems,
    required this.text,
    required this.isMe,
    required this.timeSent,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'],
      isMe: json['isMe'] as bool,
      timeSent: json['timeSent'],
      problems: (json['problems'] as List<dynamic>?)
          ?.map((problemJson) =>
              Problem.fromJson(problemJson as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'isMe': isMe,
      'timeSent': timeSent,
      'problems': problems,
    };
  }
}
