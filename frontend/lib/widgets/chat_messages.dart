import 'package:continental_manual_helper/providers/chat_messages_provider.dart';
import 'package:continental_manual_helper/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatMessages extends ConsumerStatefulWidget {
  const ChatMessages({super.key});

  @override
  ConsumerState<ChatMessages> createState() => _ChatMessagesState();
}

class _ChatMessagesState extends ConsumerState<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    // ref.read(chatMessagesProvider.notifier).getMessages();
    final messages = ref.watch(chatMessagesProvider);
    return messages.isEmpty
        ? Center(
            child: Text(
              "No messages found",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        : ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return MessageBubble.next(
                message: messages[index],
                isMe: messages[index].isMe,
              );
            },
          );
  }
}
