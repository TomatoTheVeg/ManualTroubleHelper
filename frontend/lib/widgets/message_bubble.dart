import 'dart:convert';

import 'package:continental_manual_helper/models/message.dart';
import 'package:continental_manual_helper/models/problem.dart';
import 'package:continental_manual_helper/pages/problem_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MessageBubble extends StatelessWidget {
  const MessageBubble.first(
      {super.key, required this.message, required this.isMe})
      : isFirstInSequence = true;

  const MessageBubble.next(
      {super.key, required this.message, required this.isMe})
      : isFirstInSequence = false;

  final bool isFirstInSequence;
  final Message message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (isFirstInSequence) const SizedBox(height: 18),
                Container(
                  decoration: BoxDecoration(
                    color: isMe
                        ? Colors.grey[300]
                        : theme.colorScheme.primaryContainer.withAlpha(200),
                    borderRadius: BorderRadius.only(
                      topLeft: !isMe && isFirstInSequence
                          ? Radius.zero
                          : const Radius.circular(12),
                      topRight: isMe && isFirstInSequence
                          ? Radius.zero
                          : const Radius.circular(12),
                      bottomLeft: const Radius.circular(12),
                      bottomRight: const Radius.circular(12),
                    ),
                  ),
                  constraints: const BoxConstraints(maxWidth: 200),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 14,
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 4,
                    horizontal: 12,
                  ),
                  child: isMe
                      ? Text(
                          message.text,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: isMe
                                      ? Colors.black87
                                      : Theme.of(context).colorScheme.surface),
                          softWrap: true,
                        )
                      : message.problems != null
                          ? Column(
                              children: [
                                for (Problem pr in message.problems!)
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () async {
                                        final response = await http.get(Uri.parse(
                                            "https://manual.sunjet-project.de/faq/problem/${pr.id}"));
                                        final responseBody =
                                            jsonDecode(response.body)
                                                as Map<String, dynamic>;
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ProblemPage(
                                              problem: Problem.fromJson(
                                                  responseBody),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        pr.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                  )
                              ],
                            )
                          : Text(
                              message.text,
                              style: Theme.of(context).textTheme.titleLarge,
                              softWrap: true,
                            ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
