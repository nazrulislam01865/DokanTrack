import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/tracker_ui.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      child: TrackerScrollView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
        children: [
          const _SignupLogo(),
          const Gap(20),
          const Text('Create your account', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
          const Gap(8),
          const Text(
            'Set up the owner account. Choose product categories in Settings and change them anytime.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w600, height: 1.35),
          ),
          const Gap(18),
          const FormInput(label: 'Shop name', value: 'Maa General Store', icon: Icons.storefront_rounded),
          const Gap(10),
          const FormInput(label: 'Owner name', value: 'Abdul Karim', icon: Icons.person_outline_rounded),
          const Gap(10),
          const FormInput(label: 'Mobile number', value: '01700 123 456', icon: Icons.phone_outlined),
          const Gap(10),
          const FormInput(label: 'Email address', value: 'karim@example.com • Optional', icon: Icons.mail_outline_rounded),
          const Gap(10),
          const FormInput(label: 'Password', value: '••••••••', icon: Icons.lock_outline_rounded),
          const Gap(10),
          const FormInput(label: 'Confirm password', value: '••••••••', icon: Icons.lock_reset_rounded),
          const Gap(8),
          Row(
            children: [
              Checkbox(value: true, onChanged: (_) {}, visualDensity: VisualDensity.compact),
              const Expanded(
                child: Text(
                  'I agree to the Terms of Service and Privacy Policy',
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          const Gap(8),
          PrimaryActionButton(
            label: 'Create account',
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false),
          ),
          const Gap(10),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Already have an account? Log in',
              style: TextStyle(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignupLogo extends StatelessWidget {
  const _SignupLogo();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(color: AppColors.primaryLight, borderRadius: BorderRadius.circular(999)),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.storefront_rounded, size: 14, color: AppColors.primary),
            SizedBox(width: 6),
            Text('DokanTrack', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.primary)),
          ],
        ),
      ),
    );
  }
}
