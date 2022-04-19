import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/bloc/contract_bloc/contracts_bloc.dart';
import 'package:i_billing/bloc/contract_bloc/contracts_events.dart';
import 'package:i_billing/bloc/contract_bloc/contracts_states.dart';
import 'package:i_billing/screens/initial_page.dart';
import '../../widgets/calendar_widget.dart';
import '../../widgets/filter_widget.dart';
import 'package:i_billing/constants/constants.dart' as constants;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Contracts extends StatefulWidget {
  const Contracts({Key? key}) : super(key: key);

  @override
  State<Contracts> createState() => _ContractsState();
}

class _ContractsState extends State<Contracts> {
  @override
  Widget build(BuildContext context) {

    final locale = AppLocalizations.of(context);

    return BlocBuilder<ContractsBloc, ContractsStates>(
      builder: (context, state) {
        if (state is FilterEnabledState) {
          return Filters(
            paid: false,
            inProcess: false,
            rejectedByIQ: false,
            rejectedByPayme: false,
            dateTimeControllerFrom: null,
            dateTimeControllerTo: null,
            date: DateTime.now(),
          );
        }
          return Scaffold(
          backgroundColor: Colors.black,
          appBar: state is SearchState
              ? AppBar(
                  backgroundColor: Colors.black,
                  leading: IconButton(
                    onPressed: () => context
                        .read<ContractsBloc>()
                        .add(ContractsLoadedEvent()),
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
                      onPressed: () => context
                          .read<ContractsBloc>()
                          .add(ContractsLoadedEvent()),
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 28,
                      ),
                      splashRadius: 16,
                    ),
                  ],
                )
              : AppBar(
                  title: Text(locale!.contracts),
                  backgroundColor: Colors.black,
                  leading: constants.appBarLeading,
                  actions: [
                    GestureDetector(
                      onTap: () =>
                          context.read<ContractsBloc>().add(FilterEnabledEvent()),
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
                      onPressed: () =>
                          context.read<ContractsBloc>().add(SearchEvent()),
                      splashRadius: 16,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ],
                ),
          body: Column(
            children: [
              const CalendarWidget(),
                if (state is ContractInitialState)
                  const InitialPage()
                else if (state is ContractsLoadedState)
                  const Body(),
            ],
          ),
        );
      },
    );
  }
}

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isContract = true;

  @override
  Widget build(BuildContext context) {
    final _locale = AppLocalizations.of(context);

    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!_isContract) {
                          _isContract = true;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: _isContract
                            ? constants.lightGreen
                            : Colors.black,
                      ),
                      margin: const EdgeInsets.only(
                          top: 32, left: 16, right: 16, bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Text(
                        _locale!.contracts,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (_isContract) {
                          _isContract = false;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: !_isContract
                            ? constants.lightGreen
                            : Colors.black,
                      ),
                      margin: const EdgeInsets.only(top: 32, bottom: 20),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: const Text(
                        'Invoice',
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              );
            }
            return _isContract ? const ContractBody() : const InvoiceBody();
          }),
    );
  }
}

class ContractBody extends StatelessWidget {
  const ContractBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 12, left: 16, right: 16),
          decoration: BoxDecoration(
              color: constants.dark,
              borderRadius: BorderRadius.circular(6)),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.description,
                    color: constants.darkGreen,
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
                      color: const Color.fromRGBO(73, 183, 165, 0.15),
                    ),
                    child: const Text(
                      'Paid',
                      style: TextStyle(
                        color: Color(0xFF49B7A5),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
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
                        color: Color(0xFF999999), fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InvoiceBody extends StatelessWidget {
  const InvoiceBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
