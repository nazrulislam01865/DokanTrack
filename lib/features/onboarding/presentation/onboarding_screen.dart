import 'package:flutter/material.dart';

import '../../../app/routes/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/tracker_ui.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TrackerPage(
      child: TrackerScrollView(
        padding: const EdgeInsets.fromLTRB(24, 18, 24, 18),
        children: [
          const _BrandChip(),
          const Gap(24),
          Container(
            height: 246,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFDDF4E6),
              borderRadius: BorderRadius.circular(26),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Positioned(left: 34, top: 40, child: _FeatureBubble(icon: Icons.receipt_long_outlined)),
                const Positioned(right: 28, top: 32, child: _FeatureBubble(icon: Icons.add_rounded)),
                const Positioned(left: 62, bottom: 48, child: _FeatureBubble(icon: Icons.inventory_2_outlined)),
                const Positioned(right: 62, bottom: 42, child: _FeatureBubble(icon: Icons.account_balance_wallet_outlined)),
                Container(
                  width: 114,
                  height: 106,
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.14),
                        blurRadius: 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.storefront_rounded, color: AppColors.primary, size: 34),
                      SizedBox(height: 8),
                      Text('BUY  SELL', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
                const Positioned(
                  bottom: 24,
                  child: Text(
                    'SALES + PRODUCTS + DUES + MFS',
                    style: TextStyle(fontSize: 9, fontWeight: FontWeight.w900, letterSpacing: .2),
                  ),
                ),
              ],
            ),
          ),
          const Gap(26),
          const Text(
            'Simple records for every\nkind of shop',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900, height: 1.1),
          ),
          const Gap(10),
          const Text(
            'Use it for grocery, electronics, medicines, cosmetics, or any small retail shop without accounting complexity.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          const Gap(22),
          const Row(
            children: [
              Expanded(child: _QuickFeature(icon: Icons.flash_on_rounded, label: 'Quick sale entry')),
              SizedBox(width: 10),
              Expanded(child: _QuickFeature(icon: Icons.inventory_2_outlined, label: 'Products & dues')),
              SizedBox(width: 10),
              Expanded(child: _QuickFeature(icon: Icons.account_balance_wallet_outlined, label: 'MFS records')),
            ],
          ),
          const Gap(22),
          PrimaryActionButton(
            label: 'Get started',
            onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
          ),
          const Gap(12),
          TextButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.login),
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

class _BrandChip extends StatelessWidget {
  const _BrandChip();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
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

class _FeatureBubble extends StatelessWidget {
  const _FeatureBubble({required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(14)),
      child: Icon(icon, color: AppColors.primary, size: 18),
    );
  }
}

class _QuickFeature extends StatelessWidget {
  const _QuickFeature({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(13)),
          child: Icon(icon, color: AppColors.primary, size: 18),
        ),
        const SizedBox(height: 7),
        Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800)),
      ],
    );
  }
}
