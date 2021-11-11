import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewUrl extends StatefulWidget {
  final String url;
  const WebViewUrl({Key key, this.url}) : super(key: key);

  @override
  _WebViewUrlState createState() => _WebViewUrlState();
}

class _WebViewUrlState extends State<WebViewUrl> {
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
    print(widget.url);
    urlString = widget.url;
    flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged wvs) {
      print(wvs.type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      withJavascript: false,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
        ),
        title: Text(
          "SMS APP",
          style: TextStyle(color: Theme.of(context).colorScheme.secondary),
        ),
      ),
      url: urlString,
      withZoom: true,
    );
  }
}
