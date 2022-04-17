import 'package:flutter/material.dart';

class CheckProvider extends ChangeNotifier{
   bool _selected=false;
  bool get select =>_selected;

  void toggle(bool selected){
    _selected=selected;
    notifyListeners();
  }

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


class CheckboxClass extends StatelessWidget {

  final CheckBoxTitle Checkbox;
  final void Function(bool)? onChanged;
  const CheckboxClass({Key? key,required this.Checkbox,required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: Checkbox.check,
      onChanged: (v)=>onChanged!(v!),
      title:Text(Checkbox.title!),);
  }
}


class CheckBoxTitle{
  final String? title;
  bool? check;

  CheckBoxTitle({required this.title,required this.check,});
}


