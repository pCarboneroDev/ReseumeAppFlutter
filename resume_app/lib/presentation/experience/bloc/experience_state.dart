part of 'experience_bloc.dart';

sealed class ExperienceState extends Equatable {
  const ExperienceState();
  
  @override
  List<Object> get props => [];
}

final class ExperienceInitial extends ExperienceState {}
