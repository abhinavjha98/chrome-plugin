import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewFlutterUrl extends StatefulWidget {
  final String url;
  const WebViewFlutterUrl({Key key, this.url}) : super(key: key);

  @override
  _WebViewFlutterUrlState createState() => _WebViewFlutterUrlState();
}

class _WebViewFlutterUrlState extends State<WebViewFlutterUrl> {
  FlutterWebviewPlugin flutterWebviewPlugin = FlutterWebviewPlugin();
  var urlString;

  launchUrl() {
    setState(() {
      flutterWebviewPlugin.reloadUrl(urlString);
    });
  }

  @override
  void initState() {
    super.initState();
    // print(widget.url);
    // urlString = widget.url;
    // flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
    //   print(wvs.type);
    // });
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
        gestureNavigationEnabled: false,
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted);
  }
}
