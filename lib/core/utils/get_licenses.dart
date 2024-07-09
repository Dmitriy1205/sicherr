import 'package:sicherr/oss_licenses.dart';

class AppLicense {
  final String packageName;
  final String license;

  const AppLicense({
    required this.packageName,
    required this.license,
  });
}

List<AppLicense> getAppLicenses() {
  return ossLicenses
      .where((e) => e.isDirectDependency)
      .map((e) => AppLicense(packageName: e.name, license: e.license ?? ""))
      .toList();
}
