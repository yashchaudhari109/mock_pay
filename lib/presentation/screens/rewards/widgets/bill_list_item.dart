import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_pay/data/models/bill_model.dart';

class BillListItem extends StatelessWidget {
  final Bill bill;

  const BillListItem({
    super.key,
    required this.bill,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          height: 210, // keeps the credit card look
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [
                bill.cardColor.withOpacity(0.9),
                bill.cardColor.withOpacity(0.7),
                bill.cardColor.withOpacity(0.5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 12,
                spreadRadius: 2,
                offset: const Offset(4, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCardHeader(),
              const Spacer(flex: 1),
              _buildCardNumber(),
              const Spacer(flex: 1),
              _buildCardFooter(context),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 80,
          child: Container(
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.2),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Builds the top section with the card type and a chip icon.
  Widget _buildCardHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bill.cardType,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        // A simple representation of a credit card chip.
        SizedBox(
          height: 35,
          width: 45,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.amber[300],
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
      ],
    );
  }

  // Builds the card number section with a monospace font for realism.
  Widget _buildCardNumber() {
    return Text(
      '••••  ••••  ••••  ${bill.lastFourDigits}',
      style: GoogleFonts.shareTechMono(
        fontSize: 18.0,
        color: Colors.white,
        letterSpacing: 1.0,
      ),
    );
  }

  // Builds the bottom section with cardholder name and bill details.
  Widget _buildCardFooter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Card Holder Info
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'CARD HOLDER',
              style: GoogleFonts.roboto(
                fontSize: 10,
                color: Colors.white.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              bill.cardHolderName,
              style: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
        // Bill Amount and Status
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '\$${bill.amount.toStringAsFixed(2)}',
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              children: [
                Text(
                  bill.date,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.normal,
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getStatusColor(bill.status),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    bill.status.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  // Helper method to return a vibrant color for the status badge.
  // These colors are designed to look good on the dark card background.
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Paid':
      case 'Upcoming':
        return Colors.green.withOpacity(0.7);
      case 'Due':
        return Colors.redAccent.withOpacity(0.8);
      default:
        return Colors.black26;
    }
  }
}
