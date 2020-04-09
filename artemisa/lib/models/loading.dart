import 'package:flutter/material.dart';

class LoadingModel extends ChangeNotifier{
  bool _loading = false;
  get loading => _loading;
  set loading(bool isLoading){
    assert(isLoading != null);
    _loading = isLoading;
    notifyListeners();
  }
}