// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:practice/widgets/themes.dart';
import 'package:velocity_x/src/extensions/context_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(context.theme.accentColor).make(),
        "Trending products".text.xl2.color(context.theme.accentColor).make(),
      ],
    );
  }
}
