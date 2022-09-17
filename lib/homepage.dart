import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'modals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Box> photos = [];

  lodeJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/json/photo.json");

    List res = jsonDecode(jsonData);

    setState(() {
      photos = res.map((e) => Box.fromJSON(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    lodeJasonBank();
  }

  CarouselController buttonCarouselController = CarouselController();
  int initialPage = 0;
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ANIME"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: photos
                    .map(
                      (e) => StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed('slider', arguments: e);
                          },
                          child: Ink(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                image: DecorationImage(
                                  image: AssetImage(e.image),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
