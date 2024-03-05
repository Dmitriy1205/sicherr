List<Map<String, String>> sortCountries(List<Map<String, String>> countries) {
  countries.sort((a, b) => a['name']!.compareTo(b['name']!));
  final germany = countries
      .removeAt(countries.indexWhere((element) => element['code'] == 'DE'));
  final usa = countries
      .removeAt(countries.indexWhere((element) => element['code'] == 'US'));
  countries.insert(0, usa);
  countries.insert(0, germany);

  return countries;
}
