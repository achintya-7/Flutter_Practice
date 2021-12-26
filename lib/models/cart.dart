
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
  num get totalPrice => items.fold(
      0,
      (total, current) =>
          total + current.price); // used to add item from previous to current

  // Add Item
  void add(Item item) {
    _itemIDs.add(item.id);
  }

  // Remove Item
  void remoave(Item item) {
    _itemIDs.remove(item.id);
  }
}
