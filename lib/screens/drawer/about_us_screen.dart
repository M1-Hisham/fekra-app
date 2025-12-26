import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isTablet = width >= 600;

    final double titleSize = isTablet ? 28 : 22;
    final double sectionTitleSize = isTablet ? 22 : 18;
    final double bodySize = isTablet ? 18 : 15;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'من نحن',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Header =====
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.school,
                    size: isTablet ? 90 : 70,
                    color: const Color(0xFF079668),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'مؤسسة فكرة التعليمية',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'بوابتكم نحو مستقبل تعليمي مشرق ومبتكر',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: bodySize,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ===== Description =====
            Text(
              'مرحبًا بكم في البوابة الرقمية لمؤسسة فكرة التعليمية. في عالم يتسارع فيه التطور، نؤمن بأن التعليم يجب أن يواكب هذا التغيير وأن يتجاوز الطرق التقليدية. من هذا المنطلق، تأسست منصتنا لتكون امتدادًا حيويًا لرؤيتنا التعليمية، وهدفها الأساسي هو بناء جسر متين من التواصل والمعرفة يربط بين الطالب، المعلم، وولي الأمر في بيئة تعليمية تفاعلية، آمنة، ومحفزة.\n\nنحن لسنا مجرد مدرسة، بل مجتمع تعليمي متكامل يسعى لتمكين كل طالب بالأدوات والمهارات التي يحتاجها ليس فقط للنجاح الأكاديمي، بل ليصبح فردًا فاعلاً ومبتكرًا في مجتمعه.',
              style: TextStyle(
                fontSize: bodySize,
                height: 1.7,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 32),

            // ===== Mission =====
            _SectionTitle('رسالتنا', sectionTitleSize),
            const SizedBox(height: 8),
            Text(
              'نسعى لتقديم تجربة تعليمية متميزة ومتاحة للجميع، تتجاوز حدود الفصول الدراسية التقليدية. نلتزم بتوفير أدوات رقمية حديثة ومحتوى تعليمي غني يسهل عملية التعلم، ويثير فضول الطلاب، ويجعل اكتساب المعرفة رحلة ممتعة ومستمرة.',
              style: TextStyle(fontSize: bodySize, height: 1.7),
            ),

            const SizedBox(height: 28),

            // ===== Vision =====
            _SectionTitle('رؤيتنا', sectionTitleSize),
            const SizedBox(height: 8),
            Text(
              'أن نكون المؤسسة التعليمية الرائدة في دمج التكنولوجيا بالتعليم بشكل فعال ومبتكر، وأن نصبح النموذج المرجعي في بناء بيئات تعلم ذكية. نطمح لتنشئة جيل من المفكرين النقديين، القادة المبدعين، والمواطنين العالميين القادرين على ترك بصمة إيجابية ومستدامة في العالم.',
              style: TextStyle(fontSize: bodySize, height: 1.7),
            ),

            const SizedBox(height: 28),

            // ===== Values =====
            _SectionTitle('قيمنا الأساسية', sectionTitleSize),
            const SizedBox(height: 12),
            _ValueItem(
              'التميز الأكاديمي',
              'نلتزم بأعلى معايير الجودة في مناهجنا وطرق تدريسنا.',
            ),
            _ValueItem(
              'الابتكار والإبداع',
              'نشجع على التفكير خارج الصندوق ونتبنى أحدث الوسائل التعليمية.',
            ),
            _ValueItem(
              'النزاهة والشفافية',
              'نعمل بوضوح ومصداقية ونبني علاقاتنا على الثقة المتبادلة.',
            ),
            _ValueItem(
              'المشاركة المجتمعية',
              'نعزز التعاون الفعال بين جميع أطراف العملية التعليمية.',
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final double size;
  const _SectionTitle(this.title, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: const Color(0xFF079668),
      ),
    );
  }
}

class _ValueItem extends StatelessWidget {
  final String title;
  final String description;
  const _ValueItem(this.title, this.description);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Color(0xFF079668), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, height: 1.6),
                children: [
                  TextSpan(
                    text: '$title\n',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
