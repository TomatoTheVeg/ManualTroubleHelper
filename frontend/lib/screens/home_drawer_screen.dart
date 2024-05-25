import 'package:continental_manual_helper/providers/home_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeDrawerScreen extends ConsumerWidget {
  const HomeDrawerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3 * 2,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surface,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer),
              child: Center(
                  child: Text(
                "Input options",
                style: Theme.of(context).textTheme.titleLarge,
              )),
            ),
            ListTile(
              title: const Text('Chat'),
              selected: ref.watch(homeScreenProvider) == 0,
              onTap: () {
                ref.read(homeScreenProvider.notifier).toggleHomeScreen(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              selected: ref.watch(homeScreenProvider) == 1,
              title: const Text('Wiki'),
              onTap: () {
                ref.read(homeScreenProvider.notifier).toggleHomeScreen(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              selected: ref.watch(homeScreenProvider) == 2,
              title: const Text('Manual'),
              onTap: () {
                ref.read(homeScreenProvider.notifier).toggleHomeScreen(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
