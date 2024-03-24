// To parse this JSON data, do
//
//     final shoesData = shoesDataFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_shop_nike/models/shoe_info.dart';

ShoesData shoesDataFromJson(String str) => ShoesData.fromJson(json.decode(str));

String shoesDataToJson(ShoesData data) => json.encode(data.toJson());

class ShoesData {
    List<ShoeInfo> items;

    ShoesData({
        required this.items,
    });

    factory ShoesData.fromJson(Map<String, dynamic> json) => ShoesData(
        items: List<ShoeInfo>.from(json["items"].map((x) => ShoeInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}
