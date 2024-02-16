import 'dart:convert';

import 'package:netflix/constants.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/models/movies.dart';

class Api {
  static const _trendingurl = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants
      .apiKey}';
  static const _topratedurl = 'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants
      .apiKey}';
  static const _upcomingurl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants
      .apiKey}';
  static const _searchurl = 'https://api.themoviedb.org/3/movie/search?api_key=${Constants
      .apiKey}';

  Future<List<Movies>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingurl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Something happend');
    }
  }

  Future<List<Movies>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topratedurl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Something happend');
    }
  }

  Future<List<Movies>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(_upcomingurl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Something happend');
    }
  }


  Future<List<Movies>> getSearchMovies() async {
    final response = await http.get(Uri.parse(_searchurl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movies) => Movies.fromJson(movies)).toList();
    } else {
      throw Exception('Something happend');
    }
  }
}
