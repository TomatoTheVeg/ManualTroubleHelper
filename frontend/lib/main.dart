import 'package:continental_manual_helper/pages/home_page.dart';
import 'package:continental_manual_helper/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromRGBO(190, 165, 0, 1),
);

ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromRGBO(190, 165, 0, 1),
);

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: kDarkColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleSmall: GoogleFonts.raleway(
                fontSize: 12,
                color: kDarkColorScheme.onSecondaryContainer,
              ),
              titleMedium: GoogleFonts.raleway(
                  color: kDarkColorScheme.onSecondaryContainer),
              titleLarge: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kDarkColorScheme.onSecondaryContainer,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primaryContainer,
          foregroundColor: kColorScheme.onPrimaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          color: kColorScheme.secondaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleSmall: GoogleFonts.raleway(
                fontSize: 12,
                color: kColorScheme.onSecondaryContainer,
              ),
              titleMedium:
                  GoogleFonts.raleway(color: kColorScheme.onSecondaryContainer),
              titleLarge: GoogleFonts.raleway(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: kColorScheme.onSecondaryContainer,
              ),
            ),
      ),
      home: const HomePage(),
      themeMode: ref.watch(themeModeProvider),
    );
  }
}
