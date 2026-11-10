import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class RegistrationItem extends StatelessWidget {
  final String name;
  final String assetPath;

  const RegistrationItem({
    super.key,
    required this.name,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? const Color(0xFF1E3A5F) : const Color(0xFFE8EEF5),
        ),
      ),
      child: Row(
        children: [
          // Logo – falls back gracefully if image missing
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              assetPath,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                width: 40,
                height: 40,
                color: AppColors.primaryBlue.withValues(alpha: 0.1),
                child: const Icon(Icons.verified, color: AppColors.primaryBlue, size: 22),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: isDark ? AppColors.darkTextPrimary : AppColors.deepNavy,
                  ),
            ),
          ),
          const Icon(Icons.check_circle, color: AppColors.primaryBlue, size: 22),
        ],
      ),
    );
  }
}