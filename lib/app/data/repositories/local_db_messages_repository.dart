import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:talk_time/app/core/utils/enums.dart';
import 'package:talk_time/app/model/local_message_model.dart';

/// Reference: https://isar.dev/crud.html#modifying-the-database

class LocalDbMessagesRepositoryDataBase {

  LocalDbMessagesRepositoryDataBase._();

  static final LocalDbMessagesRepositoryDataBase _localDbMessagesRepositoryDataBase = LocalDbMessagesRepositoryDataBase._();

  factory LocalDbMessagesRepositoryDataBase() {
    return _localDbMessagesRepositoryDataBase;
  }

  static late Isar isar;

  // Initialize DB
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [LocalMessageModelSchema],
      directory: dir.path,
    );
  }

  // Read DB
  static List<LocalMessageModel> localAllMessages = [];

  static List<LocalMessageModel> localMessages = [];

  static String senderId = "8374998490";
  static String receiverId = "";

  // Send Messages
  Future<void> sendMessage({required String message, required String receiverId}) async {
    final messageModel = LocalMessageModel()
      ..date = DateTime.now()
      ..message = message
      ..senderId = senderId
      ..receiverId = receiverId
      ..filePath = "doc/img/img.jpg"
      // ..status = MessStatus.seen
      ..widgetTypeName = "text";

    // putByIndex
    await isar.writeTxn(() async {
      await isar.localMessageModels.put(messageModel); // insert & update
    });
    await fetchMessage(senderId: messageModel.senderId, receiverId: messageModel.receiverId);
  }

  // Fetch all Messages
  Future<void> fetchAllMessage() async {
    final messages = await isar.localMessageModels.where().findAll();
    print("Mess: ${messages.length}");
    localAllMessages.clear();
    localAllMessages.addAll(messages);
  }

  // Fetch particular contact Messages
  Future<void> fetchMessage({required String senderId, required String receiverId}) async {
    final messages = await isar.localMessageModels.filter()
        // .senderIdEqualTo(senderId)
        // .or()
        .receiverIdEqualTo(receiverId)
        .findAll();
    print("Mess: ${messages.length}");
    localMessages.clear();
    localMessages.addAll(messages);
  }

  // Update Message
  Future<void> updateMessage({required int id, required String message}) async {
    final currentMessage = await isar.localMessageModels.get(id);
    if (currentMessage != null) {
      currentMessage.message = message;
      await isar.writeTxn(() async => await isar.localMessageModels.put(currentMessage));
      await fetchMessage(senderId: currentMessage.senderId, receiverId: currentMessage.receiverId);
    }
  }

  // Delete Message
  Future<void> deleteMessage({required int id}) async {
    await isar.writeTxn(() async => await isar.localMessageModels.delete(id));
    // Todo: Need to fix
    // await fetchMessage();
  }
}
