import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/filter_model.dart';
import 'filter_box_widget.dart';

class ShowFilters extends StatelessWidget {
  const ShowFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 32.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return FilterBoxWidget(filterModel:filterList[0].isSelected?
            filterList[index]:filterList[++index],);
          }, separatorBuilder: (context, index) {
        return SizedBox(width: 10.w,);
      }, itemCount:filterList[0].isSelected?
      filterList.length:filterList.length-1),
    );
  }
}
