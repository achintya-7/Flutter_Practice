// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matcher/matcher.dart';
import 'package:practice/models/catalog.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage(this.catalog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.red500.make(),
            ElevatedButton(
              onPressed: () {},

              // here all means that the designing will be there even if button is pressed or not
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.theme.buttonColor,
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder())),

              child: "Add to Cart".text.make(),
            ).wh(150, 50),
          ],
        ).p16(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                // Expanded is a box
                child: VxArc(
                    // arc will form a container with top as an arc, go to the app page to understand
                    height: 10.0,
                    arcType: VxArcType.CONVEY,
                    edge: VxEdge.TOP,
                    child: Container(
                      color: context.cardColor,
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl5
                              .color(context.accentColor)
                              .bold
                              .make(),
                          5.heightBox,
                          catalog.desc.text.xl
                              .textStyle(context.captionStyle)
                              .make(),
                          10.heightBox,
                          "Dolores invidunt sed sed et diam eos dolor no, invidunt ipsum sed erat ipsum invidunt ea ipsum et aliquyam. Dolor amet amet amet sadipscing stet tempor magna. Consetetur diam takimata ut at dolores ea est, elitr et justo vero rebum amet diam. Et est gubergren."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16(),
                          10.heightBox,
                        ],
                      ).py16(),
                    )))
          ],
        ),
      ),
    );
  }
}
