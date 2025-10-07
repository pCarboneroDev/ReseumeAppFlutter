part of 'contact_bloc.dart';

abstract class ContactEvent {}

class LoadContactEvent extends ContactEvent {
  final String lang;

  LoadContactEvent(this.lang);
}
