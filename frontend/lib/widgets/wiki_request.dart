import 'package:continental_manual_helper/providers/problems_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WikiRequest extends ConsumerStatefulWidget {
  const WikiRequest({super.key});

  @override
  ConsumerState<WikiRequest> createState() => _WikiRequestState();
}

class _WikiRequestState extends ConsumerState<WikiRequest> {
  final TextEditingController _wikiRequestController = TextEditingController();

  @override
  void dispose() {
    _wikiRequestController.dispose();
    super.dispose();
  }

  void getProblems() async {}

  // void _requestSolutions() async {
  //   final messageText = _wikiRequestController.text;
  //   if (messageText.trim().isEmpty) {
  //     return;
  //   }
  //   _wikiRequestController.clear();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (input) {
              ref.read(problemsListProvider.notifier).sortProblems(input);
            },
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontSize: 16),
            controller: _wikiRequestController,
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
        // IconButton(
        //   onPressed: _requestSolutions,
        //   icon: Icon(
        //     Icons.send,
        //     color: Theme.of(context).colorScheme.primary,
        //   ),
        // )
      ],
    );
  }
}
