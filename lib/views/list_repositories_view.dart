import 'package:desafio_positiv/stores/repositorie_store.dart';
import 'package:desafio_positiv/views/list_fav_repositorie_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListRepositoriesView extends StatefulWidget {
  @override
  _ListRepositoriesViewState createState() => _ListRepositoriesViewState();
}

class _ListRepositoriesViewState extends State<ListRepositoriesView> {
  final Repositorie _repositorie = Repositorie();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repositorie.getReposit();
    _repositorie.readFavReposit();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Repositorios"),
        centerTitle: true,
        actions: [
          GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.bookmark_border,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context,"/favorite");
                        }),
                    Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                            height: 22,
                            width: 22,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            child: Observer(
                              builder: (_) => Text(
                                _repositorie.countFav > 9
                                    ? "9+"
                                    : "${_repositorie.countFav}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            )))
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context,"/favorite");
              })
        ],
      ),
      body: SafeArea(
          child: Observer(
        builder: (_) => _repositorie.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                padding: EdgeInsets.all(5),
                itemBuilder: _listViewReposit,
                itemCount: _repositorie.repositModel.length ?? 0,
              ),
      )),
    );
  }

  Widget _listViewReposit(BuildContext context, int index) {
    return GestureDetector(
      child: Card(
        child: Container(
            child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: RichText(
                        text: TextSpan(
                            text: "Repositorio: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "${_repositorie.repositModel[index].name}" ??
                                          "",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ]),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: RichText(
                        text: TextSpan(
                            text: "Descrição: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "${_repositorie.repositModel[index].description}" ??
                                          "",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ]),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: RichText(
                        text: TextSpan(
                            text: "Criado em: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "${_repositorie.repositModel[index].createdAt}" ??
                                          "",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ]),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: RichText(
                        text: TextSpan(
                            text: "Linguagem: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text:
                                      "${_repositorie.repositModel[index].language}" ??
                                          "",
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ]),
                      )),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFD700),
                        ),
                        Container(
                          child: Text(
                              "${_repositorie.repositModel[index].stargazersCount}"),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: _repositorie.repositModel[index].isFavorite
                          ? Colors.red
                          : Colors.grey,
                    ),
                    onPressed: () {
                      _repositorie.saveReposit(
                          _repositorie.repositModel[index], index);
                    },
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
