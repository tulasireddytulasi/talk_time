part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

final class FetchContacts extends HomeEvent {
  @override
  List<Object> get props => [];
}