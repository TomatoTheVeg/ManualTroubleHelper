import 'package:continental_manual_helper/models/message.dart';
import 'package:continental_manual_helper/providers/chat_messages_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewMessage extends ConsumerStatefulWidget {
  const NewMessage({super.key});

  @override
  ConsumerState<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends ConsumerState<NewMessage> {
  final TextEditingController _messageController = TextEditingController();

  void _sendMessage() async {
    final messageText = _messageController.text;
    if (messageText.trim().isEmpty) {
      return;
    }
    ref.read(chatMessagesProvider.notifier).addMessage(
        Message(
          text: messageText,
          isMe: true,
          timeSent: DateTime.now().toString(),
        ),
        context);

    FocusScope.of(context).unfocus();

    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 16),
            controller: _messageController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
              labelText: "New message",
              labelStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: 16),
              filled: false,
              fillColor: const Color(0xFF010028),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: _sendMessage,
          icon: Icon(
            Icons.send,
            color: Theme.of(context).colorScheme.primary,
          ),
        )
      ],
    );
  }
}
