class DataModel {
  String? image;
  String? title;
  String? description;
  String? price;
  String? oldPrice;

  DataModel(
      {this.image, this.description, this.title, this.oldPrice, this.price});

  DataModel.fromJson(Map<String, dynamic> json) {
    DataModel(
        image: json['image'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        oldPrice: json['old_price']);
  }
}