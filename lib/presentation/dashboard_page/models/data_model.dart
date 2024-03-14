class DataModel {
  String? image;
  String? title;
  String? description;
  double? price;
  double? oldPrice;
  String? disccountPrecentage;
  List<dynamic>? sizeList;
  String? docId;
  double? rating;
  String? review;

  DataModel(
      {this.image,
      this.description,
      this.title,
      this.oldPrice,
      this.price,
      this.disccountPrecentage,
      this.sizeList,
      this.docId,
      this.rating,
      this.review});

  DataModel.fromJson(Map<String, dynamic> json) {
    DataModel(
        image: json['image'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        oldPrice: json['old_price'],
        disccountPrecentage: json['disccountPrecentage'],
        sizeList: json['size_list'],
        rating: json['rating'],
        review: json['review']);
  }
}
