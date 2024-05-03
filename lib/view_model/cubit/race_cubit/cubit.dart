import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:racemate_app/view_model/cubit/race_cubit/state.dart';



import '../../../model/filter_model.dart';
import '../../../model/race_model.dart';

class RaceCubit extends Cubit<RaceState>{

  RaceCubit():super(RaceInitState());

  static RaceCubit get(context)=>BlocProvider.of<RaceCubit>(context);


  List<RaceModel> raceList = [];
  int racesLen = 10;

  void getRaces(){
    raceList.clear();
    emit(GetRacesLoadingState());
    for(int i=0;i<racesLen;i++)
      {
        raceList.add(RaceModel.fromJson(data[i]));
      }
    emit(GetRacesSuccessState());
  }

  void getMoreRaces() async{

    emit(GetMoreRacesLoadingState());
    await Future.delayed(Duration(seconds: 3),);
    for(int i=racesLen;i<racesLen+10 && i<data.length;i++)
    {
      raceList.add(RaceModel.fromJson(data[i]));
    }
    emit(GetMoreRacesSuccessState());
    racesLen+=10;
  }

  ScrollController scrollController = ScrollController();
  void scrollListener(){
    scrollController.addListener(() {
      if(scrollController.position.atEdge &&
          scrollController.position.pixels !=0)
        {
          if(raceList.length<data.length)
            {
              getMoreRaces();
            }
        }
    });
  }

  //Search Side
  List<String> searchCountryList = [];
  List<String> searchNameList = [];
  TextEditingController searchController = TextEditingController();
  void search(String value)
  {
    searchCountryList.clear();
    searchNameList.clear();
    emit(SearchLoadingState());
    if(value.trim().isEmpty)
      {
        return;
      }
    for(var i in raceList)
    {
      if((i.country!).trim().toLowerCase().contains(value.trim().toLowerCase()))
      {
        searchCountryList.removeWhere((element) => element==i.country);
        searchCountryList.add(i.country!);
      }
      if((i.name!).trim().toLowerCase().contains(value.trim().toLowerCase()))
      {
        //searchNameList.removeWhere((element) => element==i.name);
        searchNameList.add(i.name!);
      }
    }
    emit(SearchSuccessState());
  }

  void resetSearch(){
    searchController.clear();
    searchCountryList.clear();
    searchNameList.clear();
    emit(ResetSearchSuccessState());
  }

  //Filters
  //Type Filter
  dynamic groupValue="";
  void changeGroupValue(dynamic value)
  {
    groupValue = value;
    emit(TypeFilterState());
  }

  List<RaceModel> filterListResults = [];

  void getTypeFilterResults(){
    if(groupValue == ""){
      filterList[1].isSelected = false;
      if(!anyFilterApplied()){
        filterList[0].isSelected = false;
        filterListResults.clear();
      }
      emit(GetTypeFilterSuccessState());
      return;
    }
    filterList[1].isSelected = true;
    filterList[0].isSelected=true;

    //No filter applied before that
    if(filterListResults.isEmpty){
      for(var i in raceList)
      {
        if(i.type == groupValue || groupValue=="All")
        {
          filterListResults.removeWhere((element) => element.name == i.name);
          filterListResults.add(i);
        }
      }
    }//Another filter applied before that
    else{
      filterListResults.removeWhere((element) => element.type!=groupValue);
    }

    groupValue="";
    emit(GetTypeFilterSuccessState());
  }

  // void resetTypeFilter(){
  //   filterList[1].isSelected = false;
  //   if(!anyFilterApplied()){
  //     filterList[0].isSelected = false;
  //     filterListResults.clear();
  //   }
  //   groupValue="";
  //   emit(ResetDateFilterSuccessState());
  // }
//Date
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  DateTime startValue = DateTime.now();
  DateTime endValue = DateTime.now();
  void getDateFilterResults(){
    if(DateFormat('yMd').format(startValue) == DateFormat('yMd').format(DateTime.now()) &&
        DateFormat('yMd').format(endValue) == DateFormat('yMd').format(DateTime.now()))
      {
        filterList[4].isSelected = false;
        if(!anyFilterApplied()){
          filterList[0].isSelected = false;
          filterListResults.clear();
        }
        emit(GetDateFilterSuccessState());
        return;
      }
    filterList[4].isSelected = true;
    filterList[0].isSelected=true;

    //No Filter Applied before
    if(filterListResults.isEmpty){
      for(var i in raceList)
      {
        if(int.parse(i.date!) >= int.parse(DateFormat('yyyyMMdd').format(startValue).toString()))
        {
          if(int.parse(i.date!) <= int.parse(DateFormat('yyyyMMdd').format(endValue).toString()))
          {
            filterListResults.add(i);
          }
        }
      }
    }//Another Filter Applied before
    else{
      int sDate = int.parse(DateFormat('yyyyMMdd').format(startValue).toString());
      int eDate = int.parse(DateFormat('yyyyMMdd').format(endValue).toString());
      filterListResults.
      removeWhere((element) => int.parse(element.date!) < sDate ||
          int.parse(element.date!) > eDate);
    }

    startValue = DateTime.now();
    endValue = DateTime.now();
    emit(GetDateFilterSuccessState());
  }



  //location side
  List<Map<String,dynamic>> locationSearch = [];
  void getLocationSearchResults(){
    locationSearch.clear();
    List<String> countriesList = [];
    for(var i in raceList)
      {
        countriesList.removeWhere((element) => element==i.country);
        countriesList.add(i.country!);
      }
    for(var i in countriesList)
      {
        int len = raceList.where((element) => element.country == i).toList().length;
        locationSearch.add({
          "country":i,
              "len":len,
        "value":false});
      }
  }
  
  List<RaceModel> locationList =[];
void addRemoveLocation(int index,bool value)
{
  locationSearch[index]["value"]=value;
  if(value == true)
    {
      for(var i in raceList)
        {
          if(i.country == locationSearch[index]["country"])
            {
              locationList.add(i);
            }
        }
    }else{
    locationList.removeWhere((element) => element.country == locationSearch[index]["country"]);
  }
  emit(AddRemoveLocationState());
}
void getLocationFilterResults(){
  if(locationList.isEmpty)
    {
      filterList[2].isSelected = false;
      if(!anyFilterApplied()){
        filterList[0].isSelected = false;
      }
      //filterListResults.clear();
      emit(GetTypeFilterSuccessState());
      return;
    }
  for(int i=0;i<filterList.length;i++)
    {
      if(i==0 || i==2){
        filterList[i].isSelected=true;
      }else{
        filterList[i].isSelected=false;
      }
    }
  filterListResults.clear();
  filterListResults.addAll(locationList);
  emit(GetTypeFilterSuccessState());
}

  //Distance Filter
double startDist = 0;
double endDist = 200;
 void setStart(value){
  startDist=value;
  emit(SliderState());
 }
  void setEnd(value){
    endDist=value;
    emit(SliderState());
  }

  void getDistanceFilterResults(){
    // filterList[3].isSelected = true;
    // filterList[0].isSelected=true;
  }


  bool anyFilterApplied(){
    for(int i=1;i<filterList.length;i++)
      {
        if(filterList[i].isSelected == true)
          return true;
      }
    return false;
  }
  void resetAllFilters(){

    for(int i=0;i<filterList.length;i++)
    {
      filterList[i].isSelected=false;
    }
    locationList.clear();
    filterListResults.clear();
    getLocationSearchResults();
    startValue=DateTime.now();
    endValue=DateTime.now();
    emit(ResetAllFilterState());
  }

}