import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';

part 'pick_dc_state.dart';

part 'pick_dc_cubit.freezed.dart';

class PickDcCubit extends Cubit<PickDcState> {
  PickDcCubit() : super(const PickDcState.initial());

  Future<void> pickAsDanger({
    required ContactEntity pickedContact,
    required List<ContactEntity> pickedAsDangerContacts,
  }) async {
    List<ContactEntity> contacts = List.of(pickedAsDangerContacts);
    if (pickedAsDangerContacts.isEmpty ||
        !pickedAsDangerContacts.contains(pickedContact)) {
      contacts.add(pickedContact);
    } else if (pickedAsDangerContacts.contains(pickedContact)) {
      contacts.remove(pickedContact);
    }
    emit(PickDcState.picked(
        contacts: contacts,
        searchedContactsCategorized: state.searchedContactsCategorized,
        allContactsCategorized: state.allContactsCategorized));
  }

  Future<void> init() async {
    final contacts = await ContactsManager().getLocalContacts();
    final categorizedContacts = ContactsManager.categorizeContacts(contacts);
    emit(PickDcState.picked(
        contacts: [],
        searchedContactsCategorized: categorizedContacts,
        allContactsCategorized: categorizedContacts));
  }

  Future<void> search(String text) async {
    final contacts = await ContactsManager().getLocalContacts();
    final foundContacts = ContactsManager.searchContacts(text, contacts);
    emit(PickDcState.picked(contacts: state.contacts,
        allContactsCategorized: state.allContactsCategorized,
        searchedContactsCategorized: ContactsManager.categorizeContacts(foundContacts)));
  }

  Future<void> reset() async {
    emit(const PickDcState.initial());
  }
}
