part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}


class ContactLoading extends HomeState {
  @override
  List<Object> get props => [];
}

class ContactLoaded extends HomeState {
  final List<UserContact> contacts;
  ContactLoaded(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class ContactError extends HomeState {
  final String message;
  ContactError(this.message);

  @override
  List<Object> get props => [message];
}