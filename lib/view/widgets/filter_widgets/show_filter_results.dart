import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../view_model/cubit/race_cubit/cubit.dart';
import '../../../view_model/cubit/race_cubit/state.dart';
import '../../../view_model/utils/colors/app_colors.dart';
import '../../../view_model/utils/custom_text.dart';
import '../race_widgets/race_widget.dart';


class ShowFilterResults extends StatelessWidget {
  const ShowFilterResults({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RaceCubit,RaceState>(
      builder: (context, state) {
        var cubit = RaceCubit.get(context);
        return Column(
          children: [
            Visibility(
              visible: cubit.filterListResults.isNotEmpty,
              replacement: Center(child: CustomText(
                text: "No Races Found",color: Colors.grey,
                fontWeight: FontWeight.w700,fontSize: 20.sp,
              ),),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return RaceWidget(
                    raceModel: cubit.filterListResults[index],);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h,);
                },
                itemCount: cubit.filterListResults.length,),
            ),
            if(state is GetMoreRacesLoadingState)
              const Center(child: CircularProgressIndicator(
                color: AppColor.share_icon,
              ),),


          ],
        );
      },
    );
  }
}
