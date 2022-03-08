import 'package:apod_gallery/models/picture_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesNotifier extends StateNotifier<List<PictureData>> {
  FavoritesNotifier() : super([]);

  void addFavorite(PictureData picture) {
    state = [
      ...state,
      picture,
    ];
  }

  void removeFavorite(String title) {
    state = [
      for (final PictureData card in state)
        if (card.title != title) card
    ];
  }
}
