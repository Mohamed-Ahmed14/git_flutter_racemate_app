

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../view/widgets/filter_widgets/filter_location/filter_location_widget.dart';
import '../../../view/widgets/search_widgets/search_widget.dart';
import '../../cubit/race_cubit/cubit.dart';
import '../../cubit/race_cubit/state.dart';
import '../custom_elevated_button.dart';
import '../custom_text.dart';

void typeModelBottomSheet(BuildContext context){
  showModalBottomSheet(isScrollControlled: true,
    context: context, builder: (context) {
      return BlocBuilder<RaceCubit,RaceState>(
        builder: (context, state) {
          var cubit = RaceCubit.get(context);
          return Container(
            height: 346.h, width: 375.w,
            padding: EdgeInsetsDirectional.only(
                start: 8.w, top: 16.h,
                end: 8.w, bottom: 16.h
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 80.w,
                  child: Divider(
                    height: 3.h,
                    color: Colors.grey,

                  ),
                ),
                SizedBox(height: 5.h,),
                CustomText(text: "Race Type".toUpperCase(),color: Color(0xff000A35),
                  fontWeight: FontWeight.w900,fontSize: 22.sp,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Virtual",color: Color(0xff000A35),
                      fontWeight: FontWeight.w400,fontSize: 16.sp,),
                    Radio(activeColor: Color(0xff000A35),
                      value: "Virtual", groupValue: cubit.groupValue,
                      onChanged: (value){
                        cubit.changeGroupValue(value);
                      },),
                  ],
                ),
                Divider(
                  thickness: 0.5.w,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Real-time event",color: Color(0xff000A35),
                      fontWeight: FontWeight.w400,fontSize: 16.sp,),
                    Radio(activeColor: Color(0xff000A35),
                      value: "Real-time", groupValue: cubit.groupValue,
                      onChanged: (value){
                        cubit.changeGroupValue(value);
                      },),
                  ],
                ),
                Divider(
                  thickness: 0.5.w,
                  color: Colors.grey,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "All",color: Color(0xff000A35),
                      fontWeight: FontWeight.w400,fontSize: 16.sp,),
                    Radio(activeColor: Color(0xff000A35),
                      value: "All", groupValue: cubit.groupValue,
                      onChanged: (value){
                        cubit.changeGroupValue(value);
                      },),
                  ],
                ),
                CustomElevatedButton(
                  backgroundColor: Color(0xffFFB715),
                  width: 343.w,height: 42.h,borderRadius: 8.r,
                  padding: 10.sp,
                  borderColor: Colors.transparent,
                  child: CustomText(text: "Done",color: Color(0xff1C325F),
                    fontSize: 14.sp,fontWeight: FontWeight.w700,),
                  onPressed: (){
                    cubit.getTypeFilterResults();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },

      );
    },);
}

void locationModelBottomSheet(BuildContext context){
  showModalBottomSheet(isScrollControlled: true,
    context: context, builder: (context) {
      return BlocBuilder<RaceCubit,RaceState>(
        builder: (context, state) {
          return Container(
            width: 375.w,
            height: 661.h,
            padding: EdgeInsetsDirectional.only(
                start: 8.w,
                top: 24.h,
                end: 8.w,
                bottom: 24.h
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 80.w,
                  child: Divider(
                    height: 3.h,
                    color: Colors.grey,

                  ),
                ),
                SizedBox(height: 10.h,),
                CustomText(text: "Race Location".toUpperCase(),color: Color(0xff000A35),
                  fontWeight: FontWeight.w900,fontSize: 22.sp,),
                SizedBox(height: 20.h,),
                SearchWidget(),
                SizedBox(height: 389.h,
                  child: ListView.separated(
                    //shrinkWrap: true,
                    //physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FilterLocationWidget(location:RaceCubit.get(context).locationSearch[index],
                            index: index);
                      }, separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1.w,
                      color: Colors.grey,
                    );
                  }, itemCount: RaceCubit.get(context).locationSearch.length),
                ),
                SizedBox(height: 20.h,),
                CustomElevatedButton(
                  backgroundColor: Color(0xffFFB715),
                  width: 343.w,height: 42.h,borderRadius: 8.r,
                  padding: 10.sp,
                  borderColor: Colors.transparent,
                  child: CustomText(text: "Done",color: Color(0xff1C325F),
                    fontSize: 14.sp,fontWeight: FontWeight.w700,),
                  onPressed: (){
                    RaceCubit.get(context).getLocationFilterResults();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    },);
}

void dateModelBottomSheet(BuildContext context){
  RaceCubit.get(context).fromDateController.text =
      DateFormat('E, MMMM d, yyyy').format(DateTime.now());
  RaceCubit.get(context).toDateController.text =
      DateFormat('E, MMMM d, yyyy').format(DateTime.now());
  showModalBottomSheet(isScrollControlled: true,
    context: context, builder: (context) {
      return Container(
        height: 389.h,
        width: 375.w,
        padding: EdgeInsetsDirectional.only(
            start: 16.w,
            top: 24.h,
            end: 16.w,
            bottom: 24.h
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topRight: Radius.circular(12.r),
              topLeft: Radius.circular(12.r)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Center(
              child: Column(
                children: [
                  SizedBox(width: 80.w,
                    child: Divider(
                      height: 3.h,
                      color: Colors.grey,

                    ),
                  ),
                  SizedBox(height:10.h,),
                  CustomText(text: "Race Date".toUpperCase(),color: Color(0xff000A35),
                    fontWeight: FontWeight.w900,fontSize: 22.sp,),
                ],
              ),
            ),
            SizedBox(height: 20.h,),
            CustomText(text: "From",color: Color(0xff000A35),
              fontWeight: FontWeight.w400,fontSize: 16.sp,),
            SizedBox(height: 48.h,width: 343.w,
              child: TextFormField(
                controller: RaceCubit.get(context).fromDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color(0xffF77F00),
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color(0xffF77F00),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color(0xffF77F00),
                      width: 1.w,
                    ),
                  ),
                  contentPadding: EdgeInsetsDirectional.all(8.sp),
                  prefixIcon: Icon(Icons.date_range_rounded,color: Color(0xff1C325F),),
                ),
                keyboardType: TextInputType.none,
                onTap: (){
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2016),
                    lastDate: DateTime(2031),
                    initialDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: Colors.orange,
                            onPrimary: Colors.black,
                            surface: Colors.white,
                            onSurface: Colors.black,
                          ),
                          dialogBackgroundColor:Colors.orange,
                        ),
                        child: child!,
                      );
                    },
                  ).then((value) {
                    if(value != null)
                    {
                      RaceCubit.get(context).fromDateController.text = DateFormat('E, MMMM d, yyyy').format(value);
                      RaceCubit.get(context).startValue = value;
                    }

                  },
                  );

                },
              ),
            ),
            SizedBox(height: 20.h,),
            CustomText(text: "To",color: Color(0xff000A35),
              fontWeight: FontWeight.w400,fontSize: 16.sp,),
            SizedBox(height: 48.h,width: 343.w,
              child: TextFormField(
                controller: RaceCubit.get(context).toDateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color(0xffF77F00),
                      width: 1.w,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color(0xffF77F00),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(
                      color: Color(0xffF77F00),
                      width: 1.w,
                    ),
                  ),
                  contentPadding: EdgeInsetsDirectional.all(8.sp),
                  prefixIcon: Icon(Icons.date_range_rounded,color: Color(0xff1C325F),),
                ),
                keyboardType: TextInputType.none,
                onTap: (){
                  showDatePicker(
                    context: context,
                    firstDate: DateTime(2016),
                    lastDate: DateTime(2031),
                    initialDate: DateTime.now(),
                    builder: (context, child) {
                      return Theme(
                        data: ThemeData.dark().copyWith(
                          colorScheme: ColorScheme.dark(
                            primary: Colors.orange,
                            onPrimary: Colors.black,
                            surface: Colors.white,
                            onSurface: Colors.black,
                          ),
                          dialogBackgroundColor:Colors.orange,
                        ),
                        child: child!,
                      );
                    },
                  ).then((value) {
                    if(value != null)
                    {
                      RaceCubit.get(context).toDateController.text = DateFormat('E, MMMM dd, yyyy').format(value);
                      RaceCubit.get(context).endValue=value;
                    }
                  },
                  );
                },
              ),
            ),
            SizedBox(height: 30.h,),
            CustomElevatedButton(
              backgroundColor: Color(0xffFFB715),
              width: 343.w,height: 42.h,borderRadius: 8.r,
              padding: 10.sp,
              borderColor: Colors.transparent,
              child: CustomText(text: "Done",color: Color(0xff1C325F),
                fontSize: 14.sp,fontWeight: FontWeight.w700,),
              onPressed: (){
                RaceCubit.get(context).getDateFilterResults();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },);
}

void distanceModelBottomSheet(BuildContext context){
  showModalBottomSheet(isScrollControlled: true,
    context: context, builder: (context) {
      return BlocBuilder<RaceCubit,RaceState>(
        builder: (context, state) {
          var cubit = RaceCubit.get(context);
          return Container(
            height: 269.h,
            width: 375.w,
            padding: EdgeInsetsDirectional.only(
                start: 8.w,
                top: 24.h,
                end: 8.w,
                bottom: 24.h
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(width: 80.w,
                  child: Divider(
                    height: 3.h,
                    color: Colors.grey,

                  ),
                ),
                Center(
                  child: CustomText(text: "Race Distance".toUpperCase(),color: Color(0xff000A35),
                    fontWeight: FontWeight.w900,fontSize: 22.sp,),
                ),
                Row(
                  children: [
                    SizedBox(width: 20.w,),
                    CustomText(text: "${cubit.startDist.toInt()} - ${cubit.endDist.toInt()} KM",color: Color(0xff000A35),
                      fontWeight: FontWeight.w400,fontSize: 16.sp,),
                  ],
                ),
                RangeSlider(
                  min: 0,max: 200,divisions: 200,
                  inactiveColor: Colors.grey,
                  activeColor: Colors.orange,
                  onChanged:(value){
                    // print(value.start);
                    // print(value.end);
                    cubit.setStart(value.start);
                    cubit.setEnd(value.end);
                  }, values: RangeValues(
                    cubit.startDist,
                    cubit.endDist),),
                CustomElevatedButton(
                  backgroundColor: Color(0xffFFB715),
                  width: 343.w,height: 42.h,borderRadius: 8.r,
                  padding: 10.sp,
                  borderColor: Colors.transparent,
                  child: CustomText(text: "Done",color: Color(0xff1C325F),
                    fontSize: 14.sp,fontWeight: FontWeight.w700,),
                  onPressed: (){
                    cubit.getDistanceFilterResults();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    },);
}

void filterModelBottomSheet(BuildContext context){
  showModalBottomSheet(isScrollControlled: true,
    context: context, builder: (context) {
      return BlocBuilder<RaceCubit,RaceState>(
        builder: (context, state) {
          var cubit = RaceCubit.get(context);
          return Container(
            height: 222.h, width: 375.w,
            padding: EdgeInsetsDirectional.only(
                start: 8.w, top: 24.h,
                end: 8.w, bottom: 24.h
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 80.w,
                  child: Divider(
                    height: 3.h,
                    color: Colors.grey,

                  ),
                ),
                SizedBox(height: 5.h,),
                CustomText(text: "Clear Filters".toUpperCase(),color: Color(0xff000A35),
                  fontWeight: FontWeight.w900,fontSize: 22.sp,),
                CustomElevatedButton(
                  backgroundColor: Color(0xffFFB715),
                  width: 343.w,height: 42.h,borderRadius: 8.r,
                  padding: 10.sp,
                  borderColor: Colors.transparent,
                  child: CustomText(text: "Yes, Clear Filters",color: Color(0xff1C325F),
                    fontSize: 14.sp,fontWeight: FontWeight.w700,),
                  onPressed: (){
                    cubit.resetAllFilters();
                    Navigator.pop(context);
                  },
                ),
                CustomElevatedButton(
                  backgroundColor: Colors.white,
                  width: 343.w,height: 42.h,borderRadius: 8.r,
                  padding: 10.sp,
                  borderColor: Color(0xff1C325F),
                  child: CustomText(text: "Cancel",color: Color(0xff1C325F),
                    fontSize: 14.sp,fontWeight: FontWeight.w700,),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },

      );
    },);
}