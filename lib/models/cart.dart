import 'package:practice/core/core.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  // collection of IDs - store IDs of each item
  final List<int> _itemIDs = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get items in the cart
  List<Item> get items => _itemIDs.map((id) => _catalog.getbyId(id)).toList();

  // Get total price
  num get totalPrice => items.fold(0, (total, current) => total + current.price); // used to add item from previous to current
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemIDs.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);

  @override
  perform() {
    store.cart._itemIDs.remove(item.id);
  }
}

