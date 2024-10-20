import 'package:talk_time/app/model/user_list_model.dart';

abstract class IContactDataSource {
  Future<List<UserContact>> fetchContacts();
}
