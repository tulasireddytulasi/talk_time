import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:talk_time/app/data/repositories/local_db_messages_repository.dart';
import 'package:talk_time/app/model/local_message_model.dart';
import 'package:talk_time/app/model/messages_model.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<FetchMessages>(_fetchMessages);
  }

  FutureOr<void> _fetchMessages(FetchMessages event, Emitter<ChatState> emit) async {
    try {
      await LocalDbMessagesRepositoryDataBase().fetchMessage(
        senderId: LocalDbMessagesRepositoryDataBase.senderId,
        receiverId: event.receiverId,
      );

      final List<LocalMessageModel> localMessages = LocalDbMessagesRepositoryDataBase.localMessages;
      List<Message> messages = [];
      for (var element in localMessages) {
        messages.add(Message(
          receiverId: element.receiverId,
          senderId: element.senderId,
          date: element.date,
          filePath: element.filePath,
          messageText: element.message,
          widgetType: element.widgetTypeName,
        ));
      }

      if (messages.isEmpty) {
        emit(NoMessages());
        return;
      }

      emit(LoadMessages(messages: [...messages], time: DateTime.now()));
    } catch (e, s) {
      emit(ChatError(errorMessage: e.toString()));
    }
  }
}
