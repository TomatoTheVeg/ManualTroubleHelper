import 'package:continental_manual_helper/pages/problem_page.dart';
import 'package:continental_manual_helper/providers/problems_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SolutionsList extends ConsumerWidget {
  const SolutionsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(problemsListProvider).isEmpty
        ? Center(
            child: Text(
              "Enter your problem",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        : ListView.builder(
            itemCount: ref.watch(problemsListProvider).length,
            itemBuilder: (context, index) {
              final problem = ref.read(problemsListProvider)[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProblemPage(problem: problem),
                      ),
                    );
                  },
                  leading: Text(problem.id.toString()),
                  title: Text(problem.description),
                  subtitle: Text(
                    "Solutions: ${problem.solutions != null ? problem.solutions!.length : 0}",
                  ),
                ),
              );
            },
          );
  }
}
