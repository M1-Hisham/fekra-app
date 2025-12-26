// ignore_for_file: deprecated_member_use

import 'package:fekra/core/data/item.dart';
import 'package:fekra/core/widgets/app_bar.dart';
import 'package:fekra/core/widgets/feature_card.dart';
import 'package:flutter/material.dart';

class VerbalScreen extends StatelessWidget {
  const VerbalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      Item(
        title: 'خطتك',
        icon: Icons.map_outlined,
        url: 'https://fiekraah.com/%d8%ae%d8%b7%d8%aa%d9%8a/',
      ),
      Item(
        title: 'التأسيس',
        icon: Icons.foundation_outlined,
        url: 'https://fiekraah.com/lafzi-courses/',
      ),
      Item(
        title: 'المناهج',
        icon: Icons.menu_book_outlined,
        url: 'https://fiekraah.com/lafzi/',
      ),
      Item(
        title: 'كويزات سريعة',
        icon: Icons.flash_on_outlined,
        url:
            'https://fiekraah.com/%d8%a7%d9%84%d8%a7%d8%ae%d8%aa%d8%a8%d8%a7%d8%b1-%d8%a7%d9%84%d9%85%d8%ae%d8%b5%d8%b5/',
      ),
      Item(
        title: 'اختبارات شاملة',
        icon: Icons.assignment_turned_in_outlined,
        url:
            'https://fiekraah.com/%d8%a7%d9%84%d8%a7%d8%ae%d8%aa%d8%a8%d8%a7%d8%b1-%d8%a7%d9%84%d9%85%d8%ae%d8%b5%d8%b5/',
      ),
      Item(
        title: 'تجميعات',
        icon: Icons.folder_copy_outlined,
        url:
            'https://fiekraah.com/%d8%aa%d8%ac%d9%85%d9%8a%d8%b9%d8%a7%d8%aa-%d9%84%d9%81%d8%b8%d9%8a/',
      ),
      Item(
        title: 'مستوى تقدمك',
        icon: Icons.trending_up_outlined,
        url:
            'https://fiekraah.com/%d9%85%d8%b3%d8%aa%d9%88%d9%8a-%d8%aa%d9%82%d8%af%d9%85%d9%83/',
      ),
      Item(
        title: 'مكافأتك',
        icon: Icons.card_giftcard_outlined,
        url: 'https://fiekraah.com/',
      ),
      Item(
        title: 'المدونة',
        icon: Icons.article_outlined,
        url:
            'https://fiekraah.com/forums/forum/%d9%86%d9%82%d8%a7%d8%b4%d8%a7%d8%aa-%d8%a7%d9%84%d9%82%d8%b3%d9%85-%d8%a7%d9%84%d9%84%d9%81%d8%b8%d9%8a/',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xFF06b6d4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'لفظي',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 2;

                  if (constraints.maxWidth >= 600 &&
                      constraints.maxWidth < 900) {
                    crossAxisCount = 3; // Tablet
                  } else if (constraints.maxWidth >= 900) {
                    crossAxisCount = 4; // Large Tablet
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.15,
                    ),
                    itemBuilder: (context, index) {
                      return FeatureCard(
                        item: items[index],
                        color: Colors.blue,
                        iconColor: Color(0xFF06b6d4),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
