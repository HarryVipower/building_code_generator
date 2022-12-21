import 'package:building_code_gen/views/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as m;

import '../views/list_page.dart';

void loadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const Center(child: CircularProgressIndicator(),),
  );
}

String generateCode() {
  int len = 3;
  var r = m.Random();
  const _chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
  return List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
}

void showSnackBar(String snackBarText, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snackBarText),));
}

Widget bottomBar(BuildContext context) {

  return Container(
    height: 75, width: double.infinity,
    padding: const EdgeInsets.all(8),
    color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(icon: const Icon(Icons.input, size: 30,), color: Colors.white, onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InputBuildingName(title: 'Title')),
          );
        },),
        Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
          ),
        ),
        IconButton(icon: const Icon(Icons.list, size: 30,), color: Colors.white, onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ListBuildingsPage(title: 'Title')),
          );
        },),
      ],
    ),
  );
}
