import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/app_data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/section_header.dart';
import '../widgets/service_bottom_sheet.dart';

class ServicesScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  final Function(String serviceName)? onInquire;

  const ServicesScreen({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
    this.onInquire,
  });

  IconData _iconFor(String key) {
    switch (key) {
      case 'shopping_bag':
        return Icons.shopping_bag_outlined;
      case 'import_export':
        return Icons.import_export;
      case 'public':
        return Icons.public;
      case 'local_shipping':
        return Icons.local_shipping_outlined;
      case 'search':
        return Icons.search;
      case 'web':
        return Icons.web;
      default:
        return Icons.work_outline;
    }
  }

  void _openSheet(BuildContext context, Map<String, dynamic> service) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ServiceBottomSheet(
        title: service['title'] as String,
        details: service['details'] as String,
        onInquireNavigate: () {
          if (onInquire != null) {
            onInquire!(service['title'] as String);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        onToggleTheme: onToggleTheme,
        themeMode: themeMode,
        showGetQuote: false,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
        children: [
          const SectionHeader(
            title: 'Our Services',
            subtitle: 'From online marketplaces to international trade — explore solutions designed around your goals.',
          ),
          const SizedBox(height: 24),
          ...AppData.services.map((service) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Material(
                color: isDark ? AppColors.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(16),
                elevation: 1.5,
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => _openSheet(context, service),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            _iconFor(service['icon'] as String),
                            color: AppColors.primaryBlue,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                service['title'] as String,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: isDark ? Colors.white : AppColors.deepNavy,
                                    ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                service['short'] as String,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                      height: 1.45,
                                      color: isDark
                                          ? AppColors.darkTextSecondary
                                          : AppColors.lightTextSecondary,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Tap for details →',
                                style: TextStyle(
                                  color: AppColors.primaryBlue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}