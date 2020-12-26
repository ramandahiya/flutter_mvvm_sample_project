

import 'package:flutter/material.dart';
import 'package:flutter_app_mvvm/services/webservice.dart';
import 'package:flutter_app_mvvm/view%20models/movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {

  List<MovieViewModel> movies = List<MovieViewModel>(); 

  Future<void> fetchMovies(String keyword) async {
    var results =  await Webservice().fetchMovies(keyword);
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    print(this.movies);
    notifyListeners(); 
  }

}