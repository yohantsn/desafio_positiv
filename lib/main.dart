import 'package:desafio_positiv/views/list_fav_repositorie_view.dart';
import 'package:desafio_positiv/views/list_repositories_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (ctx) => ListRepositoriesView(),
        "/favorite": (ctx) => ListFavRepositoriesView()
      },
    )
  );
}


