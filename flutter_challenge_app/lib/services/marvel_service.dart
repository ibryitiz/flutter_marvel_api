import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter_challenge_app/models/marvel.dart';
import 'package:http/http.dart' as http;

class MarvelService {
  // ignore: constant_identifier_names
  static const PRIVATE_KEY = "YOUR PRIVATE KEY";
  // ignore: constant_identifier_names
  static const PUBLIC_KEY = "YOUR PUBLIC KEY";
  // ignore: constant_identifier_names
  static const MARVEL_URL = "https://gateway.marvel.com:443/v1/public/characters";

  Future<List<Marvel>> getMarvels({int limit = 30, int offset = 0}) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final hash = _generateMd5("$timestamp$PRIVATE_KEY$PUBLIC_KEY");

    final uri = Uri.parse("$MARVEL_URL?ts=$timestamp&apikey=$PUBLIC_KEY&hash=$hash&limit=$limit&offset=$offset");
    final response = await http.get(uri);

    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonModel = json.decode(response.body);
        final marvelList = jsonModel["data"]["results"].map((e) => Marvel.fromJson(e as Map<String, dynamic>)).toList().cast<Marvel>();
        return marvelList;
      default:
        return Future.error(response.statusCode);
    }
  }

  String _generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
