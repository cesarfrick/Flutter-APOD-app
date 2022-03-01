import 'package:apod_gallery/components/picture_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends StateNotifier<List<PictureCard>> {
  List<PictureCard> cards = [];

  FavoritesNotifier(this.cards) : super([]);

  void addFavorite(PictureCard picture) {
    state = [
      ...state,
      picture,
    ];

    // ignore: avoid_print
    print(state);
  }

  void removeFavorite(String url) {
    state = [
      for (final card in cards)
        if (card.url != url) card
    ];

    // ignore: avoid_print
    print(state);
  }
}
