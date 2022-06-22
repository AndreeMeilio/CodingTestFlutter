class ProductModel {
  int _id;
  String _title;
  double _price;
  String _description;
  String _category;
  String _image;
  Map<String, dynamic> _rating;

  ProductModel(int id, String title, double price, String description,
      String category, String image, Map<String, dynamic> rating)
      : _id = id,
        _title = title,
        _price = price,
        _description = description,
        _category = category,
        _image = image,
        _rating = rating;

  factory ProductModel.fromJson(dynamic json) {
    String price = json["price"].toString();

    return ProductModel(json["id"], json["title"], double.parse(price),
        json["description"], json["category"], json["image"], json["rating"]);
  }

  int get id => _id;
  String get title => _title;
  double get price => _price;
  String get description => _description;
  String get category => _category;
  String get image => _image;
  Map<String, dynamic> get rating => _rating;
}
