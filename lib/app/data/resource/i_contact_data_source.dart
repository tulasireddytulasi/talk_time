import 'package:talk_time/app/model/contact_model.dart';

abstract class IContactDataSource {
  Future<List<ContactModel>> fetchContacts();
}
