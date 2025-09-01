import 'package:equatable/equatable.dart';

abstract class RewardsEvent extends Equatable {
  const RewardsEvent();

  @override
  List<Object> get props => [];
}

/// Event triggered when the screen is initialized and needs to load the bill data.
class FetchBillsEvent extends RewardsEvent {}

/// Event triggered when the user taps the 'Choose Brand' button.
class ChooseBrandButtonTappedEvent extends RewardsEvent {}
