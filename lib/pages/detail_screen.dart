import 'package:flutter/material.dart';
import 'package:uts/packages/movie_information.dart';

import 'package:uts/view/mobile_view.dart';
import 'package:uts/view/web_view.dart';

class DetailScreen extends StatelessWidget {
  final movie_information detail;

  DetailScreen({required this.detail});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cxt, constrains) {
      if (constrains.maxWidth <= 550) {
        return MobileViewDetail(detail: detail);
      } else {
        return WebViewDetail(detail: detail);
      }
    });
  }
}
