import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_app/view/widgets/race_widgets/race_widget.dart';


import '../../../view_model/cubit/race_cubit/cubit.dart';
import '../../../view_model/cubit/race_cubit/state.dart';
import '../../../view_model/utils/colors/app_colors.dart';

class ShowRaces extends StatelessWidget {
  const ShowRaces({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RaceCubit,RaceState>(
      builder: (context, state) {
        var cubit = RaceCubit.get(context);
        return Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return RaceWidget(
                  raceModel: cubit.raceList[index],);
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h,);
              },
              itemCount: cubit.raceList.length,),
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
