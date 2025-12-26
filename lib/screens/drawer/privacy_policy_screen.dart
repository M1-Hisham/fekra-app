import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  bool _isTablet(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide >= 600;
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
          'سياسة الخصوصية',
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
            Center(
              child: Text(
                'سياسة الخصوصية',
                style: TextStyle(
                  fontSize: isTablet ? 28 : 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF079668),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(child: _subtitle('آخر تحديث: 15 أكتوبر 2025', isTablet)),
            Divider(color: Colors.grey[300]),
            const SizedBox(height: 20),
            _paragraph(
              'تلتزم مؤسسة فكرة التعليمية (“نحن”، “لنا”، أو “المؤسسة”) بحماية واحترام خصوصية جميع مستخدمي منصتنا التعليمية (fiekraah.com)، بما في ذلك الطلاب، أولياء الأمور، والمعلمين. توضح سياسة الخصوصية هذه بالتفصيل كيفية جمع، استخدام، الكشف عن، وحماية معلوماتكم الشخصية عند استخدامكم لخدماتنا.',
              isTablet,
            ),

            _section('1. البيانات التي نجمعها', isTablet),
            _boldText('بيانات التسجيل الشخصية:', isTablet),
            _paragraph(
              'عند تسجيل حساب، قد نطلب منك تقديم معلومات تعريفية شخصية تشمل: الاسم الكامل، عنوان البريد الإلكتروني، وكلمة المرور.',
              isTablet,
            ),
            _boldText('بيانات الاستخدام والبيانات الفنية:', isTablet),
            _paragraph(
              'نقوم بجمع معلومات تلقائيًا حول كيفية الوصول إلى المنصة واستخدامها، مثل: عنوان IP، نوع المتصفح، الصفحات التي تزورها، وسجلات التقدم الدراسي.',
              isTablet,
            ),
            _boldText('ملفات تعريف الارتباط (Cookies):', isTablet),
            _paragraph(
              'نستخدم ملفات تعريف الارتباط لتتبع النشاط على منصتنا، تذكر معلومات تسجيل دخولك، وتخصيص تجربتك التعليمية.',
              isTablet,
            ),

            _section('2. كيف نستخدم بياناتكم', isTablet),
            _bullet('توفير وصيانة وتشغيل منصتنا التعليمية.', isTablet),
            _bullet(
              'إدارة حسابك وتمكينك من الوصول إلى المواد الدراسية.',
              isTablet,
            ),
            _bullet(
              'التواصل معك بشأن التحديثات الأكاديمية والدعم الفني.',
              isTablet,
            ),
            _bullet('تحليل البيانات لتحسين وتطوير خدماتنا.', isTablet),

            _section('3. مشاركة بياناتك والكشف عنها', isTablet),
            _paragraph(
              'نحن لا نبيع أو نؤجر معلوماتك الشخصية لأي طرف ثالث. قد نشارك معلوماتك فقط في حالات محدودة مثل: مع مزودي الخدمة بموجب اتفاقيات سرية، أو للامتثال للقوانين.',
              isTablet,
            ),

            _section('4. أمان بياناتك', isTablet),
            _paragraph(
              'أمن بياناتك هو أولويتنا القصوى. نحن نستخدم إجراءات أمنية إدارية وتقنية ومادية، بما في ذلك تشفير SSL، لحماية معلوماتك الشخصية. ومع ذلك، لا توجد طريقة آمنة بنسبة 100%.',
              isTablet,
            ),

            _section('5. حقوقك المتعلقة بالبيانات', isTablet),
            _paragraph(
              'لديك الحق في الوصول إلى معلوماتك الشخصية وتحديثها أو تصحيحها أو طلب حذفها من خلال صفحة إعدادات ملفك الشخصي.',
              isTablet,
            ),

            _section('6. خصوصية الأطفال', isTablet),
            _paragraph(
              'نحن لا نجمع عن قصد معلومات تعريفية شخصية من أي شخص دون السن القانونية دون موافقة الوالدين. إذا كنت ولي أمر وعلمت أن طفلك قد زودنا ببيانات، فيرجى الاتصال بنا.',
              isTablet,
            ),

            _section('7. التغييرات على سياسة الخصوصية', isTablet),
            _paragraph(
              'قد نقوم بتحديث سياسة الخصوصية من وقت لآخر. سنقوم بإعلامك بأي تغييرات عن طريق نشر السياسة الجديدة على هذه الصفحة وتحديث تاريخ “آخر تحديث”.',
              isTablet,
            ),

            _section('8. اتصل بنا', isTablet),
            _paragraph(
              'إذا كان لديك أي أسئلة أو استفسارات حول سياسة الخصوصية هذه، يمكنك التواصل معنا عبر البريد الإلكتروني المتاح في صفحة “تواصل معنا”.',
              isTablet,
            ),

            const SizedBox(height: 30),
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

  // Widget _title(String text, bool isTablet) => Text(
  //   text,
  //   style: TextStyle(fontSize: isTablet ? 28 : 22, fontWeight: FontWeight.bold),
  // );

  Widget _subtitle(String text, bool isTablet) => Text(
    text,
    style: TextStyle(fontSize: isTablet ? 16 : 14, color: Colors.grey[700]),
  );

  Widget _section(String text, bool isTablet) => Padding(
    padding: const EdgeInsets.only(top: 24, bottom: 8),
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

  Widget _boldText(String text, bool isTablet) => Padding(
    padding: const EdgeInsets.only(bottom: 4),
    child: Text(
      text,
      style: TextStyle(
        fontSize: isTablet ? 16 : 14,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _bullet(String text, bool isTablet) => Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('•  '),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: isTablet ? 16 : 14, height: 1.6),
          ),
        ),
      ],
    ),
  );
}
