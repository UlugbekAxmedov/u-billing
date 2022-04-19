import 'package:flutter/material.dart';
import 'package:i_billing/widgets/filter_widget.dart';
import 'package:i_billing/constants/constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Saved extends StatefulWidget {
  const Saved({Key? key}) : super(key: key);

  @override
  State<Saved> createState() => _SavedState();
}

class _SavedState extends State<Saved> {
  bool _filtered = false;
  bool _enabled = false;

  @override
  Widget build(BuildContext context) {

    final _locale = AppLocalizations.of(context);
    return !_filtered
        ? Scaffold(
            backgroundColor: Colors.black,
            appBar: !_enabled
                ? AppBar(
                    title: Text(_locale!.saved),
                    backgroundColor: const Color(0xFF141416),
                    leading: constants.appBarLeading,
                    actions: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _filtered = true;
                          });
                        },
                        child: const Image(
                          width: 24,
                          height: 24,
                          image: AssetImage('assets/images/filter.png'),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        child: Container(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        onPressed: () {
                          setState(() {
                            _enabled = true;
                          });
                        },
                        splashRadius: 16,
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                    ],
                  )
                : AppBar(
                    backgroundColor: Colors.black,
                    leading: IconButton(
                      onPressed: () {
                        setState(() {
                          _enabled = false;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 28,
                      ),
                      splashRadius: 16,
                    ),
                    title: const TextField(
                      autofocus: true,
                      cursorColor: Colors.white,
                      cursorHeight: 20,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Search by keywords',
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                        ),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _enabled = false;
                          });
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          size: 28,
                        ),
                        splashRadius: 16,
                      ),
                    ],
                  ),
            body: Container(
              margin: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            bottom: 12, left: 16, right: 16),
                        decoration: BoxDecoration(
                            color: const Color(0xFF2A2A2D),
                            borderRadius: BorderRadius.circular(6)),
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.description,
                                  color: Color(0xFF008F7F),
                                  size: 18,
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Expanded(
                                  child: Text(
                                    '№ 154',
                                    style: TextStyle(
                                        color: Color(0xFFE7E7E7),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color.fromRGBO(
                                        73, 183, 165, 0.15),
                                  ),
                                  child: const Text(
                                    'Paid',
                                    style: TextStyle(
                                      color: Color(0xFF49B7A5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 2),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Fish:  ',
                                  style: TextStyle(
                                      color: Color(0xFFE7E7E7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Yoldosheva Ziyoda',
                                  style: TextStyle(color: Color(0xFF999999)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Amount   ',
                                  style: TextStyle(
                                      color: Color(0xFFE7E7E7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '1,200,000 UZS',
                                  style: TextStyle(color: Color(0xFF999999)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Last invoice:  ',
                                  style: TextStyle(
                                      color: Color(0xFFE7E7E7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '№ 156',
                                  style: TextStyle(color: Color(0xFF999999)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Number of invoices:  ',
                                  style: TextStyle(
                                      color: Color(0xFFE7E7E7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                    child: Text(
                                  '6',
                                  style: TextStyle(color: Color(0xFF999999)),
                                )),
                                Text(
                                  '31.01.2021',
                                  style: TextStyle(
                                      color: Color(0xFF999999),
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        : Filters(
            paid: false,
            inProcess: false,
            rejectedByIQ: false,
            rejectedByPayme: false,
            date: DateTime.now(),
            dateTimeControllerFrom: null,
            dateTimeControllerTo: null);
  }
}
