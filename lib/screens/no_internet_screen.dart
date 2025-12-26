import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  final VoidCallback onRetry;
  const NoInternetScreen({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isTablet = width >= 600;

    final double animationSize = isTablet ? 300 : 260;
    final double titleSize = isTablet ? 24 : 20;
    final double subTitleSize = isTablet ? 17 : 15;
    final EdgeInsets buttonPadding = isTablet
        ? const EdgeInsets.symmetric(horizontal: 36, vertical: 18)
        : const EdgeInsets.symmetric(horizontal: 28, vertical: 14);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: animationSize,
                  height: animationSize,
                  child: Lottie.asset('assets/No Internet Connection.json'),
                ),
                const SizedBox(height: 24),
                Text(
                  'لا يوجد اتصال بالإنترنت',
                  style: TextStyle(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'تأكد من اتصالك بالإنترنت ثم أعد المحاولة',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: subTitleSize, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                ElevatedButton.icon(
                  onPressed: onRetry,

                  icon: const Icon(Icons.refresh),
                  label: Text(
                    'إعادة المحاولة',
                    style: TextStyle(color: Colors.white, fontSize: titleSize),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF079668),
                    iconColor: Colors.white,
                    iconSize: titleSize,
                    textStyle: TextStyle(color: Colors.white),
                    padding: buttonPadding,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
