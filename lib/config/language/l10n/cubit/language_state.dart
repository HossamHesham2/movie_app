part of 'language_cubit.dart';

@immutable
class LanguageState extends Equatable {
  final Locale locale;

  LanguageState(this.locale);

  @override
  List<Object?> get props => [locale];
}
