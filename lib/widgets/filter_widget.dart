import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Filters extends StatefulWidget {
  Filters(
      {Key? key,
      required this.paid,
      required this.inProcess,
      required this.rejectedByIQ,
      required this.rejectedByPayme,
      required this.date,
      required this.dateTimeControllerFrom,
      required this.dateTimeControllerTo,})
      : super(key: key);

  bool paid = false;
  bool inProcess = false;
  bool rejectedByIQ = false;
  bool rejectedByPayme = false;
  DateTime date = DateTime.now();
  TextEditingController? dateTimeControllerFrom = TextEditingController();
  TextEditingController? dateTimeControllerTo = TextEditingController();

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  _dateHandlerFrom(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: widget.date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));

    if (date != widget.date) {
      setState(() {
        widget.date = date as DateTime;
      });
      widget.dateTimeControllerFrom!.text = _dateFormat.format(date!);
    }
  }

  _dateHandlerTo(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: widget.date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2050));

    if (date != widget.date) {
      setState(() {
        widget.date = date as DateTime;
      });
      widget.dateTimeControllerTo!.text = _dateFormat.format(date!);
    }
  }

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text('Filters'),
            centerTitle: true,
            backgroundColor: const Color(0xFF141416),
            leading: IconButton(
              onPressed: () => {

              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 28, left: 16),
                child: Text(
                  'Status',
                  style: TextStyle(
                      color: Color(0xFF999999), fontWeight: FontWeight.w700),
                ),
              ),
              const StatusWidget(),
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
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 50,
                    width: 140,
                    child: TextField(
                      readOnly: true,
                      controller: widget.dateTimeControllerFrom,
                      style: const TextStyle(color: Color(0xFFDADADA)),
                      decoration: InputDecoration(
                        focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.only(left: 12),
                        isDense: true,
                        border: const OutlineInputBorder(gapPadding: 0),
                        hintText: 'From',
                        hintStyle: const TextStyle(color: Color(0xFFDADADA)),
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => _dateHandlerFrom(context),
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
                      controller: widget.dateTimeControllerTo,
                      style: const TextStyle(color: Color(0xFFDADADA)),
                      decoration: InputDecoration(
                        focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                        contentPadding: const EdgeInsets.only(left: 12),
                        isDense: true,
                        border: const OutlineInputBorder(gapPadding: 0),
                        hintText: 'To',
                        hintStyle: const TextStyle(color: Color(0xFFDADADA)),
                        suffixIcon: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () => _dateHandlerTo(context),
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
              const ButtonWidget(),
            ],
          ),
        );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 28, right: 16),
                child: ElevatedButton(
                  onPressed: () {},
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
                      const EdgeInsets.symmetric(vertical: 12),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(0, 143, 127, 0.3),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 28, right: 16),
                child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6))),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 12),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xFF008F7F))),
                  onPressed: () {},
                  child: const Text(
                    'Apply Filters',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusWidget extends StatefulWidget {
  const StatusWidget({Key? key}) : super(key: key);

  @override
  _StatusWidgetState createState() => _StatusWidgetState();
}

class _StatusWidgetState extends State<StatusWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckBoxWidget(status: false, title: 'Paid'),
              CheckBoxWidget(status: false, title: 'In process'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CheckBoxWidget(status: false, title: 'Rejected by IQ'),
              CheckBoxWidget(status: false, title: 'Rejected by Payme'),
            ],
          ),
        ),
      ],
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({Key? key, required this.status, required this.title})
      : super(key: key);

  bool status;
  String title;

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: widget.status,
          onChanged: (value) {
            setState(() {
              widget.status = value!;
            });
          },
          activeColor: Colors.white,
          checkColor: const Color(0xFF1E1E20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: const BorderSide(color: Color(0xFFA6A6A6)),
        ),
        Text(
          widget.title,
          style: const TextStyle(color: Color(0xFFF2F2F2)),
        ),
      ],
    );
  }
}
