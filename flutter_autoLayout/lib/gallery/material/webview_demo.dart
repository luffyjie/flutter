import 'dart:io';

import 'package:flutter_autoLayout/public.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  @override
  _WebViewDemoState createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://apple.com',
    );
  }
}
