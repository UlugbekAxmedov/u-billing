import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'bloc/language_bloc/language_form_bloc.dart';
import 'l10n/l10n.dart';
import 'screens/home_page/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LanguageFormBloc(LanguageFormState.initial()),
      child: BlocBuilder<LanguageFormBloc, LanguageFormState>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            theme: ThemeData(
              fontFamily: 'Ubuntu',
              primarySwatch: Colors.blue,
            ),
            locale: state.selectedLocale,
            home: const HomePage(),
          );
        },
      ),
    );
  }
}

