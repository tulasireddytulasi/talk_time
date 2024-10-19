import 'package:talk_time/app/model/contact_model.dart';

abstract class IContactRepository {
  Future<List<ContactModel>> getContacts();
}
