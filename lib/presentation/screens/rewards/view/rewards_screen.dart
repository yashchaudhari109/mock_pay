import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mock_pay/data/models/bill_model.dart';
import 'package:mock_pay/presentation/helper/scratch_dialog.dart';
import 'package:mock_pay/presentation/screens/brand/brand_screen.dart';
import 'package:mock_pay/presentation/screens/rewards/bloc/rewards_bloc.dart';
import 'package:mock_pay/presentation/screens/rewards/bloc/rewards_state.dart';
import 'package:mock_pay/presentation/screens/rewards/widgets/bill_list_item.dart';
import 'package:shimmer/shimmer.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // We use a transparent app bar for a cleaner look, letting the body content
        // start from the very top of the screen.
        title: Text(
          'Your Rewards',
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        // BlocBuilder handles rebuilding the UI in response to new states.
        child: BlocBuilder<RewardsBloc, RewardsState>(
          builder: (context, state) {
            // Show a loading spinner while data is being fetched.
            if (state is RewardsLoading || state is RewardsInitial) {
              return const Center(child: CircularProgressIndicator());
            }
            // Show the main content when the bills are loaded.
            if (state is RewardsLoaded) {
              // Using a custom scroll view to combine non-scrollable and scrollable items.
              return CustomScrollView(
                slivers: [
                  // SliverToBoxAdapter allows us to place regular widgets inside a CustomScrollView.
                  SliverToBoxAdapter(child: _buildHeader(context)),
                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                  SliverToBoxAdapter(child: _buildSectionTitle()),
                  // SliverList is an efficient way to render a list of items.
                  _buildBillList(state.bills),
                ],
              );
            }
            // Show an error message if fetching failed.
            if (state is RewardsError) {
              return Center(child: Text(state.message));
            }
            // A fallback for any unhandled state.
            return const Center(child: Text('Something went wrong!'));
          },
        ),
      ),
    );
  }

  // Builds the top part of the screen with the reward text and button.
// Place this inside the RewardsScreen class, replacing the old _buildHeader.
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              onPressed: () {
                _showRewardPopup(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero, // remove default padding
                backgroundColor:
                    Colors.transparent, // shimmer will handle background
                shadowColor: Colors.amber.withOpacity(0.8),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.amber.shade600,
                    highlightColor: Colors.yellow.shade400,
                    period: const Duration(seconds: 2),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.amber.shade600,
                      ),
                    ),
                  ),
                  const Text(
                    '🎁 Claim Rewards',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: Colors.white, // stays visible
                      shadows: [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black26,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChooseBrandScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Choose Brand',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Builds the title for the "Recent Bills" section.
  Widget _buildSectionTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        'Recent Bills',
        style: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }

  // Builds the scrollable list of bills.
  Widget _buildBillList(List<Bill> bills) {
    // Bonus: Adding a subtle animation. Each list item will fade and slide in.
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          // Wrap the BillListItem in an animation widget.
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300 + (index * 100)),
            child: BillListItem(bill: bills[index]),
          );
        },
        childCount: bills.length,
      ),
    );
  }
}

// Place this method inside the RewardsScreen class, right below _buildHeader.
void _showRewardPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.5),
    builder: (BuildContext dialogContext) {
      // Simply return an instance of our new stateful dialog widget.
      return const RewardScratchDialog();
    },
  );
}
