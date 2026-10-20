/// ثابت‌های سطح اپ — برای تغییر نام تجاری فقط اینجا را ویرایش کنید.
abstract final class AppConfig {
  static const String appName = 'پرداختی';
  static const String appNameEn = 'Pardakhti';
  static const String version = '1.2.0';
  static const String orgId = 'com.pardakhti';
  static const String logoAsset = 'assets/logo/pardakhti_logo.png';

  /// حداقل اندازه پنجره (پیکسل)
  static const double minWindowWidth = 1200;
  static const double minWindowHeight = 750;

  /// اندازه پیش‌فرض پنجره
  static const double defaultWindowWidth = 1440;
  static const double defaultWindowHeight = 900;

  /// سال مالی پیش‌فرض (شمسی)
  static const int defaultFiscalYear = 1405;
}
