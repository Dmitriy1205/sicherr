import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  late final ContactEntity _initialContact;
  final ContactsRepository contactsRepo;
  late ContactEntity _detailedContact;
  late final bool _showEmrBtn;

  _mapEventToState(
          ContactDetailsEvent event, Emitter<ContactDetailsState> emit) =>
      event.map(
        initial: (e) => _initialEvent(e, emit),
        addTag: (e) => _addTagEvent(e, emit),
        rateContact: (e) => _rateContactEvent(e, emit),
      );

  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ContactDetailsState> emit) async {
    emit(const ContactDetailsState.loadInProgress());
    _initialContact = event.contact;
    await _initializeContact();
    await _initializeEmgBtn();
    emit(ContactDetailsState.loaded(
        detailedContact: _detailedContact, showEmrBtn: _showEmrBtn));
  }

  Future<void> _initializeEmgBtn() async {
    final userContacts = await contactsRepo.getUserContacts(
        currentUserId: FirebaseAuth.instance.currentUser!.uid);
    if (userContacts == null) {
      _showEmrBtn = false;
    } else {
      _showEmrBtn =
          userContacts.any((element) => element.id == _initialContact.id);
    }
  }

  Future<void> _initializeContact() async {
    final contact = await contactsRepo.getSharedContact(_initialContact.id);
    if (contact != null) {
      _detailedContact = contact;
    } else {
      _detailedContact = _initialContact;
    }
  }

  Future<void> _addTagEvent(
      _AddTagEvent event, Emitter<ContactDetailsState> emit) async {
    emit(const ContactDetailsState.loadInProgress());
    final contact = await contactsRepo.addNewContactTag(
        contactId: _initialContact.id, tag: event.text);
    if (contact != null) {
      _detailedContact = _detailedContact.copyWith(tags: contact.tags);
    }
    emit(const ContactDetailsState.successAddedTag());
    emit(ContactDetailsState.loaded(
        detailedContact: _detailedContact, showEmrBtn: _showEmrBtn));
  }

  Future<void> _rateContactEvent(
      _RateContactEvent event, Emitter<ContactDetailsState> emit) async {
    final contact = await contactsRepo.rateContact(
        contactId: _detailedContact.id, rate: event.rating);

    if (contact != null) {
      _detailedContact = _detailedContact.copyWith(
        ratings: contact.ratings,
        rating: contact.rating,
      );
    }
    emit(const ContactDetailsState.loadInProgress());
    emit(ContactDetailsState.loaded(
        detailedContact: _detailedContact, showEmrBtn: _showEmrBtn));
  }
}
