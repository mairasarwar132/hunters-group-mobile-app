import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helpers.dart';

class ServiceBottomSheet extends StatelessWidget {
  final String title;
  final String details;
  final VoidCallback? onInquireNavigate;

  const ServiceBottomSheet({
    super.key,
    required this.title,
    required this.details,
    this.onInquireNavigate,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.deepNavy,
                ),
          ),
          const SizedBox(height: 14),
          Text(
            details,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  height: 1.55,
                ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
                if (onInquireNavigate != null) {
                  onInquireNavigate!();
                } else {
                  LaunchHelpers.openWhatsApp(
                    prefilledMessage:
                        'Hello Hunters Group, I am interested in your $title. Please share more details.',
                  );
                }
              },
              icon: const Icon(Icons.chat),
              label: const Text('Inquire Now'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Navigator.pop(context),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: AppColors.primaryBlue.withValues(alpha: 0.5)),
              ),
              child: const Text('Close'),
            ),
          ),
        ],
      ),
    );
  }
}