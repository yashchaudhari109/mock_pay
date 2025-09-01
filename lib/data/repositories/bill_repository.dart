import 'package:flutter/material.dart';
import 'package:mock_pay/data/models/bill_model.dart';

class BillRepository {
  // In a real app, this would be an async call to a network API or database.
  // We use Future.delayed to simulate a network request latency.
  Future<List<Bill>> getBills() async {
    await Future.delayed(
        const Duration(milliseconds: 800)); // Simulate network delay

    // This is our mock data source.
    return [
      Bill(
        cardHolderName: 'Jane Doe',
        cardType: 'Visa',
        lastFourDigits: '4242',
        icon: Icons.shopping_bag_outlined,
        cardColor: Colors.blue.shade300,
        amount: 150.75,
        date: '25 Aug 2025',
        status: 'Paid',
      ),
      Bill(
        cardHolderName: 'Jane Doe',
        cardType: 'Mastercard',
        lastFourDigits: '5588',
        icon: Icons.restaurant_menu_outlined,
        cardColor: Colors.orange.shade400,
        amount: 200.00,
        date: '28 Aug 2025',
        status: 'Due',
      ),
      Bill(
        cardHolderName: 'Jane Doe',
        cardType: 'Amex',
        lastFourDigits: '8001',
        icon: Icons.flight_takeoff_outlined,
        cardColor: Colors.deepPurple.shade300,
        amount: 75.50,
        date: '15 Sep 2025',
        status: 'Upcoming',
      ),
    ];
  }
}
