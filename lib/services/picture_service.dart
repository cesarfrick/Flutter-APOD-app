import 'dart:convert' show json;
import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:apod_gallery/auth/secrets.dart';
import 'package:apod_gallery/models/pictures.dart';

class PictureService {
  Future<Pictures> fetchPictureData() async {
    // final url = Uri.parse(
    //     'https://api.nasa.gov/planetarys/apod?api_key=$apiKey&thumbs=true&count=20');

    // try {
    //   final List rawData = json.decode(response.body);
    //   final pictures = Pictures.fromJson(rawData);

    //   return pictures;
    // } catch (err) {
    //   throw Exception('No Pictures for you \n ${err.toString()}');
    // }

    try {
      // final response = await http.get(url);
      final String response =
          await rootBundle.loadString('assets/data/apod.json');
      final List rawData = await json.decode(response);
      final Pictures pictures = Pictures.fromJson(rawData);

      return pictures;
    } catch (err) {
      throw Exception('No Pictures for you! \n $err');
    }
  }
}
