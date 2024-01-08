class SettingBlockItemModel {
  String icons;
  String label;
  String router;
  bool toogle;
  SettingBlockItemModel({
    this.toogle = false,
    required this.icons,
    required this.label,
    required this.router,
  });
}
