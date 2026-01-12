import 'package:fekra/screens/drawer/about_us_screen.dart';
import 'package:fekra/screens/drawer/contact_us_screen.dart';
import 'package:fekra/screens/drawer/privacy_policy_screen.dart';
import 'package:fekra/screens/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          // ===== Header =====
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF079668), Color(0xFF0DB39E)],
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.school,
                      size: 42,
                      color: Color(0xFF079668),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'منصة فكرة التعليمية',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===== Menu Items =====
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: [
                _DrawerItem(
                  icon: Icons.info_outline,
                  title: 'من نحن',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AboutUsScreen()),
                    );
                  },
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 0.6,
                  indent: 20,
                  endIndent: 20,
                ),
                _DrawerItem(
                  icon: Icons.privacy_tip_outlined,
                  title: 'سياسة الخصوصية',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 0.6,
                  indent: 20,
                  endIndent: 20,
                ),
                _DrawerItem(
                  icon: Icons.support_agent_outlined,
                  title: 'تواصل معنا',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ContactUsScreen(),
                      ),
                    );
                  },
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 0.6,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
          ),

          // ===== Social Media =====
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                icon: FontAwesomeIcons.whatsapp,
                url: 'https://wa.me/201080441846',
              ),
              _SocialIcon(
                icon: Icons.telegram,
                url: 'https://t.me/+8zZqdWcJT744NTA0',
              ),
              _SocialIcon(
                icon: FontAwesomeIcons.youtube,
                url: 'https://youtube.com/@fekraaquadrat?si=9BVJ2W75ffxo3WtY',
              ),
            ],
          ),

          // ===== Footer =====
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Column(
              children: [
                // delete acount
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebViewScreen(
                          initialUrl: 'https://fiekraah.com/delete-account/',
                          'حذف الحساب',
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'حذف الحساب',
                    style: TextStyle(
                      color: Colors.red,
                      
                    ),
                  ),
                ),
                const Text(
                  'إصدار التطبيق 1.0.0',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                const Text(
                  '© 2025 منصة فكرة التعليمية',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= Drawer Item =================

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF079668)),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: onTap,
    );
  }
}

// ================= Social Icon =================

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;
  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          ScaffoldMessenger.of(
            // ignore: use_build_context_synchronously
            context,
          ).showSnackBar(const SnackBar(content: Text('تعذر فتح الرابط')));
        }
      },
      icon: Icon(icon, color: const Color(0xFF079668)),
    );
  }
}
