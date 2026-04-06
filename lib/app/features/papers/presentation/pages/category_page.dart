import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scholars_horizon/app/core/theme/theme_provider.dart';
import 'package:scholars_horizon/app/features/papers/presentation/pages/papers_page.dart';

class CsCategoryPage extends ConsumerWidget {
  const CsCategoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    /// ✅ SAME UI — ONLY DATA CHANGED TO CS
    final categories = [
      {
        "title": "Artificial Intelligence",
        "code": "cs.AI",
        "arxiv": "cs.AI",
        "icon": Icons.smart_toy,
        "color": Colors.green
      },
      {
        "title": "Machine Learning",
        "code": "cs.LG",
        "arxiv": "cs.LG",
        "icon": Icons.science,
        "color": Colors.purple
      },
      {
        "title": "Computer Vision",
        "code": "cs.CV",
        "arxiv": "cs.CV",
        "icon": Icons.grid_view,
        "color": Colors.blue
      },
      {
        "title": "Natural Language Processing",
        "code": "cs.CL",
        "arxiv": "cs.CL",
        "icon": Icons.chat,
        "color": Colors.teal
      },
      {
        "title": "Cyber Security",
        "code": "cs.CR",
        "arxiv": "cs.CR",
        "icon": Icons.security,
        "color": Colors.indigo
      },
      {
        "title": "Distributed Systems",
        "code": "cs.DC",
        "arxiv": "cs.DC",
        "icon": Icons.public,
        "color": Colors.lightGreen
      },
      {
        "title": "Robotics",
        "code": "cs.RO",
        "arxiv": "cs.RO",
        "icon": Icons.precision_manufacturing,
        "color": Colors.orange
      },
      {
        "title": "Databases",
        "code": "cs.DB",
        "arxiv": "cs.DB",
        "icon": Icons.storage,
        "color": Colors.red
      },
      {
        "title": "Software Engineering",
        "code": "cs.SE",
        "arxiv": "cs.SE",
        "icon": Icons.computer,
        "color": Colors.cyan
      },
      {
        "title": "Networking",
        "code": "cs.NI",
        "arxiv": "cs.NI",
        "icon": Icons.network_check,
        "color": Colors.brown
      },
      {
        "title": "Cryptography",
        "code": "cs.CR",
        "arxiv": "cs.CR",
        "icon": Icons.lock,
        "color": Colors.green
      },
      {
        "title": "Human Computer Interaction",
        "code": "cs.HC",
        "arxiv": "cs.HC",
        "icon": Icons.touch_app,
        "color": Colors.deepPurple
      },
    ];

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          "Browse Computer Science",
          style: theme.textTheme.titleLarge?.copyWith(
            color: isDark ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: width * 0.045,
          ),
        ),
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(width * 0.04),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(height: height * 0.015),
        itemBuilder: (context, index) {
          final item = categories[index];
          return _categoryTile(
            context,
            width: width,
            height: height,
            title: item["title"] as String,
            code: item["code"] as String,
            arxivCode: item["arxiv"] as String,
            icon: item["icon"] as IconData,
            color: item["color"] as Color,
            theme: theme,
            isDark: isDark,
          );
        },
      ),
    );
  }

  Widget _categoryTile(
      BuildContext context, {
        required double width,
        required double height,
        required String title,
        required String code,
        required String arxivCode,
        required IconData icon,
        required Color color,
        required ThemeData theme,
        required bool isDark,
      }) {
    return InkWell(
      borderRadius: BorderRadius.circular(width * 0.04),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PapersPage(
              title: title,
              category: arxivCode,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.04,
          vertical: height * 0.018,
        ),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(width * 0.04),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.5)
                  : Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.025),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(width * 0.03),
              ),
              child: Icon(icon, color: color, size: width * 0.055),
            ),
            SizedBox(width: width * 0.04),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "$title ",
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.04,
                  ),
                  children: [
                    TextSpan(
                      text: "($code)",
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDark ? Colors.grey[400] : Colors.grey[600],
                        fontSize: width * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: isDark ? Colors.grey[500] : Colors.grey[400],
              size: width * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}