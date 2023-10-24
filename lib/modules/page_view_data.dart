class Data {
  final String title;
  final String imageUrl;

  Data(
      {required this.title,
        required this.imageUrl});
}

final List<Data> myData = [
  Data(
      title: "In green food you will find all the foods you love",
      imageUrl: "assets/img1.png"),
  Data(
    title: "The Fastest Delivery Service in the world",
    imageUrl: "assets/img2.png",
  ),
  Data(
      title: "Let’s start ordering food now",
      imageUrl: "assets/img3.png")
];