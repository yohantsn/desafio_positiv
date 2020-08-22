import 'package:desafio_positiv/views/list_fav_repositorie_view.dart';
import 'package:desafio_positiv/views/list_repositories_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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


