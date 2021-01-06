
import 'dart:convert';
import 'package:flutter_app_mvvm/models/beans/PostBeans/PostBean.dart';
import 'package:flutter_app_mvvm/models/beans/UsersBeans/UserBean.dart';
import 'package:flutter_app_mvvm/models/movie.dart';
import 'package:http/http.dart' as http;
import '../api_list.dart';

class Webservice {

  Future<List<Movie>> fetchMovies(String keyword) async {

    final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";
    final response = await http.get(url);
    if(response.statusCode == 200) {

       final body = jsonDecode(response.body); 
       final Iterable json = body["Search"];
       return json.map((movie) => Movie.fromJson(movie)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }
  }

  Future<List<UserBean>> fetchUsers() async {

    final response = await http.get(APIS.usersList);
    if(response.statusCode == 200) {

      //final body = jsonDecode(response.body);
      List res = json.decode(response.body);
      List<UserBean>  _data = res.map((data) => UserBean.fromJsonMap(data)).toList();

       return _data;

    } else {
      throw Exception("Unable to perform request!");
    }
  }


  Future<List<PostBean>> fetchPosts() async {

    final response = await http.get(APIS.postList);
    if(response.statusCode == 200) {

      //final body = jsonDecode(response.body);
      List res = json.decode(response.body);
      List<PostBean>  _data = res.map((data) => PostBean.fromJsonMap(data)).toList();

      return _data;

    } else {
      throw Exception("Unable to perform request!");
    }
  }

}