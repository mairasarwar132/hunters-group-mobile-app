import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/launch_helpers.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  final bool showGetQuote;

  const CustomAppBar({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
    this.showGetQuote = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      titleSpacing: 16,
      title: Row(
        children: [
          Image.asset(
            'assets/images/logo.png',
            height: 36,
            errorBuilder: (_, __, ___) => Text(
              'HUNTERS GROUP',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 16,
                color: isDark ? Colors.white : AppColors.deepNavy,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          tooltip: 'Toggle theme',
          onPressed: onToggleTheme,
          icon: Icon(
            themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
          ),
        ),
        if (showGetQuote)
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () => LaunchHelpers.openWhatsApp(),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                minimumSize: const Size(0, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Get a Quote',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
              ),
            ),
          ),
      ],
    );
  }
}