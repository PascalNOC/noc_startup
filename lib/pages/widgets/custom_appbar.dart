import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {

  String language = "Français";

  @override
  Widget build(BuildContext context) {

    return AppBar(

      toolbarHeight: 70,

      backgroundColor: const Color(0xff0D1B2A),

      elevation: 0,

      titleSpacing: 15,

      title: Row(

        children: [

          Image.asset(
            "assets/logo.jpeg",
            width: 45,
            height: 45,
          ),

          const SizedBox(width: 12),

          const Text(
            "NOC",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

        ],

      ),

      actions: [

        const Icon(Icons.language),

        const SizedBox(width: 8),

        DropdownButtonHideUnderline(

          child: DropdownButton<String>(

            value: language,

            dropdownColor: const Color(0xff0D1B2A),

            iconEnabledColor: Colors.white,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),

            items: const [

              DropdownMenuItem(
                value: "Français",
                child: Text("Français"),
              ),

              DropdownMenuItem(
                value: "English",
                child: Text("English"),
              ),

              DropdownMenuItem(
                value: "Español",
                child: Text("Español"),
              ),

              DropdownMenuItem(
                value: "العربية",
                child: Text("العربية"),
              ),

            ],

            onChanged: (value){

              setState(() {

                language = value!;

              });

            },

          ),

        ),

        const SizedBox(width: 15),

      ],

    );

  }

}