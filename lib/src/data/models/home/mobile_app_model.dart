class MobileAppModel {
  String? appName;
  String? iosVersion;
  String? androidVersion;
  bool? isForce;

  MobileAppModel(
      {this.appName, this.iosVersion, this.androidVersion, this.isForce});

  MobileAppModel.fromJson(Map<String, dynamic> json) {
    appName = json['app_name'] as String?;
    iosVersion = json['ios_version'] as String?;
    androidVersion = json['android_version'] as String?;
    isForce = json['is_force'] as bool?;
  }

  Map<String, dynamic> toJson() => {
        'app_name': appName,
        'ios_version': iosVersion,
        'android_version': androidVersion,
        'isForce': isForce
      };
}
