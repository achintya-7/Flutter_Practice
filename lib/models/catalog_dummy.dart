// ignore_for_file: unnecessary_new
class CatalogModel {
  static List<Item> items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12th generation",
        price: 999,
        color: "#33505a",
        image:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRISJ6msIu4AU9_M9ZnJVQVFmfuhfyJjEtbUm3ZK11_8IV9TV25-1uM5wHjiFNwKy99w0mR5Hk&usqp=CAc")
  ];

  static List<Item> products = [
    Item(
        // calling the constructor in the list directly
        id: 3,
        name: "Lataralus",
        desc: "Math rock",
        image:
            "https://upload.wikimedia.org/wikipedia/en/6/63/Tool_-_Lateralus.jpg",
        price: 59), // 1st item
    item1, // 2nd item
    item2 // 3rd item
  ];
}

class Item {
  // final kinda will behave like private
  final int id;
  final String name;
  final String desc;
  final String image;
  final String? color;
  final int price;

  // this constructor is called a named constructor. It will make objects by using an id like in lists
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.image,
      this.color,
      required this.price});

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map["id"],
      name: map["name"],
      desc: map["desc"],
      price: map["price"],
      color: map["color"],
      image: map["image"],
    );
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}

// calling the constructor normally
Item item1 = new Item(
  id: 1,
  name: "Mfdoom",
  desc: "Best album ever",
  image:
      "https://i.pinimg.com/originals/8c/79/46/8c794678213b9d32cd7e12168badc2f2.jpg",
  price: 0,
);

Item item2 = new Item(
    id: 2,
    name: "Kanye West",
    desc: "12/10",
    image:
        "https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/mbdtf-graham-sheedy.jpg",
    price: 45);

final products = [
  Item(
      // calling the constructor in the list directly
      id: 3,
      name: "Lataralus",
      desc: "Math rock",
      image:
          "https://upload.wikimedia.org/wikipedia/en/6/63/Tool_-_Lateralus.jpg",
      price: 59),
  item1,
  item2
];

// thhis producrt is made to follow the tutorial
final products2 = [
  Item(
      // calling the constructor in the list directly
      id: 3,
      name: "Lataralus",
      desc: "Math rock",
      image:
          "https://upload.wikimedia.org/wikipedia/en/6/63/Tool_-_Lateralus.jpg",
      price: 59),
];
