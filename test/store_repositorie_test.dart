import 'package:desafio_positiv/stores/repositorie_store.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test("Teste get Repositories", () async{
    final _storeRepositorie = Repositorie();
    expect(_storeRepositorie.countFav, 0);
    await _storeRepositorie.getReposit();
    expect(_storeRepositorie.repositModel.length, 30);
  });
}