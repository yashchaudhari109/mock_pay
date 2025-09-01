// Place this new widget class in rewards_screen.dart
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scratcher/scratcher.dart';

class RewardScratchDialog extends StatefulWidget {
  const RewardScratchDialog();

  @override
  State<RewardScratchDialog> createState() => _RewardScratchDialogState();
}

class _RewardScratchDialogState extends State<RewardScratchDialog> {
  late ConfettiController _confettiController;
  bool _isScratched = false;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Congratulations!",
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "You've found a reward. Scratch to see!",
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.roboto(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),

                // Use a Stack to layer the text on top of the scratcher
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // The Scratcher Widget
                    Scratcher(
                      brushSize: 50,
                      threshold: 50,
                      // The 'color' parameter is the correct one to use.
                      // We're using a vibrant purple for an attractive look.
                      color: Colors.purple.shade300,
                      onThreshold: () {
                        if (!_isScratched) {
                          _confettiController.play();
                          setState(() {
                            _isScratched = true;
                          });
                        }
                      },
                      // The content that is revealed
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: const RadialGradient(
                            colors: [
                              Colors.white,
                              Colors.white,
                              Colors.yellow,
                              Colors.amberAccent,
                            ],
                            radius: 1.0,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 50),
                            const SizedBox(height: 12),
                            Text(
                              "You've unlocked a \$10 reward!",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // This text is layered ON TOP of the scratcher, so it's visible initially
                    IgnorePointer(
                      child: Text(
                        _isScratched ? '' : 'Scratch Here',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(_isScratched ? 'Awesome!' : 'Skip'),
                )
              ],
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: _confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          shouldLoop: false,
          numberOfParticles: 20,
          gravity: 0.1,
          colors: const [
            Colors.green,
            Colors.blue,
            Colors.pink,
            Colors.orange,
            Colors.purple,
          ],
        ),
      ],
    );
  }
}
