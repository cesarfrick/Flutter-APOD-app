import 'package:flutter/material.dart';
// import 'package:apod_gallery/models/pictures.dart';

class Favorites extends StatelessWidget {
  // final Pictures pictures;

  // const Favorites({Key? key, required this.pictures}) : super(key: key);
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Pictures of the Day'),
        backgroundColor: Colors.pink,
      ),
      body: const Text(
        'Favorites',
        style: TextStyle(fontSize: 36),
      ),
    );
  }
}
