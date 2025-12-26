import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  bool _isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
  }

  Future<void> _openWeb() async {
    final uri = Uri.parse('https://fiekraah.com/contact');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isTablet = _isTablet(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'تواصل معنا',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 40 : 20,
          vertical: isTablet ? 30 : 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title('تواصل معنا', isTablet),
            const SizedBox(height: 12),
            _paragraph(
              'يسعدنا دائمًا الاستماع إليكم وتلقي استفساراتكم. فريقنا متواجد لمساعدتكم والإجابة على جميع أسئلتكم.',
              isTablet,
            ),

            _section('معلومات التواصل المباشر', isTablet),

            _infoTile(
              icon: Icons.location_on,
              title: 'العنوان',
              value: 'مصر',
              isTablet: isTablet,
            ),

            _infoTile(
              icon: Icons.phone,
              title: 'هاتف الإدارة / شؤون الطلاب',
              value: '201080441846+',
              isTablet: isTablet,
            ),

            _infoTile(
              icon: Icons.email,
              title: 'البريد الإلكتروني',
              value: 'info@fiekraah.com\n support@fiekraah.com',
              isTablet: isTablet,
            ),

            _infoTile(
              icon: Icons.access_time,
              title: 'ساعات العمل الرسمية',
              value:
                  'من الأحد إلى الخميس،\nمن الساعة 8:00 صباحًا حتى 3:00 عصرًا',
              isTablet: isTablet,
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _openWeb,
                icon: const Icon(Icons.send),
                label: const Text(
                  'أرسل لنا رسالة مباشرة',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: isTablet ? 18 : 14),
                  textStyle: TextStyle(
                    fontSize: isTablet ? 18 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                  iconColor: Colors.white,
                  backgroundColor: const Color(0xFF079668),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
            Center(
              child: Text(
                '© 2025 منصة فكرة التعليمية',
                style: TextStyle(
                  fontSize: isTablet ? 14 : 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String text, bool isTablet) => Text(
    text,
    style: TextStyle(fontSize: isTablet ? 28 : 22, fontWeight: FontWeight.bold),
  );

  Widget _section(String text, bool isTablet) => Padding(
    padding: const EdgeInsets.only(top: 24, bottom: 12),
    child: Text(
      text,
      style: TextStyle(
        fontSize: isTablet ? 20 : 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Widget _paragraph(String text, bool isTablet) => Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text(
      text,
      style: TextStyle(fontSize: isTablet ? 16 : 14, height: 1.7),
    ),
  );

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
    required bool isTablet,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF079668), size: isTablet ? 28 : 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(fontSize: isTablet ? 15 : 13, height: 1.6),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
