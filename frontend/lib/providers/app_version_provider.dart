import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionNotifier extends StateNotifier<PackageInfo> {
  AppVersionNotifier()
      : super(
          PackageInfo(
            appName: "appName",
            packageName: "packageName",
            version: "version",
            buildNumber: "buildNumber",
          ),
        );

  Future<void> getCurrentVersion() async {
    state = await PackageInfo.fromPlatform();
  }
}

final appVersionProvider =
    StateNotifierProvider<AppVersionNotifier, PackageInfo>(
        (ref) => AppVersionNotifier());
