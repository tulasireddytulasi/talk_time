import 'package:isar/isar.dart';
import 'package:talk_time/app/core/utils/enums.dart';
part 'local_message_model.g.dart';

@Collection()
class LocalMessageModel {
  Id id = Isar.autoIncrement; // Primary key
  late DateTime date;
  late String message;
  late String filePath;
  late String senderId;
  late String receiverId;
  late String widgetTypeName;

  @Enumerated(EnumType.name)
  late MessStatus status  = MessStatus.notSent;
}
