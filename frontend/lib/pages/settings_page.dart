import 'package:app_settings/app_settings.dart';
import 'package:continental_manual_helper/pages/manual_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/app_version_provider.dart';
import '../providers/theme_mode_provider.dart';
import '../widgets/settings_tile.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int a = 0;
    switch (ref.read(themeModeProvider)) {
      case ThemeMode.system:
        a = 0;
      case ThemeMode.light:
        a = 1;
      case ThemeMode.dark:
        a = 2;
      default:
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              SettingsTile(
                title: "Theme",
                icon: Icons.dark_mode,
                widget: DropdownMenu(
                  initialSelection: a,
                  textStyle: Theme.of(context).textTheme.titleMedium!,
                  onSelected: (index) {
                    ref
                        .read(themeModeProvider.notifier)
                        .toggleThemeMode(index!);
                  },
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                        value: 0,
                        label: "System",
                        trailingIcon: Icon(Icons.phonelink)),
                    DropdownMenuEntry(
                        value: 1,
                        label: "Light",
                        trailingIcon: Icon(Icons.light_mode)),
                    DropdownMenuEntry(
                        value: 2,
                        label: "Dark",
                        trailingIcon: Icon(Icons.dark_mode)),
                  ],
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              GestureDetector(
                onTap: () {
                  AppSettings.openAppSettings();
                },
                child: const SettingsTile(
                    title: "Application Settings",
                    icon: Icons.settings_applications,
                    widget: Icon(Icons.chevron_right)),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              GestureDetector(
                onTap: () async {
                  // const String wa = "https://wa.me/+380931544003";
                  if (await canLaunchUrl(Uri.parse("tel:+4915172115138"))) {
                    await launchUrl(Uri.parse("tel:+4915172115138"));
                  } else {
                    throw 'Could not launch tel:+4915172115138';
                  }
                },
                child: const SettingsTile(
                  title: "Customer support",
                  icon: Icons.phone,
                  widget: Icon(Icons.chevron_right),
                ),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ManualListPage()));
                },
                child: const SettingsTile(
                    title: "Change manual",
                    icon: Icons.bookmarks,
                    widget: Icon(Icons.chevron_right)),
              ),
              const Spacer(),
              Text(
                "version: ${ref.watch(appVersionProvider).version}",
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
