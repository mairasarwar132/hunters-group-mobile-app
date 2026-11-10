import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/app_data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/section_header.dart';
import '../widgets/service_card.dart';
import '../widgets/process_step.dart';
import '../widgets/benefit_card.dart';
import '../widgets/service_bottom_sheet.dart';
import '../utils/launch_helpers.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;
  final VoidCallback onNavigateToContact;

  const HomeScreen({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
    required this.onNavigateToContact,
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

  void _openServiceSheet(BuildContext context, Map<String, dynamic> service) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ServiceBottomSheet(
        title: service['title'] as String,
        details: service['details'] as String,
        onInquireNavigate: () {
          // Pre-fill is handled by WhatsApp message inside the sheet.
          // Optionally jump to Contact tab:
          onNavigateToContact();
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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== HERO =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [AppColors.deepNavy, const Color(0xFF0F2744)]
                      : [const Color(0xFFE8F1FF), AppColors.background],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'GLOBAL TRADE · E-COMMERCE · LOGISTICS',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppData.tagline,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w800,
                          height: 1.15,
                          color: isDark ? Colors.white : AppColors.deepNavy,
                        ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    AppData.heroSubtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          height: 1.55,
                          color: isDark
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => LaunchHelpers.openWhatsApp(),
                          child: const Text('Let\'s Talk'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onNavigateToContact,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.primaryBlue,
                            side: const BorderSide(color: AppColors.primaryBlue),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Contact'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ===== PAKISTAN × CHINA BANNER =====
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkSurface : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/pakistan_china.png',
                        width: 72,
                        height: 52,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          width: 72,
                          height: 52,
                          color: AppColors.primaryBlue.withValues(alpha: 0.1),
                          child: const Icon(Icons.public, color: AppColors.primaryBlue),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'INTERNATIONAL PARTNERSHIP',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8,
                              color: AppColors.primaryBlue,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            AppData.pakistanChinaTitle,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: isDark ? Colors.white : AppColors.deepNavy,
                                ),
                          ),
                          Text(
                            AppData.pakistanChinaSubtitle,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: isDark
                                      ? AppColors.darkTextSecondary
                                      : AppColors.lightTextSecondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // ===== SERVICES GRID =====
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 32, 20, 8),
              child: SectionHeader(
                title: 'Our Services',
                subtitle: 'Solutions built for your next stage of growth.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppData.services.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.78,
                ),
                itemBuilder: (context, index) {
                  final service = AppData.services[index];
                  return ServiceCard(
                    title: service['title'] as String,
                    shortDescription: service['short'] as String,
                    icon: _iconFor(service['icon'] as String),
                    onTap: () => _openServiceSheet(context, service),
                  );
                },
              ),
            ),

            // ===== HOW WE WORK =====
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 36, 20, 8),
              child: SectionHeader(
                title: 'How We Work',
                subtitle: 'Simple steps. Real progress.',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: AppData.processSteps
                    .map((step) => ProcessStep(
                          number: step['number']!,
                          title: step['title']!,
                          description: step['description']!,
                        ))
                    .toList(),
              ),
            ),

            // ===== WHY CHOOSE US =====
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 32, 20, 8),
              child: SectionHeader(
                title: 'Why Choose Us',
                subtitle: 'Business is complex. Your support shouldn\'t be.',
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row 1: Global Perspective + Dependable Support
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: BenefitCard(
                            title: AppData.benefits[0]['title']!,
                            description: AppData.benefits[0]['description']!,
                            icon: Icons.public,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: BenefitCard(
                            title: AppData.benefits[1]['title']!,
                            description: AppData.benefits[1]['description']!,
                            icon: Icons.verified_user_outlined,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Row 2: Connected Services + Personal Assistance
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: BenefitCard(
                            title: AppData.benefits[2]['title']!,
                            description: AppData.benefits[2]['description']!,
                            icon: Icons.link,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: BenefitCard(
                            title: AppData.benefits[3]['title']!,
                            description: AppData.benefits[3]['description']!,
                            icon: Icons.support_agent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}