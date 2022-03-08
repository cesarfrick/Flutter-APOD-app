import 'dart:math' show pi;

import 'package:apod_gallery/models/picture_data.dart';
import 'package:apod_gallery/provider/favorites_notifier.dart';
import 'package:apod_gallery/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Favorites extends ConsumerWidget {
  const Favorites({Key? key}) : super(key: key);

  List<Widget> createTiles(
      {List<PictureData> cards = const [],
      required FavoritesNotifier notifier}) {
    return [
      for (final card in cards)
        Dismissible(
          key: Key(card.url),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ListTile(
                    iconColor: Colors.pinkAccent,
                    leading: Container(
                        alignment: Alignment.centerLeft,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              card.url,
                            ),
                            fit: BoxFit.cover,
                          ),
                        )),
                    title: Text(card.title),
                    subtitle: Text('Taken on ${card.date}'),
                    trailing: const Icon(
                      Icons.favorite_rounded,
                    ),
                  ),
                ),
              ],
            ),
          ),
          background: Container(
            color: Colors.redAccent.shade400,
            child: Padding(
              padding: const EdgeInsets.only(left: 64.0),
              child: Transform(
                transform: Matrix4.rotationY(pi),
                child: const Icon(
                  Icons.delete_sweep,
                  color: Colors.white,
                ),
              ),
            ),
            alignment: AlignmentDirectional.centerStart,
          ),
          secondaryBackground: Container(
            color: Colors.redAccent.shade400,
            child: const Padding(
              padding: EdgeInsets.only(right: 32.0),
              child: Icon(
                Icons.delete_sweep,
                color: Colors.white,
              ),
            ),
            alignment: AlignmentDirectional.centerEnd,
          ),
          onDismissed: (_) {
            notifier.removeFavorite(card.title);
          },
        ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _favorites = ref.watch(favoritesProvider);
    final _notifier = ref.read(favoritesProvider.notifier);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Pictures of the Day'),
          backgroundColor: Colors.pink,
        ),
        body: _favorites.isNotEmpty
            ? ListView(
                children: createTiles(cards: _favorites, notifier: _notifier),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("You haven't selected any favorite picture yet",
                        style: TextStyle(fontSize: 16, color: Colors.black54)),
                    Text(
                      '😢',
                      style: TextStyle(fontSize: 40),
                    ),
                  ],
                ),
              ));
  }
}
