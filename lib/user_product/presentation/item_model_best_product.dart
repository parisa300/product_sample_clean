class ItemModelBestProduct {
  final String image;
  final String title;

  ItemModelBestProduct({required this.image, required this.title});
}

class ItemProvider {
  List<ItemModelBestProduct> getDepositList() {
    return [
      ItemModelBestProduct(
          image: "assets/image/apple-iphone-13-pro.jpg",
          title: "iPhone 13 Pro"),
      ItemModelBestProduct(
          image: "assets/image/apple-iphone-13-pro.jpg",
          title: "iPhone 13 Pro"),
      ItemModelBestProduct(
          image: "assets/image/apple-iphone-13.jpg", title: "iPhone 13 "),
      ItemModelBestProduct(
          image: "assets/image/apple-iphone-13.jpg", title: "iPhone 13 "),
    ];
  }
}
