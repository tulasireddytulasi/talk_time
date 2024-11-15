part of 'chat_bloc.dart';

@immutable
sealed class ChatState extends Equatable {
  const ChatState();
}

final class ChatInitial extends ChatState {
  @override
  List<Object?> get props => [];
}

final class LoadMessages extends ChatState {
  const LoadMessages({
    required this.messages,
    required this.time,
  });
  final List<Message> messages;
  final DateTime time;

  @override
  List<Object> get props => [messages, time.toIso8601String()];
}

final class ChatError extends ChatState {
  const ChatError({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}