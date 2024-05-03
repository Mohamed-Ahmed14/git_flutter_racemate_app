import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import '../../../model/filter_model.dart';
import '../../../view_model/utils/custom_text.dart';

class FilterBoxWidget extends StatelessWidget {
  final FilterModel filterModel;
  const FilterBoxWidget({required this.filterModel,super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        filterModel.onTap!(context);
      },
      child: Container(
        height: 32.h,
        padding: EdgeInsetsDirectional.only(
            start: 8.w,
            top: 2.h,
            end: 8.w,
            bottom: 2.h
        ),
        decoration: BoxDecoration(
          color: filterModel.isSelected?Color(0xff1C325F):Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: Color(0xff1C325F),
            width: 1.w,
          ),
        ),
        child: filterModel.name == "Filter"?
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.filter_alt_rounded,
              color:filterModel.isSelected?Colors.white:Color(0xff1C325F),
              size: 22.r,),
            CustomText(text:"${filterList.
            where((element) => element.isSelected ==true).
            toList().length-1}",
              color:filterModel.isSelected?Colors.white:Color(0xff1C325F),
              fontSize: 14.sp,fontWeight: FontWeight.w500,),

          ],
        ):Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: filterModel.name,
              color:filterModel.isSelected?Colors.white:Color(0xff1C325F),
              fontSize: 14.sp,fontWeight: FontWeight.w500,),
            Icon(Icons.keyboard_arrow_down_rounded,
              color:filterModel.isSelected?Colors.white:Color(0xff1C325F),
              size: 20.r,),
          ],
        ),
      ),
    );
  }
}
