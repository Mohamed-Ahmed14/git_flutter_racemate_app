import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../view_model/utils/functions/functions.dart';

class FilterModel{
  int id;
  String name;
  bool isSelected;
  void Function(BuildContext context)? onTap;

  FilterModel(this.id,this.name, this.isSelected, this.onTap);
}

List<FilterModel> filterList =[
  FilterModel(0,"Filter", false, (context)=>filterModelBottomSheet(context)),
  FilterModel(1,"Type",false,(context)=>typeModelBottomSheet(context)),
  FilterModel(2,"Location",false,(context)=>locationModelBottomSheet(context)),
  FilterModel(3,"Distance",false,(context)=>distanceModelBottomSheet(context)),
  FilterModel(4,"Date",false,(context)=>dateModelBottomSheet(context)),
];



