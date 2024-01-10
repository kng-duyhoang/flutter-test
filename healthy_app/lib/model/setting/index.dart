class SettingBlockItemModel {
  String iconLight;
  String iconDark;
  String label;
  String router;
  bool toogle;
  SettingBlockItemModel({
    this.toogle = false,
    required this.iconLight,
    required this.iconDark,
    required this.label,
    required this.router,
  });
}
