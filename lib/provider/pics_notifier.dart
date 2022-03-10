import 'package:apod_gallery/models/picture_data.dart';
import 'package:apod_gallery/models/pictures.dart';
import 'package:flutter/foundation.dart';
import 'package:apod_gallery/services/picture_service.dart';

enum LoadingState {
  isLoading,
  isLoaded,
  loadingError,
}

class PicsNotifier extends ChangeNotifier {
  List<PictureData> _origPics = [];
  List<PictureData> pics = [];
  LoadingState loadState = LoadingState.isLoading;

  PicsNotifier() {
    getDataFromService();
  }

  void filterPics(String text) {
    final regex = RegExp(text, caseSensitive: false);
    pics = _origPics.where((pic) => pic.title.contains(regex)).toList();
    notifyListeners();
  }

  void restorePics() {
    pics = _origPics;
    notifyListeners();
  }

  Future getDataFromService() async {
    try {
      Pictures data = await PictureService().fetchPictureData();
      _origPics = data.pictures;
      pics = data.pictures;
      loadState = LoadingState.isLoaded;

      notifyListeners();
    } on Exception catch (e) {
      loadState = LoadingState.loadingError;

      throw Exception(e);
    }
  }
}
