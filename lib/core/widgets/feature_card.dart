
// ignore_for_file: deprecated_member_use

import 'package:fekra/core/data/item.dart';
import 'package:fekra/screens/web_view_screen.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final Item item;
  final Color color;
  final Color iconColor;
  const FeatureCard({
    super.key,
    required this.item,
    required this.color,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isTablet = width >= 600;

    final double iconSize = isTablet ? 40 : 30;
    final double fontSize = isTablet ? 19 : 15;
    final double padding = isTablet ? 22 : 16;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                WebViewScreen(initialUrl: item.url, item.title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(item.icon, color: iconColor, size: iconSize),
            ),
            const SizedBox(height: 12),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
