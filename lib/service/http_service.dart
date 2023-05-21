import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:p11_movies/models/movie.dart';

class HttpService {
  final String API_KEY = '67c6a339638ad587d4638d7b0a6fc56b';
  final String BASE_URI = 'https://api.themoviedb.org/3/';

  Future<List?> getPopularMovies() async {
    final String URI = '${BASE_URI}movie/popular?api_key=$API_KEY';
    print(URI);
    http.Response result = await http.get(Uri.parse(URI));
    if (result.statusCode == HttpStatus.ok) {
      print('sukses');
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
