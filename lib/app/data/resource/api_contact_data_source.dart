import 'package:talk_time/app/data/resource/i_contact_data_source.dart';
import 'package:talk_time/app/model/user_list_model.dart';

class ApiContactDataSource implements IContactDataSource {
  @override
  Future<List<UserContact>> fetchContacts() async {
    // Fetch contacts from an API
    List<UserContact>  data = [];
    return data;
  }
}
