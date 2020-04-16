import 'dart:convert';

import 'package:Artemisa/models/property.dart';
import 'package:http/http.dart' as http;

class PropertyRepository {
  String _baseUrl = "http://192.168.100.6/api/";
  Future<List<Property>> listing() async {
    final response = await http.get('${_baseUrl}properties');
    if (response.statusCode == 200) {
      List<dynamic> properties = json.decode(response.body);
      final props =
          properties.map((property) => Property.fromJson(property)).toList();
      return props;
    } else
      throw Exception('Failed to load properties');
  }

  Future<DetailedProperty> details(String id) async {
    final response = await http.get('${_baseUrl}properties/$id');
    if (response.statusCode == 200) {
      return DetailedProperty.fromJson(json.decode(response.body));
    } else
      throw Exception('Failed to load property');
  }
}
