import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfoScreen extends StatefulWidget {
  static const routeName = 'info-screen';
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  int _progress = 0;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    final url = ModalRoute.of(context)!.settings.arguments as String;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              WebView(
                onPageFinished: (_) => _progress = 0,
                gestureNavigationEnabled: true,
                onProgress: (int progress) {
                  setState(() {
                    _progress = progress;
                  });
                },
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
              ),
              Container(
                height: 1,
                width: size.width * _progress / 100,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
