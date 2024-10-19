import 'package:talk_time/app/data/repositories/i_contact_repository.dart';
import 'package:talk_time/app/data/resource/i_contact_data_source.dart';
import 'package:talk_time/app/model/contact_model.dart';

class ContactRepository implements IContactRepository {
  final IContactDataSource contactDataSource;

  ContactRepository({required this.contactDataSource});

  @override
  Future<List<ContactModel>> getContacts() async {
    try {
      final contacts = await contactDataSource.fetchContacts();
      return contacts;
    } catch (e) {
      rethrow;
    }
  }
}
