import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier{
  bool _selected=false;
  bool get selecte =>_selected;



  final List<CheckBoxTitle> _filter=[
    CheckBoxTitle(title: "Apple", check: false),
    CheckBoxTitle(title: "Mango", check: false),
    CheckBoxTitle(title: "Banana", check: false),
    CheckBoxTitle(title: "Orange", check: false),
  ];

  void selectFilter(CheckBoxTitle checkBoxState,bool selected){
    _filter.firstWhere((element) => element.title==checkBoxState.title).check=selected;
    notifyListeners();
  }

  List<CheckBoxTitle> get filter=>_filter;

}
