class Shoe {
  final String id;
  final String title;
  final String brand;
  final String brandImgUrl;
  final double price;
  final List<String> sizes;
  final List<String> productImgUrls;

  Shoe(
      {required this.id,
      required this.title,
      required this.brand,
      required this.brandImgUrl,
      required this.price,
      required this.sizes,
      required this.productImgUrls});
}
