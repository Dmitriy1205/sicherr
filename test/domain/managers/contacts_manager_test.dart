import 'package:flutter_test/flutter_test.dart';
import 'package:sicherr/domain/entities/contact_entity/contact_entity.dart';
import 'package:sicherr/core/managers/contacts_manager.dart';

void main() {
  group('categorizeContacts tests', () {
    test('categorizeContacts returns empty map for empty contacts list', () {
      final contactsTest = <ContactEntity>[];
      final result = ContactsManager.categorizeContacts(contactsTest);
      expect(result.isEmpty, true);
    });

    test('categorizeContacts categorizes contacts correctly', () {
      final contactsTest = [
        ContactEntity(id: '1', name: 'John', phones: ['123456']),
        ContactEntity(id: '2', name: '123', phones: ['456789']),
        ContactEntity(id: '3', name: 'Bob', phones: ['789012']),
        ContactEntity(id: '4', name: 'Alice', phones: ['012345']),
        ContactEntity(id: '5', name: 'Michael', phones: ['234567']),
        ContactEntity(id: '6', name: 'Peter', phones: ['345678']),
        ContactEntity(id: '7', name: 'Іван', phones: ['456789']),
        ContactEntity(id: '8', name: 'Анна', phones: ['567890']),
        ContactEntity(id: '9', name: 'Петро', phones: ['678901']),
        ContactEntity(id: '10', name: '', phones: []),
      ];
      final result = ContactsManager.categorizeContacts(contactsTest);

      expect(result.keys,
          containsAll(['A', 'B', 'J', 'M', 'P', 'І', 'А', 'П', '#']));
      expect(result['A']!.map((e) => e.name), containsAll(['Alice']));
      expect(result['B']!.map((e) => e.name), containsAll(['Bob']));
      expect(result['J']!.map((e) => e.name), containsAll(['John']));
      expect(result['M']!.map((e) => e.name), containsAll(['Michael']));
      expect(result['P']!.map((e) => e.name), containsAll(['Peter']));
      expect(result['І']!.map((e) => e.name), containsAll(['Іван']));
      expect(result['А']!.map((e) => e.name), containsAll(['Анна']));
      expect(result['П']!.map((e) => e.name), containsAll(['Петро']));
      expect(result['#']!.map((e) => e.name), containsAll(['', '123']));
    });

    test('categorizeContacts handles contacts with no names', () {
      final contactsTest = [
        ContactEntity(id: '1', name: '', phones: ['123']),
        ContactEntity(id: '2', name: '123', phones: ['456']),
        ContactEntity(id: '3', name: '', phones: ['789']),
        ContactEntity(id: '4', name: '456', phones: ['012']),
        ContactEntity(id: '5', name: '@', phones: ['015']),
        ContactEntity(id: '6', name: '\$', phones: ['012123']),
        ContactEntity(id: '7', name: '', phones: []),
      ];
      final result = ContactsManager.categorizeContacts(contactsTest);
      expect(result.keys, contains('#'));
      expect(result['#']!.length, equals(7));
    });

    test('categorizeContacts categorizes contacts with Arabic names correctly',
        () {
      final contacts = [
        ContactEntity(id: '1', name: 'علي', phones: ['123456']),
        ContactEntity(id: '2', name: 'محمد', phones: ['456789']),
        ContactEntity(id: '3', name: 'فاطمة', phones: ['789012']),
        ContactEntity(id: '4', name: 'نور', phones: ['012345']),
      ];
      final result = ContactsManager.categorizeContacts(contacts);

      expect(result.keys, containsAll(['ع', 'م', 'ف', 'ن',]));
      expect(result['ع']!.map((e) => e.name), containsAll(['علي']));
      expect(result['م']!.map((e) => e.name), containsAll(['محمد']));
      expect(result['ف']!.map((e) => e.name), containsAll(['فاطمة']));
      expect(result['ن']!.map((e) => e.name), containsAll(['نور']));
    });
  });
}
