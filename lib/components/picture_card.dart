import 'package:apod_gallery/models/picture_data.dart';
import 'package:apod_gallery/provider/favorites_provider.dart';
import 'package:apod_gallery/screens/picture_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PictureCard extends ConsumerStatefulWidget {
  final PictureData picture;

  const PictureCard({
    Key? key,
    required this.picture,
  }) : super(key: key);

  @override
  _PictureCardState createState() => _PictureCardState();
}

class _PictureCardState extends ConsumerState<PictureCard> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    final favorites = ref.read(favoritesProvider.notifier);

    setState(() {
      _isFavorite = !_isFavorite;
    });

    _isFavorite
        ? favorites.addFavorite(widget.picture)
        : favorites.removeFavorite(widget.picture.title);
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    final _picture = widget.picture;
    final favorites = ref.watch(favoritesProvider);
    _isFavorite = favorites.contains(widget.picture);

    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PictureDetails(picture: _picture);
          }));
        },
        onDoubleTap: () => _toggleFavorite(),
        child: Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.pink,
            image: DecorationImage(
                image: NetworkImage(_picture.mediaType == 'image'
                    ? _picture.url
                    : _picture.videoThumbnail),
                fit: BoxFit.cover),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Icon(
            _isFavorite
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: _isFavorite ? Colors.pinkAccent : Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
