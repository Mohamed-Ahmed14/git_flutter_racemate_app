import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../view_model/cubit/race_cubit/cubit.dart';
import '../../../../view_model/utils/custom_text.dart';

class FilterLocationWidget extends StatelessWidget {
  final Map<String,dynamic> location;
  final int index;
  const FilterLocationWidget({required this.index,required this.location,super.key});

  @override
  Widget build(BuildContext context) {

    return CheckboxListTile(
      activeColor: Color(0xff000A35),
      title: CustomText(text: "${location["country"]} (${location["len"]})",
        color: Color(0xff000A35),
       fontWeight: FontWeight.w400,fontSize: 16.sp,),
        value: location["value"], onChanged:(value){
        RaceCubit.get(context).addRemoveLocation(index, value!);
    });
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     CustomText(text: "${location["country"]} (${location["len"]})",color: Color(0xff000A35),
    //       fontWeight: FontWeight.w400,fontSize: 16.sp,),
    //     Checkbox(shape: RoundedRectangleBorder(),
    //       value: false, onChanged:(value) {
    //         print(value);
    //       },),
    //   ],
    // );
  }
}
