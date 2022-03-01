import 'package:apod_gallery/provider/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Favorites extends ConsumerWidget {
  const Favorites({Key? key}) : super(key: key);

  List<Widget> createTiles({cards = const []}) {
    return [for (final card in cards) ListTile(title: Text(card.url))];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _favorites = ref.watch(favoritesProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorite Pictures of the Day'),
          backgroundColor: Colors.pink,
        ),
        body: _favorites.isNotEmpty
            ? ListView(
                children: createTiles(cards: _favorites),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('You haven\'t selected any favorite picture yet',
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
