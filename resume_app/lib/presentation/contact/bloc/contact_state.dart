part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final UIState uiState;
  final List<ContactModel> contactList;

  const ContactState({
    required this.uiState,
    required this.contactList
  });

  ContactState copyWith({
    UIState? uiState,
    List<ContactModel>? contactList
  }) => ContactState(
    uiState: uiState ?? this.uiState, 
    contactList: contactList ?? this.contactList
  );
  
  @override
  List<Object> get props => [uiState, contactList];
}

