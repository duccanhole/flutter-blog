import 'dart:io';

import 'package:app/layout/LayoutWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewWidget extends StatefulWidget {
  const WebviewWidget({super.key, this.url});
  final String? url;

  @override
  State<StatefulWidget> createState() => WebviewWidgetState();
}

class WebviewWidgetState extends State<WebviewWidget> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutWidget(
        child: WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onProgress: (progress) {
        print("loading: $progress");
      },
    ));
  }
}
