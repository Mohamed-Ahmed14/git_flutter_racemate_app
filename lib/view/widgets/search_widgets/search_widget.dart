import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../view_model/cubit/race_cubit/cubit.dart';
import '../../../view_model/utils/colors/app_colors.dart';



class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 56.h,
        width: 343.w,
        child: SearchBar(

           backgroundColor: MaterialStatePropertyAll(Colors.white,),
          padding: MaterialStatePropertyAll(
            EdgeInsetsDirectional.only(
              start: 8.w,
              top: 6.h,
              end: 8.w,
              bottom: 6.h,
            ),
          ),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                  borderRadius: RaceCubit.get(context).searchController.text.trim().isEmpty?
                  BorderRadius.all(Radius.circular(8.r)):
                  BorderRadius.only(topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r)),
              ),
          ),
          side: MaterialStateProperty.all(BorderSide(
            color: RaceCubit.get(context).searchController.text.trim().isEmpty?
            Colors.grey:Colors.orange,
            width: 2.w,
          )),

          hintText: "Search Race Name or Country",

          hintStyle: MaterialStateProperty.all(TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400
          )),
          trailing: [
            RaceCubit.get(context).searchController.text.trim().isEmpty?
            Icon(Icons.search_outlined,color:AppColor.header_4,
              size: 30.r,):
            IconButton(
                padding: EdgeInsetsDirectional.only(bottom: 6.h),
                onPressed: (){
              RaceCubit.get(context).resetSearch();
            }, icon:Icon(Icons.cancel_outlined,color: Colors.orange,
            size: 25.r,)),
          ],
          controller: RaceCubit.get(context).searchController,
          onChanged: (value){
            RaceCubit.get(context).search(value);
          },

        ),
      ),
    );
  }
}
