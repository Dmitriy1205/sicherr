import 'package:shared_preferences/shared_preferences.dart';

class LatestContactPrefs {
  final String lastCreatedAtKey = 'lastCreatedAt';

  Future<DateTime?> getLastCreatedAt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? timestamp = prefs.getInt(lastCreatedAtKey);
    return timestamp != null
        ? DateTime.fromMillisecondsSinceEpoch(timestamp)
        : null;
  }

  Future<void> setLastCreatedAt(DateTime createdAt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(lastCreatedAtKey, createdAt.millisecondsSinceEpoch);
  }
}
