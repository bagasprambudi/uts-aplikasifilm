import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uts/pages/fav_screen.dart';

import 'package:uts/packages/const.dart';
import 'package:uts/packages/movie_information.dart';
import 'package:uts/pages/home_screen.dart';
import 'package:uts/ui/banner.dart';
import 'package:uts/ui/fav_btn.dart';
import 'package:uts/ui/rate_btn.dart';

class WebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _scrollController = ScrollController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/main-bg.png'), fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, top: 32, right: 32),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'What would you like to watch?',
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1),
                      ),
                      Container(
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          child: IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavScreen())),
                            icon: Icon(Icons.favorite_border),
                            color: Colors.white,
                            iconSize: 22,
                            padding: EdgeInsets.symmetric(
                                horizontal: 2, vertical: 2),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: defPadding),
                        padding: EdgeInsets.symmetric(horizontal: defPadding),
                        height: 50,
                        decoration: BoxDecoration(
                            color: textColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: TextField(
                                  decoration: InputDecoration(
                                      hintText: 'Search',
                                      hintStyle: TextStyle(
                                          color: textColor,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w300),
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                  style:
                                      TextStyle(color: textColor, fontSize: 12),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ), // Search Bar
                Divider(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Popular Movies',
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: textColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                PopularList(),
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Most Watched',
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 1,
                            color: textColor,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox()
                    ],
                  ),
                ),
                MostWatchedList()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class FavWebView extends StatelessWidget {
  var constrain;

  FavWebView({required this.constrain});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            body: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/main-bg.png'), fit: BoxFit.fill)),
          ), //Background
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: Container(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(),
                    Padding(
                      padding: const EdgeInsets.all(defPadding),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.white.withOpacity(0.3),
                        child: IconButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          icon: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 14,
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    ), // Back buton
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Text(
                        'Your Favorite',
                        style: TextStyle(
                            fontSize: 38,
                            color: textColor,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Poppins'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    FavWebList(
                      lebar: constrain,
                    )
                  ],
                )
              ],
            ),
          ) //Blur
        ])),
      ),
    );
  }
}

class FavWebList extends StatelessWidget {
  var lebar;

  FavWebList({required this.lebar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: SizedBox(
        height: 560,
        width: double.infinity,
        child: lebar <= 1200
            ? GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return favInkwell(index: index);
                },
                itemCount: fav_movies.length,
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  childAspectRatio: 1,
                ),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return favInkwell(index: index);
                },
                itemCount: fav_movies.length,
              ),
      ),
    );
  }
}

class WebViewDetail extends StatelessWidget {
  final movie_information detail;
  WebViewDetail({required this.detail});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/main-bg.png'),
                      fit: BoxFit.fill)),
            ),
            Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(children: [
                    Center(
                      child: ShaderMask(
                        shaderCallback: (rectangle) {
                          return LinearGradient(
                                  colors: [Colors.white, Colors.transparent],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter)
                              .createShader(Rect.fromLTRB(
                                  0, 0, rectangle.width, rectangle.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Image.asset(
                          detail.imageAsset,
                          fit: BoxFit.fitWidth,
                          width: double.maxFinite,
                          height: 400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(defPadding),
                      child: CircleAvatar(
                        radius: 14,
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: IconButton(
                          onPressed: (() {
                            Navigator.pop(context);
                          }),
                          icon: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 14,
                            ),
                          ),
                          color: Colors.white,
                        ),
                      ),
                    )
                  ]), // Movie Picture
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.movie_outlined,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  decoration:
                                      BoxDecoration(color: Colors.black),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Genre',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Flexible(
                                        child: Text(
                                          detail.genre,
                                          style: TextStyle(
                                              fontSize: 14, color: textColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ), // Genre
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.access_time_outlined,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  decoration:
                                      BoxDecoration(color: Colors.black),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Duration',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Flexible(
                                        child: Text(
                                          detail.duration,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14, color: textColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ), // Durasi
                        Container(
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(4)),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.star,
                                    color: Colors.white,
                                    size: 32,
                                  ),
                                  decoration:
                                      BoxDecoration(color: Colors.black),
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Rating',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Flexible(
                                        child: Text(
                                          detail.rating,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14, color: textColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ), //Genre, Duration, Rating
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        thumbUp(),
                        SizedBox(
                          width: 16,
                        ),
                        thumbDown(),
                        SizedBox(
                          width: 16,
                        ),
                        favoriteBtn()
                      ],
                    ),
                  ), // Rate and Favorite
                  Padding(
                    padding: const EdgeInsets.only(left: 32, right: 32, top: 8),
                    child: Text(
                      detail.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          color: textColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 32, right: 32),
                    child: Text(
                      'Synopsis',
                      style: TextStyle(
                          fontSize: 22,
                          color: textColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8, left: 32, right: 32),
                    child: Text(
                      detail.synopsis,
                      style: TextStyle(
                          fontSize: 16,
                          color: textColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w300),
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
