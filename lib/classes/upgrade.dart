class Upgrade {
  Upgrade({
    required this.price,
    required this.image,
  });

  final String image;
  final int price;
  bool active = false;

  void buy() {
    active = true;
  }
}
