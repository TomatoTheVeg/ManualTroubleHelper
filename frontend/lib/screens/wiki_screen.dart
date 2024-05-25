import 'package:continental_manual_helper/pages/new_problem_page.dart';
import 'package:continental_manual_helper/widgets/wiki_button.dart';
import 'package:continental_manual_helper/widgets/wiki_request.dart';
import 'package:flutter/material.dart';

import '../widgets/solutions_list.dart';

class WikiScreen extends StatelessWidget {
  const WikiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          children: [
            const WikiRequest(),
            const Expanded(child: SolutionsList()),
            WikiButton(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const NewProblemPage(),
                  ),
                );
              },
              title: "Create new problem",
            )
          ],
        ),
      ),
    );
  }
}
