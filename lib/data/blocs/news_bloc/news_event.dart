part of 'news_bloc.dart';

@immutable
abstract class NewsEvent {}
// class AppleEvent extends NewsEvent{
//   final String from;
//   final String to;
//   final String sortBy;
//   final String apiKey;
//
//   AppleEvent(this.from, this.to, this.sortBy, this.apiKey);
// }
// //-----------------------------------------------------------------------------
// class TeslaEvent extends NewsEvent{
//   final String sources;
//
//   TeslaEvent(this.sources);
// }
// //------------------------------------------------------------------------------
// class CountryEvent extends NewsEvent{
//   final String country;
//   CountryEvent(this.country);
// }
// //------------------------------------------------------------------------------
// class TechEvent extends NewsEvent{}
//------------------------------------------------------------------------------
class AllLoadedEvent extends NewsEvent{}