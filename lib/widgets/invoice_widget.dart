import 'package:flutter/material.dart';

import '../screens/home_page/add_new.dart';
import 'package:i_billing/constants/constants.dart' as constants;

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'New invoice',
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: const Color(0xFF141416),
        leading: constants.appBarLeading,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 20, bottom: 6),
            child: Text(
              'Xizmat nomi',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          ServiceWidget(),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Invoice summasi',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          InvoiceSumWidget(),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Status of the invoice',
              style: TextStyle(
                color: Color.fromRGBO(241, 241, 241, 0.4),
              ),
            ),
          ),
          StatusWidget(),
        ],
      ),
    );
  }
}

class InvoiceSumWidget extends StatelessWidget {
  const InvoiceSumWidget({
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

class ServiceWidget extends StatelessWidget {
  const ServiceWidget({
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