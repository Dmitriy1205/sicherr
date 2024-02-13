import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/domain/managers/contacts_manager.dart';

part 'contacts_state.dart';
part 'contacts_event.dart';
part 'contacts_bloc.freezed.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc(this.contactsManager)
      : super(const ContactsState.loadInProgress()) {
    on<ContactsEvent>(_mapEventToState);
    add(const ContactsEvent.initial());
  }

  List<ContactEntity> _contactsList = [];

  final ContactsInterface contactsManager;

  Future<void> _mapEventToState(
          ContactsEvent event, Emitter<ContactsState> emit) =>
      event.map(
        initial: (e) => _initialEvent(e, emit),
      );

  Future<void> _initialEvent(
      _InitialEvent event, Emitter<ContactsState> emit) async {
    _contactsList = await contactsManager.getContacts();
    emit(ContactsState.loaded(
      categorizedContacts: ContactsManager.categorizeContacts(_contactsList),
    ));
  }
}
