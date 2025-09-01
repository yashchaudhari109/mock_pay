import 'package:flutter/material.dart';

class ChooseBrandScreen extends StatelessWidget {
  const ChooseBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brands = [
      {"name": "Visa", "color": Colors.blueAccent},
      {"name": "MasterCard", "color": Colors.redAccent},
      {"name": "American Express", "color": Colors.teal},
      {"name": "RuPay", "color": Colors.deepPurple},
      {"name": "Discover", "color": Colors.orangeAccent},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Choose Brand",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: brands.length,
        itemBuilder: (context, index) {
          final brand = brands[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: brand["color"] as Color,
              gradient: LinearGradient(
                colors: [
                  (brand["color"] as Color).withOpacity(0.9),
                  (brand["color"] as Color).withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(2, 2),
                )
              ],
            ),
            child: ListTile(
              title: Center(
                child: Text(
                  brand["name"] as String,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              onTap: () {
                // Handle selection if needed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior
                        .floating, // makes it float above bottom
                    backgroundColor: Colors.transparent, // so our design shows
                    elevation: 0,
                    content: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.blueAccent, // you can change per brand
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                          colors: [
                            (brand["color"] as Color).withOpacity(0.9),
                            (brand["color"] as Color).withOpacity(0.7),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: (brand["color"] as Color).withOpacity(0.5),
                            blurRadius: 8,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.check_circle,
                              color: Colors.white, size: 24),
                          const SizedBox(width: 12),
                          Text(
                            "${brand["name"]} selected",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
