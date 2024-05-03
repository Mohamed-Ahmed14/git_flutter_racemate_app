import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/filter_model.dart';
import '../../view_model/cubit/race_cubit/cubit.dart';
import '../../view_model/cubit/race_cubit/state.dart';

import '../widgets/filter_widgets/show_filter_results.dart';
import '../widgets/filter_widgets/show_filters.dart';
import '../widgets/search_widgets/search_widget.dart';
import '../widgets/search_widgets/show_search_results.dart';

import '../widgets/race_widgets/show_races.dart';

class RacesScreen extends StatelessWidget {
  const RacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: BlocBuilder<RaceCubit, RaceState>(
      builder: (context, state) {
        var cubit = RaceCubit.get(context);
        cubit.scrollListener();
        return Padding(
          padding: EdgeInsets.all(8.0.sp),
          child: SingleChildScrollView(
            controller: cubit.scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SearchWidget(), // Search Bar
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h,),
                        ShowFilters(), //Filters
                        SizedBox(height: 20.h,),
                        //Default Races or Filters results
                        Visibility(
                            visible: filterList[0].isSelected == false,
                            replacement: ShowFilterResults(), //Filter results
                            child: ShowRaces(),  //Default Races
                        ), //Races
                      ],
                    ),
                    ShowSearchResults(), //Search Results
                  ],
                ),
              ],
            ),
          ),
        );
      },
    )));
  }
}
