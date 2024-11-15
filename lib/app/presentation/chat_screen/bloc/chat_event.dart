part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

final class FetchMessages extends ChatEvent {

  const FetchMessages({required this.receiverId});
  final String receiverId;

  @override
  List<Object> get props => [receiverId];
}
