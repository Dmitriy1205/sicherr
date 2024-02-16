import 'package:flutter_test/flutter_test.dart';
import 'package:sicherr/core/utils/phone_formatter.dart';

void main() {
  group('PhoneFormatter.formatPhone tests', () {
    test('formatPhone formats phone numbers with country codes correctly', () {
      expect(PhoneFormatter.formatPhone('+1-555-123-4567'), '+15551234567');
      expect(PhoneFormatter.formatPhone('+44 20 1234 5678'), '+442012345678');
      expect(PhoneFormatter.formatPhone('+380 (44) 123-4567'), '+380441234567');
      expect(PhoneFormatter.formatPhone('+81 3 1234 5678'), '+81312345678');
      expect(PhoneFormatter.formatPhone('+33 1 23 45 67 89'), '+33123456789');
    });

    test('formatPhone formats phone numbers without country codes correctly',
        () {
      expect(PhoneFormatter.formatPhone('555-123-4567'), '5551234567');
      expect(PhoneFormatter.formatPhone('20 1234-5678'), '2012345678');
      expect(PhoneFormatter.formatPhone('(67) 123-4567'), '671234567');
      expect(PhoneFormatter.formatPhone('800-555-5555'), '8005555555');
      expect(PhoneFormatter.formatPhone('123-456-7890'), '1234567890');
      expect(PhoneFormatter.formatPhone('(555) 555-5555'), '5555555555');
      expect(PhoneFormatter.formatPhone('987.654.3210'), '9876543210');
    });

    test(
        'formatPhone formats phone numbers with additional characters correctly',
        () {
      expect(PhoneFormatter.formatPhone('+1-(555)-123-4567'), '+15551234567');
      expect(PhoneFormatter.formatPhone('1-800-555-5555'), '18005555555');
      expect(
          PhoneFormatter.formatPhone('+44 (0)20 1234 5678'), '+4402012345678');
      expect(PhoneFormatter.formatPhone('+(380)44-123-45-67'), '+380441234567');
      expect(PhoneFormatter.formatPhone('+49 123 45 67'), '+491234567');
      expect(PhoneFormatter.formatPhone('123 456.7890'), '1234567890');
      expect(PhoneFormatter.formatPhone('555.555.5555 ext. 1234'),
          '55555555551234');
    });

    test('formatPhone handles invalid phone numbers gracefully', () {
      expect(PhoneFormatter.formatPhone('#Not 2a phone number'), '2');
      expect(PhoneFormatter.formatPhone('*123-456-78-90'), '1234567890');
      expect(PhoneFormatter.formatPhone('%555-'), '555');
      expect(PhoneFormatter.formatPhone('abs(555) (555-5555)'), '5555555555');
      expect(PhoneFormatter.formatPhone('abc'), '');
    });
  });
}
