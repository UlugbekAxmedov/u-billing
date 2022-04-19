import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/constants/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/language_bloc/language_form_bloc.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final Locale _localeEn = const Locale('en');
  final Locale _localeUz = const Locale('uz');
  final Locale _localeRu = const Locale('ru');
  String? _imageUrl;
  String? _imageUrlResult;
  String? _choosenLanguage;

  @override
  Widget build(BuildContext context) {

    final _locale = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(_locale!.profile),
        backgroundColor: const Color(0xFF141416),
        leading: constants.appBarLeading,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(16, 20, 16, 12),
            padding: const EdgeInsets.only(bottom: 20, left: 20, top: 20),
            decoration: BoxDecoration(
              color: constants.dark,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundColor: constants.lightGreen,
                      child: Icon(
                        Icons.person_rounded,
                        size: 40,
                        color: constants.dark,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Otabek Abdusamatov',
                          style: TextStyle(
                              color: constants.lightGreen,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Grafic designer * IQ Education',
                          style: TextStyle(
                              color: Color(0xFFE7E7E7),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                const AboutUser(
                  title: 'Date of birth',
                  info: '16.09.2021',
                ),
                const SizedBox(
                  height: 12,
                ),
                const AboutUser(
                  title: 'Phone number',
                  info: '+998 97 721 06 08',
                ),
                const SizedBox(
                  height: 12,
                ),
                const AboutUser(
                  title: 'E-mail',
                  info: 'predatorhunter041@gmail.com',
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2D),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _choosenLanguage ?? '',
                    style: const TextStyle(
                      color: Color(0xFFE7E7E7),
                    ),
                  ),
                ),
                GestureDetector(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Image.asset(
                          _imageUrlResult ?? 'assets/images/uzb_flag.png'),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                        builder: (BuildContext context) {
                          return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                            child: AlertDialog(
                              backgroundColor: const Color(0xFF2A2A2D),
                              title: const Center(
                                child: Text(
                                  'Choose a language',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                              content: StatefulBuilder(
                                builder: (BuildContext context,
                                    void Function(void Function()) setState) {
                                  return BlocBuilder<LanguageFormBloc, LanguageFormState>(
                                    builder: (BuildContext context, state) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          RadioListTile(
                                              title: Row(
                                                children: [
                                                  CircleAvatar(
                                                    child: Image.asset(
                                                        'assets/images/uzb_flag.png'),
                                                    radius: 12,
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  const Text(
                                                    'O\'zbek (Lotin)',
                                                    style: TextStyle(
                                                      color: Color(0xFFE7E7E7),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              activeColor: constants.darkGreen,
                                              value: _localeUz,
                                              groupValue: state.selectedLocale,
                                              controlAffinity:
                                              ListTileControlAffinity.trailing,
                                              onChanged: (Locale? value) {
                                                context.read<LanguageFormBloc>().add(LanguageFormEvent.selectedLocale(value!));
                                                setState(() {
                                                  if (_imageUrl !=
                                                      'assets/images/uzb_flag.png' ||
                                                      _imageUrl == null) {
                                                    _imageUrl =
                                                    'assets/images/uzb_flag.png';
                                                  }
                                                  _choosenLanguage =
                                                  'O\'zbek (Lotin)';
                                                });
                                              }),
                                          RadioListTile(
                                              title: Row(
                                                children: [
                                                  CircleAvatar(
                                                    child: Image.asset(
                                                        'assets/images/russia_flag.png'),
                                                    radius: 12,
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  const Text(
                                                    'Русский',
                                                    style: TextStyle(
                                                      color: Color(0xFFE7E7E7),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              activeColor: constants.darkGreen,
                                              value: _localeRu,
                                              groupValue: state.selectedLocale,
                                              controlAffinity:
                                              ListTileControlAffinity.trailing,
                                              onChanged: (Locale? value) {
                                                context.read<LanguageFormBloc>().add(LanguageFormEvent.selectedLocale(value!));
                                                setState(() {
                                                  if (_imageUrl !=
                                                      'assets/images/russia_flag.png' ||
                                                      _imageUrl == null) {
                                                    _imageUrl =
                                                    'assets/images/russia_flag.png';
                                                  }
                                                  _choosenLanguage = 'Русский';
                                                });
                                              }),
                                          RadioListTile(
                                              title: Row(
                                                children: [
                                                  CircleAvatar(
                                                    child: Image.asset(
                                                        'assets/images/usa_flag.png'),
                                                    radius: 12,
                                                  ),
                                                  const SizedBox(
                                                    width: 12,
                                                  ),
                                                  const Text(
                                                    'English (USA)',
                                                    style: TextStyle(
                                                      color: Color(0xFFE7E7E7),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              activeColor: constants.darkGreen,
                                              value: _localeEn,
                                              groupValue: state.selectedLocale,
                                              controlAffinity:
                                              ListTileControlAffinity.trailing,
                                              onChanged: (Locale? value) {
                                                context.read<LanguageFormBloc>().add(LanguageFormEvent.selectedLocale(value!));
                                                setState(() {
                                                  if (_imageUrl !=
                                                      'assets/images/usa_flag.png' ||
                                                      _imageUrl == null) {
                                                    _imageUrl =
                                                    'assets/images/usa_flag.png';
                                                  }
                                                  _choosenLanguage =
                                                  'English (USA)';
                                                });
                                              }),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              actionsPadding: const EdgeInsets.all(20),
                              actionsAlignment: MainAxisAlignment.spaceBetween,
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(0, 143, 127, 1),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                    ),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 38),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(0, 143, 127, 0.3),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6))),
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 44),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                        constants.darkGreen),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _imageUrlResult = _imageUrl;
                                    });
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text(
                                    'Done',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        context: context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AboutUser extends StatelessWidget {
  const AboutUser({Key? key, required this.title, required this.info})
      : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title:  ',
          style: const TextStyle(
              color: Color(0xFFE7E7E7),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        Text(
          info,
          style: const TextStyle(
              color: Color(0xFF999999),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
