import 'dart:convert';

import 'package:continental_manual_helper/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class ChatMessagesNotifier extends StateNotifier<List<Message>> {
  ChatMessagesNotifier()
      : super([
          Message(
            text: "Hello, user! How can i help you?",
            isMe: false,
            timeSent: DateTime.now().toString(),
          )
        ]);

  // void getMessages() async {
  //   final response =
  //       await http.get(Uri.parse("https://manual.sunjet-project.de/chat"));
  //   if (response.statusCode == 200) {
  //     final List<dynamic> responseData = json.decode(response.body);
  //     final List<Message> messages =
  //         responseData.map((json) => Message.fromJson(json)).toList();
  //     state = messages;
  //   } else {
  //     throw Exception('Failed to load messages');
  //   }
  // }

  void addMessage(Message message, BuildContext context) async {
    state = [...state, message];
    final response = await http.post(
      Uri.parse("https://manual.sunjet-project.de/chat/search"),
      headers: {
        'Content-Type': 'application/json', // Set the content type to JSON
      },
      body: jsonEncode(message.toJson()),
    );
    final responseBody = jsonDecode(response.body) as List<dynamic>;
    for (Map<String, dynamic> element in responseBody) {
      state = [
        ...state,
        Message.fromJson(element),
      ];
    }
    if (response.statusCode != 200) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response.reasonPhrase!,
          ),
        ),
      );
    }

    // getMessages();
  }

  void clearMessages() async {
    await http.delete(Uri.parse("uri"));
    // getMessages();
  }
}

final chatMessagesProvider =
    StateNotifierProvider<ChatMessagesNotifier, List<Message>>(
        (ref) => ChatMessagesNotifier());
