part of 'about_me_bloc.dart';

abstract class AboutMeEvent {}

class LoadAboutEvent extends AboutMeEvent{
  final String lang;

  LoadAboutEvent(this.lang);
}

class ChangeListEvent extends AboutMeEvent{
  final List<String> newList;
  ChangeListEvent(this.newList);
}

class ShowTimerTextEvent extends AboutMeEvent{}
