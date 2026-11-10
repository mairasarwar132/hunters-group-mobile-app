import 'package:flutter/material.dart';

class BenefitCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color? backgroundColor;

  const BenefitCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final bgColor = backgroundColor ?? color.surface;

    // Use Column layout with mainAxisSize: Min so card height fits content.
    // Icon on top, then 12px gap, title (allow 2 lines), 8px gap, description (wrap fully).
    return Card(
      color: bgColor,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon on top
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color.primary, size: 24),
            ),
            const SizedBox(height: 12),
            // Title - allow 2 lines, soft wrap, no break mid-word
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 2,
              softWrap: true,
            ),
            const SizedBox(height: 8),
            // Description - wrap fully, no truncation, no fade
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.8),
                  ),
              maxLines: null,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}