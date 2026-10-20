/// اعتبارسنجی کد ملی و شبا ایران.
abstract final class IranValidators {
  static bool nationalId(String raw) {
    final id = raw.trim();
    if (!RegExp(r'^\d{10}$').hasMatch(id)) return false;
    if (RegExp(r'^(\d)\1{9}$').hasMatch(id)) return false;
    var sum = 0;
    for (var i = 0; i < 9; i++) {
      sum += int.parse(id[i]) * (10 - i);
    }
    final r = sum % 11;
    final check = int.parse(id[9]);
    return (r < 2 && check == r) || (r >= 2 && check == 11 - r);
  }

  static bool sheba(String raw) {
    var s = raw.trim().toUpperCase().replaceAll(' ', '');
    if (s.startsWith('IR')) s = s.substring(2);
    if (!RegExp(r'^\d{24}$').hasMatch(s)) return false;
    final rearranged = '${s.substring(4)}1827${s.substring(0, 4)}';
    // mod 97
    var remainder = 0;
    for (var i = 0; i < rearranged.length; i++) {
      remainder = (remainder * 10 + int.parse(rearranged[i])) % 97;
    }
    return remainder == 1;
  }
}
