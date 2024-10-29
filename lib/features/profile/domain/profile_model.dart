class ProfileModel {
  final String title;
  final String icon;
  final Function() ? onTap;
  

  ProfileModel({
    required this.title,
    required this.icon,
    this.onTap

  });
}