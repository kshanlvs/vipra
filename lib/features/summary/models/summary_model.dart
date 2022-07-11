class SummaryModel {
  List<SummaryList>? summaryList;

  SummaryModel({this.summaryList});

  SummaryModel.fromJson(Map<String, dynamic> json) {
    if (json['summaryList'] != null) {
      summaryList = <SummaryList>[];
      json['summaryList'].forEach((v) {
        summaryList!.add(SummaryList.fromJson(v));
      });
    }
  }
}

class SummaryList {
  String? productId;
  String? name;
  String? brand;
  int? price;
  String? purchaseDate;

  SummaryList(
      {this.productId, this.name, this.brand, this.price, this.purchaseDate});

  SummaryList.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    brand = json['brand'];
    price = json['price'];
    purchaseDate = json['purchaseDate'];
  }

  String get productName => "$brand $name";
  String get productPrice => "Rs. $price";
}
