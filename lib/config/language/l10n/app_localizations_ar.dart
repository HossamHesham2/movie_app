// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get password => 'كلمة المرور';

  @override
  String get forget_password => 'هل نسيت كلمة المرور؟';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get dont_have_account => 'ليس لديك حساب؟';

  @override
  String get create_one => 'إنشاء حساب';

  @override
  String get or => 'أو';

  @override
  String get login_with_google => 'تسجيل الدخول باستخدام جوجل';

  @override
  String get register => 'إنشاء حساب';

  @override
  String get avatar => 'الصورة الشخصية';

  @override
  String get name => 'الاسم';

  @override
  String get confirm_password => 'تأكيد كلمة المرور';

  @override
  String get phone_number => 'رقم الهاتف';

  @override
  String get create_account => 'إنشاء حساب';

  @override
  String get already_have_account => 'لديك حساب بالفعل؟';

  @override
  String get verify_email => 'تأكيد البريد الإلكتروني';

  @override
  String get email_required => 'البريد الإلكتروني مطلوب';

  @override
  String get email_invalid => 'أدخل بريدًا إلكترونيًا صالحًا';

  @override
  String get password_required => 'كلمة المرور مطلوبة';

  @override
  String get password_min_length =>
      'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل';

  @override
  String get name_required => 'الاسم مطلوب';

  @override
  String get phone_required => 'رقم الهاتف مطلوب';

  @override
  String get phone_invalid => 'يجب أن يحتوي رقم الهاتف على 11 رقمًا';

  @override
  String get confirm_password_required => 'تأكيد كلمة المرور مطلوب';

  @override
  String get passwords_not_match => 'كلمتا المرور غير متطابقتين';
}
