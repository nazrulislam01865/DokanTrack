import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/tracker_ui.dart';

class VerifyEmailArguments {
  const VerifyEmailArguments({
    required this.email,
    this.name,
    this.isLogin = false,
  });

  final String email;
  final String? name;
  final bool isLogin;
}

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({required this.arguments, super.key});

  final VerifyEmailArguments arguments;

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      child: TrackerScrollView(
        padding: const EdgeInsets.fromLTRB(24, 42, 24, 18),
        children: [
          const Icon(Icons.mark_email_read_outlined, color: AppColors.primary, size: 54),
          const Gap(18),
          const Text(
            'Verify your account',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
          ),
          const Gap(8),
          Text(
            'Enter the code sent to ${arguments.email}.',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const Gap(22),
          const FormInput(label: 'Verification code', value: '123456', icon: Icons.password_rounded),
          const Gap(18),
          PrimaryActionButton(
            label: 'Continue',
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false),
          ),
          const Gap(12),
          SecondaryActionButton(
            label: 'Back to login',
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false),
          ),
        ],
      ),
    );
  }
}
