import 'dart:html';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_request/models/movie.dart';

class HttpService {
  final String apiKey = 'a490054c00da4ba365bbc4f53fde541a';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/550?api_key=';

  Future<List?> getPopularMovies() async {
    final String url = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['result'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("Fail");
      return null;
    }
  }
}
