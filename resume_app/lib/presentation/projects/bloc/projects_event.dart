part of 'projects_bloc.dart';

abstract class ProjectsEvent {}

class OnLoadProjects extends ProjectsEvent {
  final String lang;
  
  OnLoadProjects(this.lang);
}
