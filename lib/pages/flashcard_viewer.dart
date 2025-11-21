import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlashcardViewer extends StatefulWidget {
  final List<Map<String, String>> flashcards;
  final int startIndex;

  const FlashcardViewer({
    super.key,
    required this.flashcards,
    this.startIndex = 0,
  });

  @override
  State<FlashcardViewer> createState() => _FlashcardViewerState();
}

class _FlashcardViewerState extends State<FlashcardViewer> {
  late List<Map<String, String>> cards;
  int currentIndex = 0;
  bool showBack = false;
  int knownCount = 0;
  int unknownCount = 0;
  List<Map<String, String>> unknownCards = [];

  @override
  void initState() {
    super.initState();
    cards = List<Map<String, String>>.from(widget.flashcards)..shuffle();
    currentIndex = widget.startIndex.clamp(0, cards.length - 1);
  }

  void _flipCard() => setState(() => showBack = !showBack);

  void _nextCard(bool remembered) {
    final current = cards[currentIndex];
    if (remembered) {
      knownCount++;
    } else {
      unknownCount++;
      unknownCards.add(current);
    }

    setState(() {
      showBack = false;
      if (currentIndex < cards.length - 1) {
        currentIndex++;
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.pink[50],
        title: Text(
          tr("flashcard.result_title"),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Text(
          "${tr("flashcard.remembered_count", namedArgs: {"count": knownCount.toString()})}\n"
              "${tr("flashcard.not_remembered_count", namedArgs: {"count": unknownCount.toString()})}",
          style: GoogleFonts.poppins(fontSize: 18),
        ),
        actions: [
          if (unknownCards.isNotEmpty)
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  cards = List<Map<String, String>>.from(unknownCards)..shuffle();
                  unknownCards.clear();
                  currentIndex = 0;
                  knownCount = 0;
                  unknownCount = 0;
                  showBack = false;
                });
              },
              child: Text(tr("flashcard.review_unremembered")),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(tr("flashcard.complete")),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final card = cards[currentIndex];
    final name = card['name'] ?? '';
    final desc = card['desc_en'] ?? '';
    final vi = card['desc_vi'] ?? '';
    final example = card['example_en'] ?? '';
    final exampleVi = card['example_vi'] ?? '';
    final img = card['img'] ?? '';

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF2C2C2C) : Colors.white;
    final backgroundColor = isDark ? const Color(0xFF1E1E1E) : Colors.pink[50];
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.grey[400]! : Colors.grey[700]!;
    final viTextColor = isDark ? Colors.pink[200]! : Colors.pinkAccent.shade200;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          '${tr("flashcard.card")} ${currentIndex + 1}/${cards.length}',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor:
        isDark ? Colors.pink[200]!.withOpacity(0.2) : Colors.pinkAccent.shade100,
        foregroundColor: isDark ? Colors.pink[100] : Colors.white,
      ),
      body: GestureDetector(
        onTap: _flipCard,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (child, anim) {
              final rotate = Tween(begin: pi, end: 0.0).animate(
                CurvedAnimation(parent: anim, curve: Curves.easeInOut),
              );
              return AnimatedBuilder(
                animation: rotate,
                builder: (context, _) {
                  final isUnder = (ValueKey(showBack) != child!.key);
                  final value = isUnder ? min(rotate.value, pi / 2) : rotate.value;
                  return Transform(
                    transform: Matrix4.rotationY(value),
                    alignment: Alignment.center,
                    child: child,
                  );
                },
                child: child,
              );
            },
            child: showBack
                ? _buildBackCard(
              name: name,
              desc: desc,
              vi: vi,
              example: example,
              exampleVi: exampleVi,
              cardColor: cardColor,
              textColor: textColor,
              subTextColor: subTextColor,
              viTextColor: viTextColor,
            )
                : _buildFrontCard(
              img: img,
              name: name,
              cardColor: cardColor,
              textColor: textColor,
              subTextColor: subTextColor,
            ),
          ),
        ),
      ),

      // ✅ FIXED bottomNavigationBar (không overflow, không warning)
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => _nextCard(false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.close, color: Colors.white),
                label: Text(
                  tr("flashcard.not_remembered"),
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () => _nextCard(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.check, color: Colors.white),
                label: Text(
                  tr("flashcard.remembered"),
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFrontCard({
    required String img,
    required String name,
    required Color cardColor,
    required Color textColor,
    required Color subTextColor,
  }) {
    return Container(
      key: const ValueKey(false),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (img.isNotEmpty)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Image.asset(img, fit: BoxFit.contain),
              ),
            ),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            tr("flashcard.tap_to_flip"),
            style: GoogleFonts.poppins(color: subTextColor),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBackCard({
    required String name,
    required String desc,
    required String vi,
    required String example,
    required String exampleVi,
    required Color cardColor,
    required Color textColor,
    required Color subTextColor,
    required Color viTextColor,
  }) {
    return Container(
      key: const ValueKey(true),
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(2, 4))
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              vi,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: viTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              desc,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: subTextColor,
              ),
            ),
            const SizedBox(height: 20),
            Divider(color: Colors.pink.shade100, thickness: 1),
            const SizedBox(height: 10),
            if (example.isNotEmpty)
              Column(
                children: [
                  Text(
                    "🗣️ $example",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 18, color: textColor),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "🇻🇳 $exampleVi",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontSize: 18, color: viTextColor),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            Text(
              tr("flashcard.tap_to_flip_back"),
              style: GoogleFonts.poppins(color: subTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
