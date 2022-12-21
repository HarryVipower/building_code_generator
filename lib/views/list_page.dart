import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:building_code_gen/controllers/input_logic.dart';
import 'package:building_code_gen/controllers/list_logic.dart';
import 'package:building_code_gen/controllers/tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../models/building.dart';

class ListBuildingsPage extends StatefulWidget {
  const ListBuildingsPage({Key? key, required this.title,}) : super(key: key);
  final String title;

  @override
  State<ListBuildingsPage> createState() => _ListBuildingsPageState();
}

class _ListBuildingsPageState extends State<ListBuildingsPage> {
  late Future resultsLoaded;
  TextEditingController searchController = TextEditingController();
  List allResults = [];
  List resultsList = [];

  @override
  void initState() {
    super.initState();
    searchController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    searchController.removeListener(onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    resultsLoaded = readBuildings();
  }

  onSearchChanged() {
    searchResultsList();
  }

  searchResultsList() {
    var showResults = [];

    if (searchController.text != '') {
      for (var i in allResults) {
        var name = i.name!.toLowerCase();
        var company = i.company!.toLowerCase();
        if (name.contains(searchController.text.toLowerCase()) || company.contains(searchController.text.toLowerCase())) {
          showResults.add(i);
        }
      }
    }
    else {
      showResults = List.from(allResults);
    }
    setState(() {
      resultsList = showResults;
    });
  }

  readBuildings() async {
    List data = await getBuildings();
    setState(() {
      allResults = data;
    });

    searchResultsList();
  }

  @override
  Widget build(BuildContext context) {
    String title = widget.title;

    Widget searchBar() {
      return Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Flexible(flex: 1, child: Text('Search Buildings:')),
            Flexible(flex:1, child: Container(
              width: double.infinity,
              height: 75,
              child: TextFormField(
                controller: searchController,
              ),
            ),)
          ],
        ),
      );
    }

    Widget buildingCard(Building building) {
      return Container(
        width: 300,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0, bottom: 24.0, left: 48.0, right: 48.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name:', style: headerStyle,),
                Text(building.name!, style: contentStyle,),
                const SizedBox(height: 12,),
                Text('Company:', style: headerStyle,),
                Text(building.company!, style: contentStyle,),
                const SizedBox(height: 12,),
                Text('Code:', style: headerStyle,),
                Text(building.code!, style: contentStyle,),
              ],
            ),
          ),
        ),
      );
    }

    Widget buildingList() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.63,
          width: double.infinity,
          child: ListView.builder(
            itemCount: resultsList.length,
            itemBuilder: (BuildContext context, int index) {
              log('searched results:');
              for (int i = 0; i < resultsList.length; i++) {
                log(resultsList[i].name!);
              }

              log('All results:');
              for (int i = 0; i < allResults.length; i++) {
                log(allResults[i].name!);
              }

              return buildingCard(resultsList[index]);
            },
          ),
        ),
      );
    }


    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(title),
      ),
      bottomNavigationBar: bottomBar(context),
      body: ListView(
        children: [
          Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(padding: const EdgeInsets.all(24.0), child: Text('Showing all buildings:', style: contentStyle,)),
            searchBar(),
            const Divider(),
            buildingList(),
          ],
        ),
      ]
      ),
    );
  }
}
