import 'package:apod_gallery/models/picture_data.dart';
import 'package:apod_gallery/provider/favorites_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesProvider =
    StateNotifierProvider<FavoritesNotifier, List<PictureData>>(
        (_) => FavoritesNotifier());
