import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/model/setting/index.dart';
import 'package:healthy_app/router/index.dart';

List<SettingBlockItemModel> listRenderSecurity = [
  SettingBlockItemModel(icons: IconConstants.password, label: "Change Password", router: Routes.startScreen),
  SettingBlockItemModel(icons: IconConstants.resetPassword, label: "Forgot Password", router: Routes.startScreen),
  SettingBlockItemModel(icons: IconConstants.security, label: "Security", router: Routes.startScreen),
];
List<SettingBlockItemModel> listRenderGeneral = [
  SettingBlockItemModel(icons: IconConstants.language, label: "Language", router: Routes.startScreen),
  SettingBlockItemModel(icons: IconConstants.trash, label: "Clear Cache", router: Routes.startScreen),
];
List<SettingBlockItemModel> listRenderAbout = [
  SettingBlockItemModel(icons: IconConstants.policies, label: "Legal and Policies", router: Routes.startScreen),
  SettingBlockItemModel(icons: IconConstants.question, label: "Help & Support", router: Routes.startScreen),
  SettingBlockItemModel(icons: IconConstants.mode, label: "Dark Mode", router: Routes.startScreen, toogle: true),
];
