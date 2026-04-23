import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mara_rei_achuna1/screen/articles_list_screen.dart';
import 'package:mara_rei_achuna1/screen/donation_screen.dart';
import 'package:mara_rei_achuna1/screen/general_qa_screen.dart';
import 'package:mara_rei_achuna1/screen/history_screen.dart';
import 'package:mara_rei_achuna1/screen/mara_category_screen.dart';
import 'package:mara_rei_achuna1/screen/poem_list_screen.dart';
import 'package:mara_rei_achuna1/screen/story_list_screen.dart';
import 'package:mara_rei_achuna1/screen/theme_provider.dart';
import 'package:mara_rei_achuna1/screen/topic_screen.dart';
import 'package:mara_rei_achuna1/screen/article_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _tab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // ---------- IMAGE HEADER ----------
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Builder(builder: (context) {
                final safeTop = MediaQuery.of(context).padding.top;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Full visible image with rounded corners
                    const _ResponsiveHeaderImage(
                        assetPath: 'assets/image/Contents2.jpg'),

                    // Left menu icon (outside the box)
                    Positioned(
                      left: 0,
                      top: -5 + safeTop,
                      child: IconButton(
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Color.fromARGB(255, 246, 245, 245),
                        ),
                        iconSize: 30,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: const Color(0xFF2A2A2A),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) {
                              return Consumer<ThemeProvider>(
                                builder: (context, themeProvider, _) {
                                  return Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "Settings",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        const SizedBox(height: 20),
                                        SwitchListTile(
                                          title: const Text(
                                            "Dark Mode",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          value: themeProvider.isDark,
                                          onChanged: (value) {
                                            themeProvider.toggleTheme();
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    ),

                    // Right profile icon (outside the box)
                  ],
                );
              }),
            ),
          ),

          // ---------- MAIN BODY ----------
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _Section(
                  title: 'Mara Reih Achuna',
                  initiallyExpanded: true,
                  child: _FolderGrid(
                    items: [
                      FolderItem(
                        title: 'Achu awpa zy',
                        count: 0,
                        accent: const Color(0xFFA7E3F1),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const TopicScreen()),
                          );
                        },
                      ),
                      FolderItem(
                        title: 'Mara hla',
                        count: 0,
                        accent: const Color(0xFFD2B6F6),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const MaraCategoryScreen(), // ✅ FIXED
                            ),
                          );
                        },
                      ),
                      FolderItem(
                        title: 'Phôhpa',
                        count: 0,
                        accent: const Color(0xFFE7D39E),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const StoryListScreen()),
                          );
                        },
                      ),
                      FolderItem(
                        title: 'GK',
                        count: 0,
                        accent: const Color(0xFFE7D39E),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const GeneralQAScreen()),
                          );
                        },
                      ),
                      FolderItem(
                        title: 'History',
                        count: 0,
                        accent: const Color(0xFFE7D39E),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => HistoryScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ---------- TAP CARDS ----------
                _NavCard(
                  title: 'Articles reih awpa',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ArticleListScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),

                _NavCard(
                  title: 'Hla phô',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PoemsListScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 12),

                _NavCard(
                  title: 'Donation',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DonationScreen()),
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== IMAGE HEADER (Full Image Visible) ===================== */
class _ResponsiveHeaderImage extends StatelessWidget {
  final String assetPath;

  const _ResponsiveHeaderImage({
    required this.assetPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ✅ dynamic sizing — adjusts automatically by screen height
    final double screenWidth = MediaQuery.of(context).size.width;
    final double headerHeight =
        screenWidth * 0.61; // ~55% of width for a balanced shape
    const double radius = 25; // ✅ fixed roundness (stable on all devices)

    return Container(
      width: double.infinity,
      height: headerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ✅ show entire image (no cropping)
          FittedBox(
            fit: BoxFit.contain,
            alignment: Alignment.center,
            child: Image.asset(assetPath),
          ),

          // ✅ gradient overlay for text/icon contrast
          const IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [Colors.black26, Colors.transparent],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/* ===================== SECTION / FOLDER / NAV ===================== */
class _Section extends StatefulWidget {
  final String title;
  final bool initiallyExpanded;
  final Widget child;

  _Section({
    Key? key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
  }) : super(key: key);

  @override
  State<_Section> createState() => _SectionState();
}

class _SectionState extends State<_Section> {
  late bool _open = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _glassCardDecoration(context),
      child: ExpansionTile(
        initiallyExpanded: widget.initiallyExpanded,
        onExpansionChanged: (v) => setState(() => _open = v),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 16),
        trailing: Icon(_open ? Icons.expand_less : Icons.expand_more),
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontSize: 16.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        children: [widget.child],
      ),
    );
  }
}

class _FolderGrid extends StatelessWidget {
  final List<FolderItem> items;
  const _FolderGrid({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 120,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, i) => _FolderCard(item: items[i]),
    );
  }
}

class FolderItem {
  final String title;
  final int count;
  final Color accent;
  final VoidCallback onTap;
  FolderItem({
    required this.title,
    required this.count,
    required this.accent,
    required this.onTap,
  });
}

class _FolderCard extends StatelessWidget {
  final FolderItem item;
  const _FolderCard({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: item.onTap,
      child: Container(
        decoration: _glassCardDecoration(context),
        padding: const EdgeInsets.all(14),
        child: Stack(
          children: [
            Positioned(
              top: 8,
              left: 10,
              child: Container(
                width: 52,
                height: 10,
                decoration: BoxDecoration(
                  color: item.accent,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 22),
                Text(
                  item.title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _NavCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _NavCard({required this.title, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: _glassCardDecoration(context),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}

/* ===================== Shared decorations ===================== */
BoxDecoration _glassCardDecoration(BuildContext context) {
  final isDark = Theme.of(context).brightness == Brightness.dark;

  return BoxDecoration(
    color:
        isDark ? Colors.white.withOpacity(0.05) : Colors.white.withOpacity(0.6),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      color: isDark
          ? Colors.white.withOpacity(0.08)
          : Colors.white.withOpacity(0.4),
    ),
    boxShadow: [
      BoxShadow(
        blurRadius: 30,
        offset: const Offset(0, 10),
        color: isDark
            ? Colors.black.withOpacity(0.6)
            : Colors.black.withOpacity(0.08),
      ),
    ],
  );
}
