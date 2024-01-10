import 'package:healthy_app/constant/images.dart';
import 'package:healthy_app/model/setting/index.dart';
import 'package:healthy_app/router/index.dart';

List<SettingBlockItemModel> listRenderSecurity = [
  SettingBlockItemModel(iconLight: IconConstantsLight.password, iconDark: IconConstantsDark.password, label: "Change Password", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.resetPassword, iconDark: IconConstantsDark.resetPassword, label: "Forgot Password", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.security, iconDark: IconConstantsDark.security, label: "Security", router: Routes.startScreen),
];
List<SettingBlockItemModel> listRenderGeneral = [
  SettingBlockItemModel(iconLight: IconConstantsLight.language, iconDark: IconConstantsDark.language, label: "Language", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.trash, iconDark: IconConstantsDark.trash, label: "Clear Cache", router: Routes.startScreen),
];
List<SettingBlockItemModel> listRenderAbout = [
  SettingBlockItemModel(iconLight: IconConstantsLight.policies, iconDark: IconConstantsDark.policies, label: "Legal and Policies", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.question, iconDark: IconConstantsDark.question, label: "Help & Support", router: Routes.startScreen),
  SettingBlockItemModel(iconLight: IconConstantsLight.mode, iconDark: IconConstantsDark.mode, label: "Dark Mode", router: Routes.startScreen, toogle: true),
];
