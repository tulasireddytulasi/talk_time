import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:talk_time/app/data/resource/i_contact_data_source.dart';
import 'package:talk_time/app/model/user_list_model.dart';

class LocalDbContactDataSource implements IContactDataSource {
  List<Contact>? _contacts;
  List<UserContact> data = [];
  bool _permissionDenied = false;

  @override
  Future<List<UserContact>> fetchContacts() async {
    try {
      // Fetch contacts from local DB (e.g., SQLite or Hive)
      if (!await FlutterContacts.requestPermission(readonly: true)) {
        _permissionDenied = true;
      } else {
        final contacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
        _contacts = contacts;
        _contacts?.forEach(
          (element) {
            final String name = "${element.name.first} ${element.name.last}";
            String no = "";
            if (element.phones.isNotEmpty) {
              no = element.phones.first.number;
            }

            data.add(
              UserContact(
                name: name,
                phoneNo: no,
                profilePic: element.photo,
                dateTime: DateTime.now(),
              ),
            );
          },
        );
      }
      return data;
    } catch (e, m) {
      print("Contacts Error: $e");
      print("Contacts Stack: $m");
      rethrow;
    }
  }
}
