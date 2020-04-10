import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Property extends Equatable {
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

  @override
  List<Object> get props => [
        id,
        title,
        minimumStayRequirement,
        updatedAt,
        createdAt,
        homeId,
        type,
        monthlyPrice,
        securityDepositPrice,
        rating,
        listed,
        pictures
      ];
}
