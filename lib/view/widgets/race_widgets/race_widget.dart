import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';


import '../../../model/race_model.dart';
import '../../../view_model/utils/colors/app_colors.dart';
import '../../../view_model/utils/custom_text.dart';

class RaceWidget extends StatelessWidget {
  final RaceModel raceModel;
  const RaceWidget({required this.raceModel,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      width: 343.w,
      padding: EdgeInsetsDirectional.only(end: 20.sp),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: AppColor.cardColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Image.asset("assets/images/${raceModel.image}",
            height: 184.h,width: 117.w,fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) => Icon(Icons.error),),
          SizedBox(width: 10.w,),
          SizedBox(
            height: 172.h,
            width: 198.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                // Icon(Icons.stars_rounded,size: 15.r,),
                CustomText(text:raceModel.name ?? "".toUpperCase(),
                  color: AppColor.header_1,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis),
                CustomText(text:"Organized by",
                  color: AppColor.header_2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,),
                CustomText(text:raceModel.organizer ?? "",
                  color: AppColor.header_3,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,),
                Row(
                  children: [
                    Icon(Icons.route_outlined,
                      size: 16.r,
                      color: AppColor.header_4,),
                    SizedBox(width: 3.w,),
                    CustomText(text: raceModel.distances ?? "",
                      color: AppColor.header_4,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.date_range_rounded,
                      size: 16.r,
                      color: AppColor.header_4,),
                    SizedBox(width: 3.w,),
                    CustomText(text: raceModel.date?? "",
                      color: AppColor.header_4,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,)
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_pin,
                      size: 16.r,
                      color: AppColor.header_4,),
                    SizedBox(width: 3.w,),
                    Expanded(
                      child: CustomText(text:"${raceModel.city},${raceModel.country}",
                        color: AppColor.header_4,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      maxLines: 1,
                      textOverflow: TextOverflow.clip),
                    ),
                    Icon(Icons.share_outlined,
                      size: 24.r,
                      color: AppColor.share_icon,),
                  ],
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
