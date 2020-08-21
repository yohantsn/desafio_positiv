// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositorie_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Repositorie on _RepositoriesStore, Store {
  final _$repositModelAtom = Atom(name: '_RepositoriesStore.repositModel');

  @override
  ObservableList<RespositorieModel> get repositModel {
    _$repositModelAtom.reportRead();
    return super.repositModel;
  }

  @override
  set repositModel(ObservableList<RespositorieModel> value) {
    _$repositModelAtom.reportWrite(value, super.repositModel, () {
      super.repositModel = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_RepositoriesStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$countFavAtom = Atom(name: '_RepositoriesStore.countFav');

  @override
  int get countFav {
    _$countFavAtom.reportRead();
    return super.countFav;
  }

  @override
  set countFav(int value) {
    _$countFavAtom.reportWrite(value, super.countFav, () {
      super.countFav = value;
    });
  }

  final _$listToSaveAtom = Atom(name: '_RepositoriesStore.listToSave');

  @override
  ObservableList<dynamic> get listToSave {
    _$listToSaveAtom.reportRead();
    return super.listToSave;
  }

  @override
  set listToSave(ObservableList<dynamic> value) {
    _$listToSaveAtom.reportWrite(value, super.listToSave, () {
      super.listToSave = value;
    });
  }

  final _$repositFavAtom = Atom(name: '_RepositoriesStore.repositFav');

  @override
  ObservableList<RespositorieModel> get repositFav {
    _$repositFavAtom.reportRead();
    return super.repositFav;
  }

  @override
  set repositFav(ObservableList<RespositorieModel> value) {
    _$repositFavAtom.reportWrite(value, super.repositFav, () {
      super.repositFav = value;
    });
  }

  final _$getRepositAsyncAction = AsyncAction('_RepositoriesStore.getReposit');

  @override
  Future getReposit() {
    return _$getRepositAsyncAction.run(() => super.getReposit());
  }

  final _$saveRepositAsyncAction =
      AsyncAction('_RepositoriesStore.saveReposit');

  @override
  Future saveReposit(RespositorieModel _repositModel, int index) {
    return _$saveRepositAsyncAction
        .run(() => super.saveReposit(_repositModel, index));
  }

  final _$readFavRepositAsyncAction =
      AsyncAction('_RepositoriesStore.readFavReposit');

  @override
  Future readFavReposit() {
    return _$readFavRepositAsyncAction.run(() => super.readFavReposit());
  }

  final _$getFavRepositAsyncAction =
      AsyncAction('_RepositoriesStore.getFavReposit');

  @override
  Future getFavReposit() {
    return _$getFavRepositAsyncAction.run(() => super.getFavReposit());
  }

  final _$removeItemFavAsyncAction =
      AsyncAction('_RepositoriesStore.removeItemFav');

  @override
  Future removeItemFav(RespositorieModel _modelFav) {
    return _$removeItemFavAsyncAction.run(() => super.removeItemFav(_modelFav));
  }

  @override
  String toString() {
    return '''
repositModel: ${repositModel},
isLoading: ${isLoading},
countFav: ${countFav},
listToSave: ${listToSave},
repositFav: ${repositFav}
    ''';
  }
}
