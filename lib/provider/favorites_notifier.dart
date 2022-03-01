import 'package:apod_gallery/components/picture_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends StateNotifier<List<PictureCard>> {
  FavoritesNotifier() : super([]);

  void addFavorite(PictureCard picture) {
    state = [
      ...state,
      picture,
    ];
  }

  void removeFavorite(String url) {
    state = [
      for (final card in state)
        if (card.url != url) card
    ];
  }
}
