// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:practice/models/catalog.dart';
import 'package:practice/models/item_widgets.dart';
import 'package:practice/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 1;
  final String name = "Achintya";

  // this class will initialize befoere the build of the widgets
  // we will use this to load the json and then display the widgets on the page
  @override
  void initState() {
    super.initState();
    loadData();
  }

  // this function will be used to read the json
  // we will use async and await as json reading may take time
  loadData() async {
    await Future.delayed(Duration(seconds: 2));  // we will wait for 1 second before loading the contnent.
    var catalogJson = await rootBundle.loadString("assets/files/items.json");
    var decodedData = jsonDecode(catalogJson);  // we will convert the string data of json into object
    var productsData = decodedData["products"];

    // this following code of line will fill the items list which was empty by default
    CatalogModel.items = List.from(productsData).map((item) => Item.fromMap(item)).toList();
    
    // this will rebuild the widgets with the required data
    setState(() {});
    // print(catalogJson);
    // print(decodedData);
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
        // backgroundColor: Colors.white,
        // title: Text("Catalog App",
        //   style: TextStyle(color: Colors.black)),
        // iconTheme: IconThemeData(color: Colors.black)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
         ? ListView.builder(
          itemCount: CatalogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.items[index],
              );
            },
          )
          : Center( child: CircularProgressIndicator(),
        ),

        // code to use dummylist but we dont need that now
        // child: ListView.builder(
        //   itemCount: dummylist.length,
        //   itemBuilder: (context, index) {
        //     return ItemWidget(
        //       item: dummylist[index],
        //     );
      ),
      drawer: MyDrawer(),
    );
  }
}
