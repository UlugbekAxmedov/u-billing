import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/bloc/contract_bloc/contracts_bloc.dart';
import 'package:i_billing/bloc/contract_bloc/contracts_states.dart';
import 'package:i_billing/screens/home_page/add_new.dart';
import 'package:i_billing/screens/home_page/contracts.dart';
import 'package:i_billing/screens/home_page/history.dart';
import 'package:i_billing/screens/home_page/profile.dart';
import 'package:i_billing/screens/home_page/saved.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import '../initial_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _screens = <Widget>[
    BlocProvider(
      create: (_) => ContractsBloc(ContractInitialState()),
      child: const Contracts(),
    ),
    const History(),
    const AddNew(),
    const Saved(),
    const Profile(),
  ];
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final _locale = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: const Color(0x00000000),
      body: SafeArea(child: _screens[currentIndex]),
      bottomNavigationBar: SizedBox(
        height: 83,
        child: BottomNavigationBar(
          backgroundColor: const Color(0xFF141416),
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700),
          selectedFontSize: 10,
          selectedItemColor: const Color(0xFFF2F2F2),
          unselectedFontSize: 10,
          unselectedItemColor: const Color(0xFFA6A6A6),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          onTap: (index) {
            if (index == 2) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: AlertDialog(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 24),
                        title: const Center(
                          child: Text(
                            'Что вы хотите создать?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        backgroundColor: const Color(0xFF2A2A2D),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4E4E4E),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.description,
                                  color: Color(0xFF00A795),
                                ),
                                title: const Text(
                                  'Contract',
                                  style: TextStyle(
                                    color: Color(0xFFE7E7E7),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF4E4E4E),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: ListTile(
                                leading: const Icon(
                                  Icons.description,
                                  color: Color(0xFF00A795),
                                ),
                                title: const Text(
                                  'Invoice',
                                  style: TextStyle(
                                    color: Color(0xFFE7E7E7),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    currentIndex = index;
                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else {
              setState(() {
                currentIndex = index;
              });
            }
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                activeIcon: const Icon(Icons.description_rounded),
                label: _locale!.contracts,
                icon: const Icon(Icons.description_outlined)),
            BottomNavigationBarItem(
                label: _locale.history, icon: const Icon(Icons.access_time)),
            BottomNavigationBarItem(
                activeIcon: const Icon(Icons.add_box_rounded),
                label: _locale.newContract,
                icon: const Icon(Icons.add_box_outlined)),
            BottomNavigationBarItem(
                activeIcon: const Icon(Icons.bookmark_rounded),
                label: _locale.saved,
                icon: const Icon(Icons.bookmark_border_rounded)),
            BottomNavigationBarItem(
                activeIcon: const Icon(Icons.person),
                label: _locale.profile,
                icon: const Icon(Icons.person_outline_outlined)),
          ],
        ),
      ),
    );
  }
}
