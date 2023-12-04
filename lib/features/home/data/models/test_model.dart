import 'dart:convert';

import 'package:alemeno/features/home/domain/entities/test_entity.dart';

Test testFromJson(String str) => Test.fromJson(json.decode(str));

String testToJson(Test data) => json.encode(data.toJson());

class Test {
  String id;
  String title;
  int numberOfTests;
  double price;
  double offerPrice;

  Test({
    required this.id,
    required this.title,
    required this.numberOfTests,
    required this.price,
    required this.offerPrice,
  });

  //To entity Function
  TestEntity modelToEntity() {
    return TestEntity(
      id: id,
      title: title,
      numberOfTests: numberOfTests,
      price: price,
      offerPrice: offerPrice,
    );
  }

  factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["id"],
        title: json["title"],
        numberOfTests: json["numberOfTests"],
        price: json["price"],
        offerPrice: json["offerPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "numberOfTests": numberOfTests,
        "price": price,
        "offerPrice": offerPrice,
      };
}
