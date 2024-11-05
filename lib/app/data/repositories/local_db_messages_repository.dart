import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talk_time/app/model/local_message_model.dart';

class LocalDbMessagesRepositoryDataBase {
  static late Isar isar;

  // Initialize DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MessageSchema],
      directory: dir.path,
    );
  }

  // Read DB
  List<Message> localMessages = [];

  // Send Messages
  Future<void> sendMessage({required String message}) async {
    final messageModel = Message()
      ..date = DateTime.now()
      ..message = message
      ..senderId = "548595"
      ..receiverId = "746356794"
      ..widgetTypeName = "text";

    await isar.writeTxn(() async {
      await isar.messages.put(messageModel); // insert & update
    });
    await fetchMessage();
  }

  // Fetch all Messages
  Future<void> fetchMessage() async {
    final messages = await isar.messages.where().findAll();
    localMessages.clear();
    localMessages.addAll(messages);
  }

  // Update Message
  Future<void> updateMessage({required int id, required String message}) async {
    final currentMessage = await isar.messages.get(id);
    if(currentMessage != null){
      currentMessage.message = message;
      await isar.writeTxn(() async => await isar.messages.put(currentMessage));
      await fetchMessage();
    }
  }

  // Delete Message
  Future<void> deleteMessage({required int id}) async {
    await isar.writeTxn(() async => await isar.messages.delete(id));
    await fetchMessage();
  }
}
