import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

class _CustomAppBarState extends State<CustomAppBar> {

  String language = "fr";


  @override
  Widget build(BuildContext context) {


    final provider = Provider.of<LocaleProvider>(context, listen: false,);

    final local = AppLocalizations.of(context)!;

    String selectedLanguage = provider.locale.languageCode;

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

           Text(
            local.startupName,
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
              value: selectedLanguage,

              underline: const SizedBox(),

              dropdownColor: Colors.white,

              items: const [

                DropdownMenuItem(
                  value: "fr",
                  child: Text("🇫🇷 Français"),
                ),

                DropdownMenuItem(
                  value: "en",
                  child: Text("🇬🇧 English"),
                ),

                DropdownMenuItem(
                  value: "es",
                  child: Text("🇪🇸 Español"),
                ),

                DropdownMenuItem(
                  value: "ar",
                  child: Text("🇲🇦 العربية"),
                ),

              ],

              onChanged: (value) {

                if(value==null) return;

                provider.setLocale(
                  Locale(value),
                );

              },

            ),

        ),

        const SizedBox(width: 15),

      ],

    );

  }

}