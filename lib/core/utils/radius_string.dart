import 'package:sicherr/core/const/strings.dart';

String radiusToString({required int radiusInt}) {
  for (String distance in AppStrings.distances) {
    int distanceInt = int.parse(distance.split(RegExp('[a-zA-Z]')).first);
    if (distanceInt == radiusInt) {
      return distance;
    }
  }

  return '';
}

// int stringToRadius(String distanceString) {
//   int? radiusInt;
//   final stringWithoutUnits = distanceString.replaceAll(RegExp(r'[^\d]'), '');
//   if (stringWithoutUnits.isNotEmpty) {
//     radiusInt = int.parse(stringWithoutUnits);
//   }
//   return radiusInt ?? 0;
// }
int stringToRadius(String distanceString) {
  final RegExp regExp = RegExp(r'(\d+)\s*(км|м)');
  final match = regExp.firstMatch(distanceString);

  if (match != null) {
    final int value = int.parse(match.group(1)!);
    final String unit = match.group(2)!;

    if (unit == 'км') {
      return value * 1000;
    } else if (unit == 'м') {
      return value;
    }
  }

  return 0;
}
