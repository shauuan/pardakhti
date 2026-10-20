/// تمام متن‌های UI — بدون hardcode پراکنده در ویجت‌ها.
abstract final class AppStrings {
  static const String appName = 'پرداختی';
  static const String sampleBadge = 'نمونه';
  static const String sampleDisclaimer =
      'این صفحه فقط برای تأیید ظاهر است و داده‌ها ساختگی‌اند.';

  // ناوبری
  static const String navDashboard = 'داشبورد';
  static const String navEmployees = 'پرسنل';
  static const String navMonthlyInputs = 'ورودی ماهانه';
  static const String navPayroll = 'محاسبه حقوق';
  static const String navReports = 'گزارش‌ها';
  static const String navSettings = 'تنظیمات';
  static const String navShowcase = 'نمایش کامپوننت‌ها';

  // داشبورد
  static const String dashboardTitle = 'داشبورد';
  static const String activeEmployees = 'پرسنل فعال';
  static const String totalNetPay = 'جمع خالص پرداختی';
  static const String totalInsurance = 'جمع بیمه';
  static const String totalTax = 'جمع مالیات';
  static const String totalEmployerCost = 'هزینه کل شرکت';
  static const String trend12Months = 'روند ۱۲ ماه اخیر';
  static const String currentMonthStatus = 'وضعیت ماه جاری';
  static const String statusDraft = 'پیش‌نویس';
  static const String statusLocked = 'قفل‌شده';
  static const String quickActions = 'میان‌بُرهای سریع';
  static const String actionAddEmployee = 'افزودن پرسنل';
  static const String actionImport = 'ایمپورت کارکرد';
  static const String actionCalculate = 'محاسبه حقوق';
  static const String actionReports = 'خروجی گزارش';

  // عمومی
  static const String search = 'جستجو...';
  static const String searchHint = 'جستجوی سراسری (Ctrl+K)';
  static const String save = 'ذخیره';
  static const String cancel = 'انصراف';
  static const String confirm = 'تأیید';
  static const String delete = 'حذف';
  static const String edit = 'ویرایش';
  static const String add = 'افزودن';
  static const String close = 'بستن';
  static const String loading = 'در حال بارگذاری...';
  static const String emptyTitle = 'موردی یافت نشد';
  static const String emptySubtitle = 'برای شروع، یک مورد جدید اضافه کنید.';
  static const String comingSoon = 'به‌زودی';
  static const String needsReview = 'نیازمند تأیید';
  static const String inclusivityWarning =
      'مشمولیت بیمه و مالیات را با حسابدار یا بخشنامه سال جاری تطبیق دهید.';

  // فرم نمونه
  static const String sampleFormTitle = 'فرم نمونه پرسنل';
  static const String firstName = 'نام';
  static const String lastName = 'نام خانوادگی';
  static const String nationalId = 'کد ملی';
  static const String personnelCode = 'کد پرسنلی';
  static const String baseSalary = 'مزد روزانه';
  static const String department = 'واحد سازمانی';
  static const String hireDate = 'تاریخ استخدام';

  // جدول
  static const String colName = 'نام';
  static const String colCode = 'کد';
  static const String colNet = 'خالص';
  static const String colInsurance = 'بیمه';
  static const String colTax = 'مالیات';
  static const String colDays = 'کارکرد';
  static const String selectedCount = 'انتخاب‌شده';

  // Toast
  static const String savedSuccessfully = 'با موفقیت ذخیره شد';
  static const String errorOccurred = 'خطایی رخ داد';
  static const String calculating = 'در حال محاسبه...';

  // دیالوگ
  static const String confirmDeleteTitle = 'حذف مورد';
  static const String confirmDeleteBody =
      'این عمل قابل بازگشت نیست. آیا مطمئن هستید؟';

  // SideSheet
  static const String details = 'جزئیات';
  static const String showBreakdown = 'نمایش جزئیات محاسبه';

  // تم
  static const String lightTheme = 'تم روشن';
  static const String darkTheme = 'تم تیره';
  static const String toggleTheme = 'تغییر تم';

  // میان‌بر
  static const String keyboardShortcuts = 'میان‌بُرهای کیبورد';
}
