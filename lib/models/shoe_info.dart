// To parse this JSON data, do
//
//     final shoeInfo = shoeInfoFromJson(jsonString);

import 'dart:convert';

ShoeInfo shoeInfoFromJson(String str) => ShoeInfo.fromJson(json.decode(str));

String shoeInfoToJson(ShoeInfo data) => json.encode(data.toJson());

class ShoeInfo {
    String name;
    String slug;
    List<ColorInfo> colors;

    ShoeInfo({
        required this.name,
        required this.slug,
        required this.colors,
    });

    factory ShoeInfo.fromJson(Map<String, dynamic> json) => ShoeInfo(
        name: json["name"],
        slug: json["slug"],
        colors: List<ColorInfo>.from(json["colors"].map((x) => ColorInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "colors": List<dynamic>.from(colors.map((x) => x.toJson())),
    };
}

class ColorInfo {
    String color;
    String colorName;
    List<String> images;

    ColorInfo({
        required this.color,
        required this.colorName,
        required this.images,
    });

    factory ColorInfo.fromJson(Map<String, dynamic> json) => ColorInfo(
        color: json["color"],
        colorName: json["colorName"],
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "color": color,
        "colorName": colorName,
        "images": List<dynamic>.from(images.map((x) => x)),
    };
}
