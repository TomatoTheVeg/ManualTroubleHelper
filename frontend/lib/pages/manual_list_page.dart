import 'package:continental_manual_helper/providers/home_screen_provider.dart';
import 'package:continental_manual_helper/providers/manual_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ManualListPage extends ConsumerWidget {
  const ManualListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manual list"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  fontSize: 16),
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
            Expanded(
              child: ListView.builder(
                itemCount: ref.watch(manualListProvider).length,
                itemBuilder: (context, index) {
                  final manualList = ref.watch(manualListProvider);
                  return Card(
                    child: ListTile(
                      onTap: () async {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircularProgressIndicator(),
                                    const SizedBox(height: 10),
                                    Text(
                                      "Loading manual",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    )
                                  ],
                                ),
                              );
                            });
                        ref
                            .read(manualListProvider.notifier)
                            .selectCurrentManual(index);
                        ref
                            .read(homeScreenProvider.notifier)
                            .toggleHomeScreen(0);
                        await Future.delayed(const Duration(seconds: 1));
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      title: Text(manualList[index].title),
                      subtitle: Text(manualList[index].author),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
