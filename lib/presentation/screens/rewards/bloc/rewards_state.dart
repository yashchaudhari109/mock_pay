import 'package:equatable/equatable.dart';
import 'package:mock_pay/data/models/bill_model.dart';

abstract class RewardsState extends Equatable {
  const RewardsState();

  @override
  List<Object> get props => [];
}

/// The initial state of the screen before any data is loaded.
/// The UI will show a loading indicator in this state.
class RewardsInitial extends RewardsState {}

/// The state when the bills are being fetched from the repository.
class RewardsLoading extends RewardsState {}

/// The state when the bills have been successfully loaded.
/// It holds the list of bills that the UI will display.
class RewardsLoaded extends RewardsState {
  final List<Bill> bills;

  const RewardsLoaded(this.bills);

  @override
  List<Object> get props => [bills];
}

/// The state representing an error during data fetching.
/// It holds an error message to be displayed to the user.
class RewardsError extends RewardsState {
  final String message;

  const RewardsError(this.message);

  @override
  List<Object> get props => [message];
}
