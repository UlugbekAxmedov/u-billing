import 'package:flutter/material.dart';
import 'package:i_billing/constants/constants.dart' as constants;
import '../screens/home_page/add_new.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContractWidget extends StatelessWidget {
  const ContractWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _locale = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          _locale!.newContract,
          style: const TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color(0xFF141416),
        leading: constants.appBarLeading,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 20, bottom: 6),
            child: Text(
              'Лицо',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          EntityWidget(),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Fisher\'s full name',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          NameWidget(),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Address of the organisation',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          AddressWidget(),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'INN',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          InnWidget(),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Status of the contract',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          StatusWidget(),
          ContractSaveWidget()
        ],
      ),
    );
  }
}

class NameWidget extends StatelessWidget {
  const NameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16, right: 16, bottom: 16, top: 6),
      child: TextFormField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(241, 241, 241, 0.4),
                width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(241, 241, 241, 1),
                width: 1.2),
          ),
        ),
      ),
    );
  }
}

class AddressWidget extends StatelessWidget {
  const AddressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16, right: 16, bottom: 16, top: 6),
      child: TextFormField(
        maxLines: 2,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(241, 241, 241, 0.4),
                width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(241, 241, 241, 1),
                width: 1.2),
          ),
        ),
      ),
    );
  }
}

class InnWidget extends StatelessWidget {
  const InnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16, right: 16, bottom: 16, top: 6),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.question_mark_outlined,
            color: Color(0xFFF1F1F1),
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(241, 241, 241, 0.4),
                width: 1.2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromRGBO(241, 241, 241, 1),
                width: 1.2),
          ),
        ),
      ),
    );
  }
}

class ContractSaveWidget extends StatelessWidget {
  const ContractSaveWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all(const Color(0xFF008F7F)),
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 12),
          ),
        ),
        onPressed: () {},
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Text(
              'Save contract',
              style: TextStyle(
                color: Color(0xFFFDFDFD),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

