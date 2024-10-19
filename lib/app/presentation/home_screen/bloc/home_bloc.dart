import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:talk_time/app/domain/get_contacts_use_case.dart';
import 'package:talk_time/app/model/contact_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetContactsUseCase getContactsUseCase;

  HomeBloc({required this.getContactsUseCase}) : super(HomeInitial()) {
    on<FetchContacts>(_onFetchContacts);
  }


  FutureOr<void> _onFetchContacts(FetchContacts event, Emitter<HomeState> emit) async {
    emit(ContactLoading());
    try {
      final contacts = await getContactsUseCase.execute();
      emit(ContactLoaded(contacts));
    } catch (e) {
      emit(ContactError("Failed to fetch contacts"));
    }
  }
}
