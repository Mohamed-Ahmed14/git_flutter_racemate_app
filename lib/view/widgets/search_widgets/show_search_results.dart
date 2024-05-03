import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../view_model/cubit/race_cubit/cubit.dart';
import '../../../view_model/utils/custom_text.dart';

class ShowSearchResults extends StatelessWidget {
  const ShowSearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: RaceCubit.get(context).searchController.text.trim().isNotEmpty,
      child: Center(
        child: Container(
            width: 343.w,
            padding: EdgeInsetsDirectional.only(
              start: 8.w,
              top: 16.h,
              end: 8.w,
              bottom: 16.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.r),
                  bottomRight: Radius.circular(8.r)),

              border: Border.all(
                  color: Colors.orange,
                  width: 2.w,
              ),
            ),
            child: Visibility(
              visible: RaceCubit.get(context).searchNameList.isNotEmpty ||
                  RaceCubit.get(context).searchCountryList.isNotEmpty,
              replacement:Center(child:Padding(
                padding: EdgeInsetsDirectional.all(12.sp),
                child: CustomText(text: "No results found",
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,),
              ),),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                      visible: RaceCubit.get(context).searchCountryList.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Countries",
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,),
                          SizedBox(height: 8.h,),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CustomText(text: RaceCubit.get(context).searchCountryList[index],
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 5.h,);
                            },
                            itemCount: RaceCubit.get(context).searchCountryList.length,),
                          SizedBox(height: 20.h,),
                        ],
                      )),
                  Visibility(visible: RaceCubit.get(context).searchNameList.isNotEmpty,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "Races",
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,),
                          SizedBox(height: 8.h,),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CustomText(text: RaceCubit.get(context).searchNameList[index],
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,);
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 5.h,);
                            },
                            itemCount: RaceCubit.get(context).searchNameList.length,),
                        ],
                      )),

                ],
              ),
            )
        ),
      ),
    );
  }
}
