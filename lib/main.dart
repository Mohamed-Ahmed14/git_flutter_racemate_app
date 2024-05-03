

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:racemate_app/view/screens/races_screen.dart';
import 'package:racemate_app/view_model/cubit/race_cubit/cubit.dart';


void main(){

  runApp(ScreenUtilInit(
    designSize: const Size(375, 812),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (_ , child){
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RaceCubit()..getRaces()..getLocationSearchResults(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        ),
      );
    },
    child: RacesScreen(),
  ));

}