import 'package:talk_time/app/data/resource/i_contact_data_source.dart';
import 'package:talk_time/app/model/contact_model.dart';

class ApiContactDataSource implements IContactDataSource {
  @override
  Future<List<ContactModel>> fetchContacts() async {
    // Fetch contacts from an API
    List<ContactModel>  data = [];
    return data;
  }
}
