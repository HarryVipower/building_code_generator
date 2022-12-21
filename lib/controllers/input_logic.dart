import 'dart:developer';
import 'dart:math' as m;

import 'package:building_code_gen/controllers/tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../models/building.dart';
import '../models/response.dart';

CollectionReference collection = FirebaseFirestore.instance.collection('buildings');

Future<Response> pushToFirestore(Building building) async {
  Response response = Response();
  DocumentReference docRef = collection.doc();

  Map<String, dynamic> data = <String, dynamic>{
    'name': building.name!,
    'code': building.code!
  };

  var result = await docRef.set(data).whenComplete(() {
    response.code = 200;
    response.message = 'Successfully added to firestore';
  })
      .catchError((e) {
    response.code = 500;
    response.message = e;
  });

  return response;
}

Future<void> addBuilding(String buildingName, BuildContext context) async {
  loadingDialog(context);
  String code = generateCode();

  //check code uniqueness
  code = await checkCode(code, context);

  Building building = createBuilding(buildingName, code);
  await pushToFirestore(building);
  Navigator.pop(context);
  showSnackBar('$buildingName added! Generated 3 digit code: $code.', context);
}

Future<String> checkCode(String code, BuildContext context) async {
  loadingDialog(context);
  bool codeFound = false;
  String confirmedCode = code;

  var query = await collection.where('code', isEqualTo: code).get().then((value) async {
    for (var i in value.docs) {
      codeFound = true;
      log('here');
    }
  });

  if (codeFound) {
    log('new code');
    String newCode = await checkCode(generateCode(), context);
    Navigator.pop(context);
    return newCode;
  }
  else {
    log('old code');
    Navigator.pop(context);
    return confirmedCode;
  }
}