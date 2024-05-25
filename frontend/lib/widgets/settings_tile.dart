import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.title,
    required this.icon,
    required this.widget,
  });

  final String title;
  final IconData icon;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            title,
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 18),
          ),
          const Spacer(),
          widget,
        ],
      ),
    );
  }
}
