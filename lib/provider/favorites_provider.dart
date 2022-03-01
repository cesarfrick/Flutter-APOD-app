import 'package:apod_gallery/components/picture_card.dart';
import 'package:apod_gallery/provider/favorites_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<PictureCard>>(
        (_) => FavoritesNotifier());
