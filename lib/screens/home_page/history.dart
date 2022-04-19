import 'package:flutter/material.dart';
import 'package:i_billing/widgets/filter_widget.dart';
import 'package:intl/intl.dart';
import 'package:i_billing/constants/constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  bool _filtered = false;
  bool _enabled = false;
  DateTime _date = DateTime.now();
  TextEditingController _dateTimeControllerFrom = TextEditingController();
  TextEditingController _dateTimeControllerTo = TextEditingController();
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  _dateHandler(BuildContext context, TextEditingController controller) async {
    final date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));

    if (date != _date) {
      setState(() {
        _date = date as DateTime;
      });
      controller.text = _dateFormat.format(date!);
    }
  }

  @override
  Widget build(BuildContext context) {

    final _locale = AppLocalizations.of(context);

    return !_filtered
        ? Scaffold(
            backgroundColor: Colors.black,
            appBar: !_enabled
                ? AppBar(
                    title: Text(_locale!.history),
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
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30, left: 16, bottom: 16),
                  child: Text(
                    'Date',
                    style: TextStyle(
                        color: Color(0xFF999999), fontWeight: FontWeight.w700),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, right: 12),
                      // padding: const EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2D),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 50,
                      width: 140,
                      child: TextField(
                        readOnly: true,
                        controller: _dateTimeControllerFrom,
                        style: const TextStyle(color: Color(0xFFDADADA)),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.only(left: 12),
                          isDense: true,
                          border: const OutlineInputBorder(gapPadding: 0),
                          hintText: 'From',
                          hintStyle: const TextStyle(color: Color(0xFFDADADA)),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () =>
                                _dateHandler(context, _dateTimeControllerFrom),
                            splashRadius: 5,
                            iconSize: 20,
                            icon: const Icon(
                              Icons.date_range,
                              color: Color(0xFFDADADA),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 2,
                      color: const Color(0xFFD1D1D1),
                      margin: const EdgeInsets.only(right: 12),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2D),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      height: 50,
                      width: 140,
                      child: TextField(
                        readOnly: true,
                        controller: _dateTimeControllerTo,
                        style: const TextStyle(color: Color(0xFFDADADA)),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none),
                          contentPadding: const EdgeInsets.only(left: 12),
                          isDense: true,
                          border: const OutlineInputBorder(gapPadding: 0),
                          hintText: 'To',
                          hintStyle: const TextStyle(color: Color(0xFFDADADA)),
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () =>
                                _dateHandler(context, _dateTimeControllerTo),
                            splashRadius: 5,
                            iconSize: 20,
                            icon: const Icon(
                              Icons.date_range,
                              color: Color(0xFFDADADA),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
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
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                                        style:
                                            TextStyle(color: Color(0xFF999999)),
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
                                        style:
                                            TextStyle(color: Color(0xFF999999)),
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
                                        style:
                                            TextStyle(color: Color(0xFF999999)),
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
                                        style:
                                            TextStyle(color: Color(0xFF999999)),
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
                      }),
                ),
              ],
            ),
          )
        : Filters(
            paid: false,
            inProcess: false,
            rejectedByIQ: false,
            rejectedByPayme: false,
            date: _date,
            dateTimeControllerFrom: _dateTimeControllerFrom,
            dateTimeControllerTo: _dateTimeControllerTo);
  }
}
