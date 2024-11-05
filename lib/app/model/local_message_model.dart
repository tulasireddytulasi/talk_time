import 'package:isar/isar.dart';
part 'local_message_model.g.dart';

@Collection()
class Message {
  Id id = Isar.autoIncrement; // Primary key
  late DateTime date;
  late String message;
  late String senderId;
  late String receiverId;
  late String widgetTypeName;
}
