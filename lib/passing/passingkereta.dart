import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:uas_152020109/passing/movies.dart';

class Parsing extends StatefulWidget {
  @override
  State<Parsing> createState() => _ParsingState();
}

class _ParsingState extends State<Parsing> {

Future<List<Movies>> getMovies()async{
  String data = await
  DefaultAssetBundle.of(context).loadString("assets/data/movies.json");
  List mapData = jsonDecode(data);



  List<Movies> movies = mapData.map((movie) => Movies.fromJson(movie) ).toList();

  return movies;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Movies>>(
        future: getMovies(), 
        builder: (context, data) {
          if(data.hasData) {
            List<Movies> movies = data.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, Index){
                return ListTile(
                  leading: Container (
                    width: 120,
                    height:100,
                    child: Image.network(movies[Index].images![1], 
                    fit: BoxFit.cover,)),
                  title: Text(
                    movies[Index].title!, 
                    style: 
                    TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(movies[Index].plot!, 
                  style: TextStyle(fontSize: 11),
                  ),
                );
            });
          }
          else{
            return CircularProgressIndicator();
          }
        },
    ),
    );
  }
}