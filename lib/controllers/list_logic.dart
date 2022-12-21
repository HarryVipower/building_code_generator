import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/building.dart';

CollectionReference collection = FirebaseFirestore.instance.collection('buildings');

Future<List<Building>> getBuildings() async {

  List<Building> list = [];

  var query = await collection.get().then((value) {
    for (var i in value.docs) {
      list.add(Building(name: i.get('name'), code: i.get('code')));
    }
  });

  return list;
}

TextStyle headerStyle = const TextStyle(
  color: Colors.blue,
  fontSize: 12
);
TextStyle contentStyle = const TextStyle(
  color: Colors.black,
  fontSize: 16
);