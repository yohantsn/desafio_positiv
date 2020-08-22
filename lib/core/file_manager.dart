import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:imei_plugin/imei_plugin.dart';


class FileManager{
  Future<void> writeJson(Map<String,dynamic> data) async {

    String uuid = await  ImeiPlugin.getImei();
    log(uuid);
    log(data.toString());
    FirebaseFirestore.instance.collection("favoritos").doc(uuid).set(data);
  }

  Future<Map<String, dynamic>> readJson() async {
    String uuid = await  ImeiPlugin.getImei();
    log(uuid);
    DocumentSnapshot _result;
    try {
      var _result = await FirebaseFirestore.instance.collection("favoritos")
          .doc(uuid)
          .get();
      print(_result.data());
      return _result.data();
    }catch(e){
      return {"list":[]};
    }

  }
}