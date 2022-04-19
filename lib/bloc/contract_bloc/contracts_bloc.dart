import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_billing/bloc/contract_bloc/contracts_events.dart';
import 'package:i_billing/bloc/contract_bloc/contracts_states.dart';

class ContractsBloc extends Bloc<ContractsEvents, ContractsStates> {
  ContractsBloc(ContractsStates initialState) : super(ContractsLoadedState()) {
    on<FilterEnabledEvent>((event, emit) => emit(FilterEnabledState()));
    on<SearchEvent>((event, emit) => emit(SearchState()));
    on<ContractsLoadedEvent>((event, emit) => emit(ContractsLoadedState()));
  }
}
