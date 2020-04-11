import 'package:Artemisa/classes/property.dart';
import 'package:Artemisa/repositories/property_repository.dart';
import 'package:flutter/material.dart';

class PropertiesModel extends ChangeNotifier {
  Future<List<Property>> getListedProperties() async {
    return await PropertyRepository().listing();
  }
}
