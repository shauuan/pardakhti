# پرداختی (Pardakhti)

نرم‌افزار حقوق و دستمزد دسکتاپ (Flutter Windows) — آفلاین، یک‌کاربره، مطابق قانون کار ایران.

## وضعیت

نسخه **۱.۲** — محصول قابل استفاده: ورود، پرسنل، ورودی/ایمپورت، محاسبه، قفل ماه، گزارش PDF/Excel، بکاپ.

## بیلد ویندوز (مثل املاک — روی GitHub Actions)

بدون نصب Visual Studio روی سیستم خودتان:

1. کد را به GitHub پوش کنید (برنچ `main`)
2. از تب **Actions** بیلد `build-windows` را ببینید
3. بعد از اتمام: **Artifacts** یا **Releases** → فایل `Pardakhti-*-Windows.zip`
4. zip را باز کنید و `pardakhti.exe` را اجرا کنید

دستی هم می‌توانید از Actions → Run workflow بزنید (`workflow_dispatch`).

## اجرای محلی (نیاز به VS Build Tools)

```bash
flutter pub get
flutter run -d windows
```

صفحات نمونه:
- `/` داشبورد با داده ساختگی (برچسب «نمونه»)
- `/showcase` نمایش کامپوننت‌ها

## تحلیل

```bash
flutter analyze
```

## مستندات

- [فرض‌ها](docs/ASSUMPTIONS.md)
- [ERD](docs/ERD.md)
- [معماری](docs/ARCHITECTURE.md)
- [پکیج‌ها](docs/PACKAGES.md)
