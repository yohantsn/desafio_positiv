import 'package:desafio_positiv/stores/repositorie_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ListFavRepositoriesView extends StatefulWidget {
  @override
  _ListFavRepositoriesViewState createState() =>
      _ListFavRepositoriesViewState();
}

class _ListFavRepositoriesViewState extends State<ListFavRepositoriesView> {
  final Repositorie _repositorie = Repositorie();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _repositorie.getFavReposit();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, "/");
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("Repositorios Favoritos"),
            centerTitle: true,
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
                    itemCount: _repositorie.repositFav.length ?? 0,
                  ),
          )),
        ));
  }

  Widget _listViewReposit(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Card(
        elevation: 3.0,
        child: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-0.9, 0.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) async {
        await _repositorie.removeItemFav(_repositorie.repositFav[index]);
        await _repositorie.readFavReposit();
      },
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
                                      "${_repositorie.repositFav[index].name}" ??
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
                                      "${_repositorie.repositFav[index].description}" ??
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
                                      "${_repositorie.repositFav[index].createdAt}" ??
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
                                      "${_repositorie.repositFav[index].language}" ??
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
                              "${_repositorie.repositFav[index].stargazersCount}"),
                        )
                      ],
                    )),
              ],
            )
          ],
        )),
      ),
    );
  }
}
