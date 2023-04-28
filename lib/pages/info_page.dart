import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:terrabayt_uz/data/models/category_data.dart';
import 'package:terrabayt_uz/data/models/news_data.dart';
import 'package:terrabayt_uz/resources/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfoPage extends StatefulWidget {
  final NewsData newsData;

  const InfoPage(this.newsData, {Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white);

  @override
  void initState() {
    controller.loadHtmlString(widget.newsData.content);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              leading: Padding(
                padding: const EdgeInsets.all(4.0),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                      padding: const EdgeInsets.only(left: 8),
                      height: 20,
                      width: 20,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: const Icon(Icons.arrow_back_ios)),
                ),
              ),
              backgroundColor: AppColors.primary,
              flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImage(
                imageUrl: widget.newsData.image,
                fit: BoxFit.cover,
              )),
            ),
          ];
        },
        body: Container(
          color: Colors.white,
          // child: WebViewWidget(
          //   controller: controller,
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: HtmlWidget(
              widget.newsData.content,
              textStyle: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              renderMode: RenderMode.listView,
              // turn on `webView` if you need IFRAME support (it's disabled by default)
            ),
          ),
        ));
  }
}
