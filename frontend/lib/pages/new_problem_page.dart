import 'dart:convert';

import 'package:continental_manual_helper/providers/problems_list_provider.dart';
import 'package:continental_manual_helper/widgets/problem_text_form_field.dart';
import 'package:continental_manual_helper/widgets/wiki_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class NewProblemPage extends ConsumerWidget {
  const NewProblemPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int id = 0;
    String description = "";
    final form = GlobalKey<FormState>();

    void submit() async {
      bool isValid = form.currentState!.validate();
      if (!isValid) {
        return;
      }
      showDialog(
          context: context,
          builder: (context) {
            return const Center(child: CircularProgressIndicator());
          });
      form.currentState!.save();
      await http.post(
        Uri.parse("https://manual.sunjet-project.de/faq/problem"),
        body: json.encode({
          'description': description,
        }),
        headers: {
          'Content-Type': 'application/json', // Set the content type to JSON
        },
      );
      ref.read(problemsListProvider.notifier).getProblems();
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: form,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                ProblemTextFormField(
                  onSaved: (input) {
                    description = input!;
                  },
                  labelText: "Description",
                  onValidate: (input) {
                    if (input == null || input.trim().isEmpty) {
                      return "Enter a valid description";
                    }
                    return null;
                  },
                ),
                const Spacer(),
                WikiButton(title: "Submit new problem", onTap: submit),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
