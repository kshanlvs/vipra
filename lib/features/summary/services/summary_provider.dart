import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vipratechuserauth/features/summary/models/summary_model.dart';

class SummaryProvider extends ChangeNotifier {
  SummaryModel _summaryModel = SummaryModel();
  Map<String, dynamic> data = {
    "summaryList": [
      {
        "productId": "100",
        "name": "Mobile Phone",
        "brand": "Samsung",
        "price": 20000,
        "purchaseDate": "23-05-2022"
      },
      {
        "productId": "102",
        "name": "Earbuds",
        "brand": "Boat",
        "price": 2000,
        "purchaseDate": "03-05-2022"
      },
      {
        "productId": "103",
        "name": "TV",
        "brand": "LG",
        "price": 15000,
        "purchaseDate": "10-04-2022"
      }
    ]
  };

  // assuming this as an server call
  Future<SummaryModel?> getSummaryData() async {
    try {
      _summaryModel = SummaryModel.fromJson(data);
      return _summaryModel;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
        return null;
      }
    }
    return null;
  }
}
