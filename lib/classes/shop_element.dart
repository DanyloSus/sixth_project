class ShopElement {
  ShopElement({
    required this.image,
    required this.name,
    required this.startPrice,
  });

  final String image;
  final String name;
  int startPrice;
  int level = 0;

  int get price => (level + 1) * startPrice;

  void buy() {
    level += 1;
  }
}
