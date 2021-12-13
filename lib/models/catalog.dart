// ignore_for_file: unnecessary_new

class Item {
  // final kinda will behave like private
  final String id;
  final String name;
  final String desc;
  final String image;

  // this constructor is called a named constructor. It will make objects by using an id like in lists
  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.image});
}

// calling the constructor normally
Item item1 = new Item(
    id: "Achintya001",
    name: "Mfdoom",
    desc: "Best album ever",
    image: "https://i.pinimg.com/originals/8c/79/46/8c794678213b9d32cd7e12168badc2f2.jpg");

Item item2 = new Item(
    id: "Achintya001",
    name: "Kanye West",
    desc: "6/10",
    image: "https://images.fineartamerica.com/images/artworkimages/mediumlarge/3/mbdtf-graham-sheedy.jpg");

final products = [
  Item( // calling the constructor in the list directly
      id: "Achintya003",
      name: "Lataralus",
      desc: "Math rock",
      image: "https://upload.wikimedia.org/wikipedia/en/6/63/Tool_-_Lateralus.jpg"),
  item1,
  item2      
];

// thhis producrt is made to follow the tutorial
final products2 = [
  Item(
      // calling the constructor in the list directly
      id: "Achintya003",
      name: "Lataralus",
      desc: "Math rock",
      image: "https://upload.wikimedia.org/wikipedia/en/6/63/Tool_-_Lateralus.jpg"),
];
