import 'package:flutter/material.dart';

class Property {
  final String id, title, minimumStayRequirement, updatedAt, createdAt, homeId;
  final int type;
  final double monthlyPrice, securityDepositPrice, rating;
  final bool listed;
  final List<String> pictures;

  Property(
      {@required this.id,
      @required this.title,
      @required this.minimumStayRequirement,
      @required this.updatedAt,
      @required this.createdAt,
      @required this.homeId,
      @required this.monthlyPrice,
      @required this.securityDepositPrice,
      @required this.rating,
      @required this.listed,
      @required this.pictures,
      this.type});

  factory Property.fromJson(Map<String, dynamic> json) {
    List<String> parsedPictures = List.from(json['pictures']);
    return Property(
      id: json['_id'],
      title: json['title'],
      minimumStayRequirement: json['minimum_stay_requirement'],
      updatedAt: json['updated_at'],
      createdAt: json['created_at'],
      homeId: json['home_id'],
      type: json['type'],
      monthlyPrice: json['monthly_price'],
      securityDepositPrice: json['security_deposit_price'].toDouble(),
      rating: json['rating'],
      listed: json['listed'],
      pictures: parsedPictures,
    );
  }
}

class DetailedProperty {
  final String title, neighborhood;
  final double price;
  final Map<String, dynamic> host;

  DetailedProperty(
      {@required this.title,
      @required this.neighborhood,
      @required this.price,
      @required this.host});

  factory DetailedProperty.fromJson(Map<String, dynamic> json) {
    return DetailedProperty(
        title: json['title'],
        neighborhood: json['neighborhood'],
        price: json['price'],
        host: json['host']);
  }
}
