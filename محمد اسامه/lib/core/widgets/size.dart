const imagesize = 60.0;

class Category {
  String pic;
  String name;
  Category({
    required this.pic,
    required this.name,
  });
}

List<Category> categoryList = [
  Category(pic: "assets/images/carpenter.png", name: "Carpenter"),
  Category(pic: "assets/images/plumber.png", name: "Plumber"),
  Category(pic: "assets/images/service.png", name: "AC Service"),
  Category(pic: "assets/images/electrician.png", name: "Electrican"),
  Category(pic: "assets/images/person.png", name: "Control"),
  Category(pic: "assets/images/construction-site.png", name: "Contruction"),
  Category(pic: "assets/images/interior-design.png", name: "Interior"),
  Category(pic: "assets/images/mover-truck.png", name: "Truck"),
  Category(pic: "assets/images/cleaning.png", name: "Cleaning"),
  Category(pic: "assets/images/painter.png", name: "Painter"),
  Category(pic: "assets/images/blacksmith.png", name: "Smith"),
];
