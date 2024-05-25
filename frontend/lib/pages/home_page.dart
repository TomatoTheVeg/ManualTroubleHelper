import 'package:continental_manual_helper/pages/settings_page.dart';
import 'package:continental_manual_helper/providers/app_version_provider.dart';
import 'package:continental_manual_helper/providers/home_screen_provider.dart';
import 'package:continental_manual_helper/providers/problems_list_provider.dart';
import 'package:continental_manual_helper/screens/chat_screen.dart';
import 'package:continental_manual_helper/screens/home_drawer_screen.dart';
import 'package:continental_manual_helper/screens/manual_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/wiki_screen.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(appVersionProvider.notifier).getCurrentVersion();
    ref.read(problemsListProvider.notifier).getProblems();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetList = [
      const ChatScreen(),
      const WikiScreen(),
      const ManualScreen(),
    ];

    return Scaffold(
      body: SafeArea(
        child: widgetList[ref.watch(homeScreenProvider)],
      ),
      drawer: const HomeDrawerScreen(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
            ),
          )
        ],
      ),
    );
  }
}
