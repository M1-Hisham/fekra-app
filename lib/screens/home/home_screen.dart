import 'package:fekra/core/widgets/app_bar.dart';
import 'package:fekra/core/widgets/app_drawer.dart';
import 'package:fekra/screens/home/widget/button.dart';
import 'package:fekra/screens/home/widget/card_view.dart';
import 'package:fekra/screens/quantitative_screen.dart';
import 'package:fekra/screens/verbal_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            spacing: 25,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: Color(0xFF11b981),
                  gradient: LinearGradient(
                    colors: [Color(0xFF079668), Color(0xFF0DB39E)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  spacing: 20,
                  children: [
                    Text(
                      'تعلّم واستمتع\n وحقق أعلى الدرجات بأفضل\n تحضير كمي ولفظي',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    button(
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => QuantitativeScreen(),
                          ),
                        );
                      },
                      title: 'كمي',
                      color: Color(0xFFf59e0b),
                    ),
                    button(
                      () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => VerbalScreen(),
                          ),
                        );
                      },
                      title: 'لفظي',
                      color: Color(0xFF06b6d4),
                    ),
                    button(
                      () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                'قريباً يتم اضافة التحصيلي',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            backgroundColor: Color(0xFF079668),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        );
                      },
                      title: 'التحصيلي',
                      color: Color(0x8D666868),
                    ),
                  ],
                ),
              ),
              cardView(
                icon: '✅',
                title: 'أسئلة شاملة ومنظمة',
                description:
                    'بنك ضخم من الأسئلة المتنوعة والمصنفة بعناية لكل المستويات.',
              ),
              cardView(
                icon: '🎥',
                title: 'شرح مبسط بالفيديو',
                description:
                    'دروس فيديو قصيرة وواضحة تشرح أصعب المفاهيم بطرق سهلة.',
              ),
              cardView(
                icon: '📊',
                title: 'متابعة الأداء والتقدم',
                description:
                    'تقارير مفصلة لمستواك تساعدك على تحديد نقاط قوتك وضعفك.',
              ),
              cardView(
                icon: '🗓️',
                title: 'خطط دراسية مخصصة',
                description:
                    'خطط تناسب جدولك وأهدافك لضمان أفضل استغلال للوقت.',
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
