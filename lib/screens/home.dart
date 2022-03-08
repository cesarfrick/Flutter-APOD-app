import 'package:flutter/material.dart';

import 'package:apod_gallery/services/picture_service.dart';
import 'package:apod_gallery/components/picture_card.dart';
import 'package:apod_gallery/models/pictures.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Pictures> _pictures;

  @override
  void initState() {
    super.initState();

    _pictures = PictureService().fetchPictureData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Picture of the Day Gallery'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 8.0),
        child: FutureBuilder(
            future: _pictures,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data as Pictures;
                final pictures = data.pictures;

                return GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                  children: pictures
                      .map((picture) => PictureCard(
                            picture: picture,
                          ))
                      .toList(),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
