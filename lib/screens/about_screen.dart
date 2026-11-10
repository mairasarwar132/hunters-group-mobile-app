import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../data/app_data.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/section_header.dart';
import '../widgets/registration_item.dart';
import '../widgets/benefit_card.dart';

class AboutScreen extends StatelessWidget {
  final VoidCallback onToggleTheme;
  final ThemeMode themeMode;

  const AboutScreen({
    super.key,
    required this.onToggleTheme,
    required this.themeMode,
  });

  @override
Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: CustomAppBar(
        onToggleTheme: onToggleTheme,
        themeMode: themeMode,
        showGetQuote: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'GET TO KNOW HUNTERS GROUP',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.0,
                color: AppColors.primaryBlue,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Building Businesses.\nConnecting the World.',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    height: 1.2,
                    color: isDark ? Colors.white : AppColors.deepNavy,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              'Empowering businesses through innovation, technology, e-commerce solutions, digital services, and global trade.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.5,
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Building Global Opportunities Since 2021',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.accentGold,
              ),
            ),

            const SizedBox(height: 32),
            const SectionHeader(title: 'About Hunters Group'),
            const SizedBox(height: 12),
            Text(
              AppData.aboutIntro,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              AppData.aboutMission,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.55,
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              AppData.aboutTagline,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isDark ? Colors.white : AppColors.deepNavy,
                  ),
            ),

            const SizedBox(height: 36),
            const SectionHeader(title: 'Mission & Vision'),
            const SizedBox(height: 16),
            _InfoCard(
              title: AppData.missionTitle,
              body: AppData.missionBody,
              isDark: isDark,
            ),
            const SizedBox(height: 12),
            _InfoCard(
              title: AppData.visionTitle,
              body: AppData.visionBody,
              isDark: isDark,
            ),

            const SizedBox(height: 36),
            const SectionHeader(
              title: 'Registrations & Affiliations',
              subtitle: 'Our official registrations',
            ),
            const SizedBox(height: 16),
            ...AppData.registrations.map(
              (reg) => RegistrationItem(
                name: reg['name']!,
                assetPath: reg['asset']!,
              ),
            ),

            const SizedBox(height: 36),
            const SectionHeader(title: 'Why Hunters Group'),
            const SizedBox(height: 16),
            // Benefit cards - 2 rows of 2
            Row(
              children: [
                Expanded(
                  child: BenefitCard(
                    title: AppData.benefits[0]['title']!,
                    description: AppData.benefits[0]['description']!,
                    icon: Icons.public,
                  ),
                ),
                Expanded(
                  child: BenefitCard(
                    title: AppData.benefits[1]['title']!,
                    description: AppData.benefits[1]['description']!,
                    icon: Icons.verified_user_outlined,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 12),
            Row(
              children: [
                Expanded(
                  child: BenefitCard(
                    title: AppData.benefits[2]['title']!,
                    description: AppData.benefits[2]['description']!,
                    icon: Icons.link,
                  ),
                ),
                Expanded(
                  child: BenefitCard(
                    title: AppData.benefits[3]['title']!,
                    description: AppData.benefits[3]['description']!,
                    icon: Icons.support_agent,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 36),
            const SectionHeader(title: 'Our Team'),
            const SizedBox(height: 24),
            // Team members - 2 per row in a grid
            // Order: Founder, CEO, Co-Founder, Managing Director, Head of Import & Export, Head of IT
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 24,
              childAspectRatio: 1.0,
              children: [
                _buildTeamMemberCard(
                  'M Huzaifa Attari',
                  'Founder',
                  'assets/images/team_placeholder.png/team-huzaifa.jpg',
                  isDark,
                ),
                _buildTeamMemberCard(
                  'Dr Salam Ahmad Raza',
                  'CEO',
                  'assets/images/team_placeholder.png/team-salam.jpg',
                  isDark,
                ),
                _buildTeamMemberCard(
                  'M Matiullah Sultani',
                  'Co-Founder',
                  'assets/images/team_placeholder.png/team-matiullah.jpg',
                  isDark,
                ),
                _buildTeamMemberCard(
                  'Zunaira Atta ur Rehman',
                  'Managing Director',
                  'assets/images/team_placeholder.png/team-zunaira.jpg',
                  isDark,
                ),
                _buildTeamMemberCard(
                  'Zhang Yun',
                  'Head of Import & Export',
                  'assets/images/team_placeholder.png/team-zhang-yun.jpg',
                  isDark,
                ),
                _buildTeamMemberCard(
                  'Mirza Kashan Ali',
                  'Head of IT',
                  'assets/images/team_placeholder.png/team-kashan.jpg',
                  isDark,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(String name, String role, String imagePath, bool isDark) {
    final textColor = isDark ? AppColors.darkTextPrimary : AppColors.deepNavy;
    final secondaryColor = isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary;
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              imagePath,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              errorBuilder: (_, __, ___) => CircleAvatar(
                radius: 44,
                child: Text(
                  name.isNotEmpty ? name[0] : '?',
                  style: const TextStyle(
                    color: AppColors.deepNavy,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
          ),
          const SizedBox(height: 4),
          Text(
            role,
            style: TextStyle(
              color: secondaryColor,
              fontSize: 10,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String body;
  final bool isDark;

  const _InfoCard({
    required this.title,
    required this.body,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark ? const Color(0xFF1E3A5F) : const Color(0xFFE8EEF5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: isDark ? Colors.white : AppColors.deepNavy,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
                ),
          ),
        ],
      ),
    );
  }
}