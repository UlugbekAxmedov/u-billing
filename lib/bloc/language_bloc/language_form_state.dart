part of 'language_form_bloc.dart';

@freezed
class LanguageFormState with _$LanguageFormState {
  const factory LanguageFormState({
    required Locale selectedLocale,
    required List<Locale> supportedLocale,
  }) = _LanguageFormState;

  factory LanguageFormState.initial() => LanguageFormState(
        selectedLocale: L10n.all.first,
        supportedLocale: L10n.all,
      );
}
