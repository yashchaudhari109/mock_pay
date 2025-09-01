import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Bill extends Equatable {
  final String cardHolderName;
  final String cardType;
  final String lastFourDigits;
  final IconData icon;
  final Color cardColor;
  final double amount;
  final String date;
  final String status;

  const Bill({
    required this.cardHolderName,
    required this.cardType,
    required this.lastFourDigits,
    required this.icon,
    required this.cardColor,
    required this.amount,
    required this.date,
    required this.status,
  });

  // By defining the props, Equatable can automatically handle value equality.
  // This means two Bill instances are considered equal if all these properties match.
  @override
  List<Object?> get props => [
        cardHolderName,
        cardType,
        lastFourDigits,
        icon,
        cardColor,
        amount,
        date,
        status,
      ];
}
