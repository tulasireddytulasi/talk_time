import 'package:talk_time/app/data/repositories/i_contact_repository.dart';
import 'package:talk_time/app/model/user_list_model.dart';

class GetContactsUseCase {
  final IContactRepository contactRepository;

  GetContactsUseCase({required this.contactRepository});

  Future<List<UserContact>> execute() {
    return contactRepository.getContacts();
  }
}
