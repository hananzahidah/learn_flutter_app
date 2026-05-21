import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Function(GlobalKey) onScroll;

  final GlobalKey checkboxKey;
  final GlobalKey switchKey;
  final GlobalKey dropdownKey;
  final GlobalKey dateKey;
  final GlobalKey timeKey;

  const AppDrawer({
    super.key,
    required this.onScroll,
    required this.checkboxKey,
    required this.switchKey,
    required this.dropdownKey,
    required this.dateKey,
    required this.timeKey,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xffF6F6F9),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0061FF), Color(0xff3A7BFF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Menu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Navigasi formulir bagian",
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          _buildTile(
            context,
            icon: Icons.gavel,
            title: "Syarat & Ketentuan",
            onTap: () => _scroll(context, checkboxKey),
          ),

          _buildTile(
            context,
            icon: Icons.nightlight,
            title: "Mode Tampilan",
            onTap: () => _scroll(context, switchKey),
          ),

          _buildTile(
            context,
            icon: Icons.category,
            title: "Kategori",
            onTap: () => _scroll(context, dropdownKey),
          ),

          _buildTile(
            context,
            icon: Icons.calendar_today,
            title: "Tanggal Lahir",
            onTap: () => _scroll(context, dateKey),
          ),

          _buildTile(
            context,
            icon: Icons.timer,
            title: "Waktu Pengingat",
            onTap: () => _scroll(context, timeKey),
          ),
        ],
      ),
    );
  }

  void _scroll(BuildContext context, GlobalKey key) {
    Navigator.pop(context);
    onScroll(key);
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),

            child: Row(
              children: [
                Icon(icon, color: const Color(0xff0061FF)),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
