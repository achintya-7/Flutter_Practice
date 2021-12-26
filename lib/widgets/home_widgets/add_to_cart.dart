// ignore_for_file: import_of_legacy_library_into_null_safe, implementation_imports, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/core/core.dart';
import 'package:practice/models/cart.dart';
import 'package:practice/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool IsInCart = _cart.items.contains(catalog) ?? false; // ?? can be read as otherwise
    return ElevatedButton(
      onPressed: () {
        // if it is not in cart, excecute
        if (!IsInCart) {
          AddMutation(catalog);
        }
      },

      // here all means that the designing will be there even if button is pressed or not
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            context.theme.buttonColor,
          ),
          shape: MaterialStateProperty.all(StadiumBorder())),

      child: IsInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
