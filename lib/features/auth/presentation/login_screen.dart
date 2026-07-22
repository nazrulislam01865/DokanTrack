import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/tracker_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      child: TrackerScrollView(
        padding: const EdgeInsets.fromLTRB(24, 34, 24, 18),
        children: [
          const _AuthLogo(),
          const Gap(28),
          const Text('Welcome back', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          const Gap(8),
          const Text(
            'Log in to continue managing your store records.',
            style: TextStyle(color: AppColors.textSecondary, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const Gap(22),
          const FormInput(label: 'Email/mobile', value: '01700 123 456', icon: Icons.person_outline_rounded),
          const Gap(12),
          const FormInput(label: 'Password', value: '••••••••', icon: Icons.lock_outline_rounded),
          const Gap(4),
          Row(
            children: [
              Checkbox(value: true, onChanged: (_) {}, visualDensity: VisualDensity.compact),
              const Text('Remember me', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot password?', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
          const Gap(8),
          PrimaryActionButton(
            label: 'Log in',
            onPressed: () => Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false),
          ),
          const Gap(22),
          const Center(
            child: Text(
              'New records are linked to your mobile number',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 10),
            ),
          ),
          const Gap(14),
          SecondaryActionButton(
            label: 'Create a new account',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.signup),
          ),
        ],
      ),
    );
  }
}

class _AuthLogo extends StatelessWidget {
  const _AuthLogo();

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
