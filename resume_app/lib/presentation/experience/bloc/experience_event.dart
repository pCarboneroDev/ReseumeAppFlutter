part of 'experience_bloc.dart';

abstract class ExperienceEvent {}

class GetAllExperienceEvent extends ExperienceEvent {
  final String lang;
  GetAllExperienceEvent(this.lang);
}
