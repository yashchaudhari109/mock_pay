import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mock_pay/data/repositories/bill_repository.dart';
import 'package:mock_pay/presentation/screens/rewards/bloc/rewards_bloc.dart';
import 'package:mock_pay/presentation/screens/rewards/bloc/rewards_event.dart';
import 'package:mock_pay/presentation/screens/rewards/view/rewards_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // RepositoryProvider provides an instance of BillRepository to its children.
    // This allows the Bloc to access the repository without knowing how it's created.
    return RepositoryProvider(
      create: (context) => BillRepository(),
      child: MaterialApp(
        title: 'BON Rewards',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define a clean, modern theme for the app
          scaffoldBackgroundColor:
              const Color(0xFFF5F5F7), // Light grey background
          primarySwatch: Colors.blue,
          fontFamily:
              'Roboto', // Example font family (add to pubspec.yaml if custom)
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          textTheme: const TextTheme(
            headlineSmall: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            titleLarge: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            bodyLarge: TextStyle(
              fontSize: 16.0,
            ),
            bodyMedium: TextStyle(
              fontSize: 14.0,
              color: Colors.black54,
            ),
          ),
        ),
        home: buildRewardsScreen(),
      ),
    );
  }

  Widget buildRewardsScreen() {
    // BlocProvider creates and provides the RewardsBloc to the RewardsScreen.
    // It fetches the BillRepository instance from the context using context.read<BillRepository>().
    return BlocProvider(
      create: (context) => RewardsBloc(
        billRepository: context.read<BillRepository>(),
      )..add(FetchBillsEvent()), // Trigger initial data fetch event
      child: const RewardsScreen(),
    );
  }
}
