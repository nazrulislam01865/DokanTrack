import 'package:dokan_track/core/theme/app_theme.dart';
import 'package:dokan_track/features/auth/presentation/login_screen.dart';
import 'package:dokan_track/features/auth/presentation/signup_screen.dart';
import 'package:dokan_track/features/onboarding/presentation/onboarding_screen.dart';
import 'package:dokan_track/features/tracker/presentation/tracker_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final screens = <String, Widget>{
    'onboarding': const OnboardingScreen(),
    'login': const LoginScreen(),
    'signup': const SignupScreen(),
    'home': const HomeScreen(),
    'sale': const NewSaleScreen(),
    'products': const ProductsScreen(),
    'dues': const DueCustomersScreen(),
    'mfs': const MfsTransactionsScreen(),
    'settings': const TrackerSettingsScreen(),
  };

  for (final entry in screens.entries) {
    testWidgets('${entry.key} renders at phone size', (tester) async {
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;

      await tester.pumpWidget(
        MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: entry.value,
        ),
      );
      await tester.pumpAndSettle();

      expect(tester.takeException(), isNull);
    });
  }
}
