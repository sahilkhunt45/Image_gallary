class Box {
  final String image;
  final List images;

  Box({
    required this.image,
    required this.images,
  });
  factory Box.fromJSON(Map json) {
    return Box(
      image: json["image"],
      images: json["images"],
    );
  }
}
