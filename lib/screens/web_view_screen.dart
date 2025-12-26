import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fekra/screens/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String initialUrl;
  final String title;
  const WebViewScreen(this.title, {super.key, required this.initialUrl});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  late StreamSubscription _connectivitySubscription;

  bool isLoading = true;
  bool hasInternet = true;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            setState(() => isLoading = true);
          },
          onPageFinished: (_) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));

    // مراقبة حالة الإنترنت
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      result,
    ) {
      if (result.contains(ConnectivityResult.none)) {
        setState(() {
          hasInternet = false;
        });
      } else {
        setState(() {
          hasInternet = true;
        });
        // _controller.reload();
        _controller.loadRequest(Uri.parse(widget.initialUrl));
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              hasInternet
                  ? Icons.refresh
                  : Icons.signal_wifi_connected_no_internet_4_sharp,
              color: Colors.black,
            ),
            onPressed: () => _controller.reload(),
          ),
        ],
      ),
      body: hasInternet
          ? Stack(
              children: [
                WebViewWidget(controller: _controller),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(color: Color(0xFF079668)),
                  ),
              ],
            )
          : NoInternetScreen(
              onRetry: () {
                _controller.loadRequest(Uri.parse(widget.initialUrl));
                setState(() {
                  hasInternet = true;
                  isLoading = true;
                });
              },
            ),
    );
  }
}
