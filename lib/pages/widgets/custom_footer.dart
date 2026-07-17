import 'package:flutter/material.dart';

class CustomFooter extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomFooter({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  Widget buildItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final bool selected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => onItemSelected(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: selected
                ? Colors.green.shade700
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 17,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xff0D1B2A),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                buildItem(
                  icon: Icons.home,
                  title: "Home",
                  index: 0,
                ),
                buildItem(
                  icon: Icons.agriculture,
                  title: "Nos solutions",
                  index: 1,
                ),
                buildItem(
                  icon: Icons.handshake,
                  title: "Partenaires",
                  index: 2,
                ),
                buildItem(
                  icon: Icons.call,
                  title: "Contact",
                  index: 3,
                ),
                buildItem(
                  icon: Icons.info,
                  title: "Informations",
                  index: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}