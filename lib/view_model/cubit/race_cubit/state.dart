abstract class RaceState{}

class RaceInitState extends RaceState{}

class GetRacesLoadingState extends RaceState{}
class GetRacesSuccessState extends RaceState{}

class GetMoreRacesLoadingState extends RaceState{}
class GetMoreRacesSuccessState extends RaceState{}

class SearchLoadingState extends RaceState{}
class SearchSuccessState extends RaceState{}

class ResetSearchSuccessState extends RaceState{}

// Filters
//Type
class TypeFilterState extends RaceState{}
class GetTypeFilterSuccessState extends RaceState{}
//Date
class GetDateFilterSuccessState extends RaceState{}
//Location
class AddRemoveLocationState extends RaceState{}

class SliderState extends RaceState{}


//Reset All Filter
class ResetAllFilterState extends RaceState{}

