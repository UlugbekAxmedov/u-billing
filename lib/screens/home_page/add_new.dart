import 'package:flutter/material.dart';
import '../../widgets/contract_widget.dart';
import '../../widgets/invoice_widget.dart';


class AddNew extends StatefulWidget {
  const AddNew({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  bool isContract = true;

  @override
  Widget build(BuildContext context) {
    return isContract
        ? const ContractWidget()
        : const InvoiceWidget();
  }
}

class EntityWidget extends StatefulWidget {
  const EntityWidget({Key? key}) : super(key: key);

  @override
  State<EntityWidget> createState() => _EntityWidgetState();
}

class _EntityWidgetState extends State<EntityWidget> {
  @override
  Widget build(BuildContext context) {
    String _dropdownValue = 'Физическое';
    String? _groupValue;

    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: _dropDownWidget(
        items: [
          _dropdownItem(
              value: 'Физическое',
              groupValue: _groupValue,
              onChanged: (String? newValue) {
                setState(() {
                  _groupValue = newValue;
                });
              }),
          _dropdownItem(
              value: 'Юридическое',
              groupValue: _groupValue,
              onChanged: (String? newValue) {
                setState(() {
                  _groupValue = newValue;
                });
              }),
        ],
        value: _dropdownValue,
        onChanged: (newValue) {
          setState(() {
            _dropdownValue = newValue;
          });
        },
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
  String _groupValue = 'Paid';
  String _dropDownValue = 'Paid';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, top: 6),
      child: _dropDownWidget(
          items: [
            _dropdownItem(
                value: 'Paid',
                groupValue: _groupValue,
                onChanged: (newValue) {
                  setState(() {
                    _groupValue = newValue;
                  });
                }),
            _dropdownItem(
                value: 'In process',
                groupValue: _groupValue,
                onChanged: (newValue) {
                  setState(() {
                    _groupValue = newValue;
                  });
                }),
            _dropdownItem(
                value: 'Rejected by Payme',
                groupValue: _groupValue,
                onChanged: (newValue) {
                  setState(() {
                    _groupValue = newValue;
                  });
                }),
            _dropdownItem(
                value: 'Rejected by IQ',
                groupValue: _groupValue,
                onChanged: (newValue) {
                  setState(() {
                    _groupValue = newValue;
                  });
                }),
          ],
          value: _dropDownValue,
          onChanged: (newValue) {
            setState(() {
              _dropDownValue = newValue;
            });
          }),
    );
  }
}

Widget _dropDownWidget(
    {required List<DropdownMenuItem> items,
    required String value,
    required Function onChanged}) {
  return DropdownButtonFormField<dynamic>(
    items: items,
    value: value,
    onChanged: (_) => onChanged,
    dropdownColor: const Color(0xFF2A2A2D),
    icon: const Icon(
      Icons.arrow_drop_down_circle_rounded,
    ),
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(241, 241, 241, 0.4), width: 1.2),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Color.fromRGBO(241, 241, 241, 1), width: 1.2),
      ),
    ),
    style: const TextStyle(
        color: Color(0xFFE7E7E7), fontSize: 16, fontFamily: 'Ubuntu'),
  );
}

DropdownMenuItem _dropdownItem(
    {required dynamic value,
    required dynamic groupValue,
    required Function onChanged}) {
  return DropdownMenuItem(
    value: value,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFFE7E7E7),
          ),
        ),
        Radio<String>(
          activeColor: const Color(0xFF008F7F),
          value: value,
          groupValue: groupValue,
          onChanged: (_) => onChanged,
        ),
      ],
    ),
  );
}
