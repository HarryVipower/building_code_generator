import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:building_code_gen/controllers/input_logic.dart';
import 'package:building_code_gen/controllers/tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

class InputBuildingName extends StatefulWidget {
  const InputBuildingName({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  State<InputBuildingName> createState() => _InputBuildingNameState();
}

class _InputBuildingNameState extends State<InputBuildingName> {
  TextEditingController buildingNameController = TextEditingController();

  Widget buildingNameInput() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Input building name:', textAlign: TextAlign.left,),
        SizedBox(
          width: 300, height: 50,
          child: TextFormField(
            controller: buildingNameController,
          ),
        ),
      ],
    );
  }

  Widget submitButton() {

    return ElevatedButton(
      onPressed: () async {
        await addBuilding(buildingNameController.text!, context);
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          buildingNameController.text = '';
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: const StadiumBorder(),
      ),
      child: const Text('Submit', style: TextStyle(color: Colors.white),),
    );
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Text(title),
        ),
        bottomNavigationBar: bottomBar(context),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              buildingNameInput(),
              const SizedBox(height: 12,),
              submitButton()
            ],
          ),
        ),
    );
  }
}
