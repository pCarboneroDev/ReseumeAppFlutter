import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:resume_app/domain/entities/contact_model.dart';
import 'package:resume_app/domain/usecases/contact/get_all_contact_usecase.dart';
import 'package:resume_app/utils/ui_state.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {

  final GetAllContactUsecase getAllContactUsecase;

  ContactBloc(
    this.getAllContactUsecase
  ) : super(ContactState(uiState: UIState.idle(), contactList: [])) {
    on<ContactEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadContactEvent>((event, emit) async {
      emit(state.copyWith(uiState: UIState.loading()));

      var result = await getAllContactUsecase.call(event.lang);

      result.fold(
        (fail) => emit(state.copyWith(uiState: UIState.error(fail.message))),
        (contacts) => emit(state.copyWith(uiState: UIState.success(), contactList: contacts))
      );
    });
  }
}
