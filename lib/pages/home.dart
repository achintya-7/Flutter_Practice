// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:practice/models/catalog.dart';
import 'package:practice/models/item_widgets.dart';
import 'package:practice/widgets/drawer.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

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
    await Future.delayed(Duration(
        seconds: 2)); // we will wait for 1 second before loading the contnent.
    var catalogJson = await rootBundle.loadString("assets/files/items.json");
    var decodedData = jsonDecode(
        catalogJson); // we will convert the string data of json into object
    var productsData = decodedData["products"];

    // this following code of line will fill the items list which was empty by default
    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();

    // this will rebuild the widgets with the required data
    setState(() {});
    // print(catalogJson);
    // print(decodedData);
    // print(productsData);
  }

  // here we try a new type of writing UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mytheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),

              //if(Cata)
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Mytheme.darkBluishColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(Mytheme.darkBluishColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                  onPressed: () {},

                  // here all means that the designing will be there even if button is pressed or not
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Mytheme.darkBluishColor,
                    ), 
                    shape: MaterialStateProperty.all(StadiumBorder())
                  ),

                  child: "Buy".text.make(),
                )
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(Mytheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
