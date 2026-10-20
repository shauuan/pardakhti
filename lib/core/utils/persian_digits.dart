/// تبدیل ارقام لاتین ↔ فارسی.
abstract final class PersianDigits {
  static const _fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  static const _en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  static String toPersian(String input) {
    var result = input;
    for (var i = 0; i < 10; i++) {
      result = result.replaceAll(_en[i], _fa[i]);
    }
    return result;
  }

  static String toEnglish(String input) {
    var result = input;
    for (var i = 0; i < 10; i++) {
      result = result.replaceAll(_fa[i], _en[i]);
    }
    return result;
  }
}
