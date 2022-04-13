import 'package:flutter/material.dart';
import 'package:uts/packages/movie_information.dart';
import 'package:uts/ui/banner.dart';
import 'package:uts/view/mobile_view.dart';
import 'package:uts/view/web_view.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cxt, constrains) {
      if (constrains.maxWidth <= 700) {
        return MobileView();
      } else {
        return WebView();
      }
    });
  }
}

class PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
      child: SizedBox(
        height: 140,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: popular_movies.length,
          itemBuilder: (context, index) {
            return popularInkwell(index: index); // Popular Movies
          },
          separatorBuilder: (context, index) => SizedBox(width: 16),
        ),
      ),
    );
  }
}

class MostWatchedList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
      child: SizedBox(
        height: 140,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: mostWatched_movies.length,
          itemBuilder: (context, index) {
            return mostWatchedInkwell(index: index); // Popular Movies
          },
          separatorBuilder: (context, index) => SizedBox(width: 16),
        ),
      ),
    );
  }
}
