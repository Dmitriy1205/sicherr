class ProfileSectionModel {
  final String category;
  final List<ProfileSectionItem> items;

  ProfileSectionModel({required this.category, required this.items});
}

class ProfileSectionItem {
  final String text;
  final void Function()? action;

  ProfileSectionItem({required this.text, this.action});
}