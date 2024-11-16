part of 'chat_bloc.dart';

@immutable
sealed class ChatEvent extends Equatable {
  const ChatEvent();
}

final class FetchOrSendMessages extends ChatEvent {

  const FetchOrSendMessages({required this.receiverId, this.message = "",  this.isSend = false});
  final String receiverId;
  final String message;
  final bool isSend;

  @override
  List<Object> get props => [receiverId, message, isSend];
}
