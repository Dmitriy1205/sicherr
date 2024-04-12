import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/repositories/contacts/contacts_repository.dart';

part 'contact_details_state.dart';
part 'contact_details_event.dart';
part 'contact_details_bloc.freezed.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  ContactDetailsBloc({required this.contactsRepo})
      : super(const ContactDetailsState.initial()) {
    on<ContactDetailsEvent>(_mapEventToState);
  }
  late final ContactEntity initialContact;
  final ContactsRepository contactsRepo;
  late ContactEntity _detailedContact;

  _mapEventToState(
          ContactDetailsEvent event, Emitter<ContactDetailsState> emit) =>
      event.map(
        initial: (e) => _initialEvent(e, emit),
        addTag: (e) => _addTagEvent(e, emit),
      );

  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ContactDetailsState> emit) async {
    initialContact = event.contact;
    emit(const ContactDetailsState.loadInProgress());
    await updateDetailedContact();
    emit(ContactDetailsState.loaded(detailedContact: _detailedContact));
  }

  Future<void> updateDetailedContact() async {
    final sharedContact =
        await contactsRepo.getSharedContact(initialContact.id);
    if (sharedContact != null) {
      _detailedContact = ContactEntity.combineContactsInfo(
          simpleContact: initialContact, detailedContact: sharedContact);
    } else {
      _detailedContact = initialContact;
    }
  }

  Future<void> _addTagEvent(
      _AddTagEvent event, Emitter<ContactDetailsState> emit) async {
    emit(const ContactDetailsState.loadInProgress());
    final contact = await contactsRepo.addNewContactTag(
        contactId: initialContact.id, tag: event.text);
    if (contact != null) {
      _detailedContact = ContactEntity.combineContactsInfo(
          simpleContact: initialContact, detailedContact: contact);
    }
    emit(const ContactDetailsState.successAddedTag());
    emit(ContactDetailsState.loaded(detailedContact: _detailedContact));
  }
}
