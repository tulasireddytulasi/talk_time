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

      List<String> dataList = [];
      if (!await FlutterContacts.requestPermission(readonly: true)) {
        _permissionDenied = true;
      } else {
        final contacts = await FlutterContacts.getContacts(withProperties: true, withPhoto: true);
        _contacts = contacts;
        print("\nContacts List: ${_contacts?.length}");
        print("\nContacts name: ${_contacts?[2].phones.first}");

        _contacts?.forEach(
                (element) {
                  final String? num = (element.phones).isEmpty ? "No Number" : (element.phones.first.number);
                  dataList.add(num ?? "kk");
                });
        print("\nContacts List: $dataList");
        _contacts?.forEach(
          (element) {

            final String name = "${element.name.first} ${element.name.last}";
           // final String no = element.phones.first.number;

            data.add(
              UserContact(
                name: name,
                //phoneNo: (no == null || no.isEmpty) ? "" : no,
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
