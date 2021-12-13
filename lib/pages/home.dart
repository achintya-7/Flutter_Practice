// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:practice/models/catalog.dart';
import 'package:practice/models/item_widgets.dart';
import 'package:practice/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 1;
  final String name = "Achintya";

  @override
  Widget build(BuildContext context) {
    final dummylist = List.generate(30, (index) => CatalogModel.products2[0]);
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
        child: ListView.builder(
          itemCount: CatalogModel.products.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.products[index],
            );
          },
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
