import 'dart:convert';
import 'package:desafio_positiv/core/file_manager.dart';
import 'package:desafio_positiv/models/repositorie_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart' show rootBundle;
part 'repositorie_store.g.dart';

class Repositorie = _RepositoriesStore with _$Repositorie;

abstract class _RepositoriesStore with Store{

  @observable
  ObservableList<RespositorieModel> repositModel = ObservableList<RespositorieModel>();

  @observable
  bool isLoading = false;

  @observable
  int countFav = 0;

  @observable
  ObservableList<dynamic> listToSave = ObservableList<dynamic>();

  @observable
  ObservableList<RespositorieModel> repositFav = ObservableList<RespositorieModel>();


  @action
  getReposit() async{
    isLoading = true;
    ObservableList<RespositorieModel> _listModel = ObservableList<RespositorieModel>();
    http.Response response;
    response = await http.get("https://api.github.com/users/flutter/repos");
    if(response.body.isNotEmpty) {
      List<dynamic> _listResponse = json.decode(response.body);
      _listResponse.forEach((element) {
        _listModel.add(RespositorieModel.fromJson(element));
      });
      _listModel.sort((a,b){
        return b.stargazersCount.compareTo(a.stargazersCount);
      });
      repositModel = _listModel;
    }
    isLoading = false;
  }

  @action
  saveReposit(RespositorieModel _repositModel, int index) async{
    final file = await FileManager().getFile();
    var resultJson = await file.readAsString();
    bool _isEqual = false;
    if(resultJson.isNotEmpty) {
      List _list = json.decode(resultJson);
      _list.forEach((element) {
        if (element["id"] == _repositModel.id) {
          _isEqual = true;
          return;
        }
      });
      if (!_isEqual) {
        _list.add(_repositModel.toJson());
        String data = json.encode(_list);
        await file.writeAsString(data);
        this.listToSave.clear();
        _list.forEach((element) {
          this.listToSave.add(element);
        });
        this.countFav = this.listToSave.length;
      }
    }
  }

  @action
  readFavReposit() async {
    try {
      final file = await FileManager().getFile();
      var resultJson = await file.readAsString();
      if(resultJson.isNotEmpty) {
        List _list = json.decode(resultJson);
        this.listToSave.clear();
        _list.forEach((element) {
          this.listToSave.add(element);
        });
        this.countFav = listToSave.length;
      }
    } catch (e) {
      print(e);
    }
  }

  @action
  getFavReposit() async {
    try {
      this.isLoading = true;
      this.repositFav.clear();
      final file = await FileManager().getFile();
      var resultJson = await file.readAsString();
      if(resultJson.isNotEmpty) {
        List _listFav = json.decode(resultJson);
        _listFav.forEach((element) {
          this.repositFav.add(RespositorieModel.fromJson(element));
        });
        this.repositFav.sort((a, b) {
          return b.stargazersCount.compareTo(a.stargazersCount);
        });
      }
      this.isLoading = false;
    } catch (e) {
      print(e);
      this.isLoading = false;
    }
  }

  @action
  removeItemFav(RespositorieModel _modelFav) async{
    this.isLoading = true;
    int _count = 0;
    this.repositFav.forEach((element) {
      if(element.id == _modelFav.id){
        return;
      }
      _count ++;
    });
    this.repositFav.removeAt(_count);
    this.listToSave.clear();
    this.repositFav.forEach((element) {
      listToSave.add(element.toJson());
    });
    String data = json.encode(this.listToSave);
    final file = await FileManager().getFile();
    await file.writeAsString(data);
    this.countFav = this.listToSave.length;
    print(this.countFav);
    this.isLoading = false;
  }
}