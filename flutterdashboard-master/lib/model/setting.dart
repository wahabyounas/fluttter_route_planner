// ignore_for_file: empty_constructor_bodies, unnecessary_this, non_constant_identifier_names

// ignore: unused_import
import 'dart:convert';

class SettingsManager {
  String? authBasic = 'VXNlck1hbmFnbWVudDpzZWNyZXQ=';
  String? application_CODE = 'ORICManagement';
  int application_ID = 63;

  String? GetAuthBasic() {
    return authBasic;
  }

  String? GetapplicationCODE() {
    return application_CODE;
  }

  int GetApplicationID() {
    return application_ID;
  }
}
