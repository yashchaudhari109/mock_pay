import 'package:bloc/bloc.dart';
import 'package:mock_pay/data/repositories/bill_repository.dart';
import 'package:mock_pay/presentation/screens/rewards/bloc/rewards_event.dart';
import 'package:mock_pay/presentation/screens/rewards/bloc/rewards_state.dart';

class RewardsBloc extends Bloc<RewardsEvent, RewardsState> {
  final BillRepository _billRepository;

  RewardsBloc({required BillRepository billRepository})
      : _billRepository = billRepository,
        super(RewardsInitial()) {
    // Set the initial state
    // Register the event handlers
    on<FetchBillsEvent>(_onFetchBills);
    on<ChooseBrandButtonTappedEvent>(_onChooseBrandTapped);
  }

  // Handler for the FetchBillsEvent
  Future<void> _onFetchBills(
    FetchBillsEvent event,
    Emitter<RewardsState> emit,
  ) async {
    emit(RewardsLoading()); // Emit loading state to show a spinner in the UI
    try {
      final bills = await _billRepository.getBills();
      emit(RewardsLoaded(bills)); // Emit loaded state with the data
    } catch (e) {
      emit(const RewardsError(
          'Failed to fetch bills. Please try again.')); // Emit error state
    }
  }

  // Handler for the ChooseBrandButtonTappedEvent
  void _onChooseBrandTapped(
    ChooseBrandButtonTappedEvent event,
    Emitter<RewardsState> emit,
  ) {
    // For this task, we don't need to change the state.
    // In a real app, you might emit a state to navigate, like:
    // emit(NavigateToBrandSelection());
    print('Choose Brand button tapped!'); // Simulate navigation
  }
}
