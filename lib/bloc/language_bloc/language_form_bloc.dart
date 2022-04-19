import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:i_billing/l10n/l10n.dart';

part 'language_form_event.dart';

part 'language_form_state.dart';

part 'language_form_bloc.freezed.dart';

class LanguageFormBloc extends Bloc<LanguageFormEvent, LanguageFormState> {
  LanguageFormBloc(LanguageFormState initialState)
      : super(LanguageFormState.initial()) {
    on<LanguageFormEvent>((event, emit) {
      event.map(selectedLocale: (event) {
        emit(state.copyWith(selectedLocale: event.locale));
      });
    });
  }
}
