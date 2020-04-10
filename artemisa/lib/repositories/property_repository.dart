import 'dart:convert';

import 'package:Artemisa/classes/property.dart';
import 'package:http/http.dart' as http;

class PropertyRepository {
  Future<List<Property>> listing() async {
    final response = await http.get('http://192.168.100.6/api/properties');
    if (response.statusCode == 200) {
      List<dynamic> properties = json.decode(response.body);
      final props = properties.map((property) => Property.fromJson(property)).toList();
      print(props);
      return props;
    } else
      throw Exception('Failed to load properties');
  }
}
