import 'package:flutter/material.dart';

import 'sections/accueil_section.dart';
import 'sections/contact_section.dart';
import 'sections/informations_section.dart';
import 'sections/partenaires_section.dart';
import 'sections/solutions_section.dart';

import 'widgets/custom_appbar.dart';
import 'widgets/custom_footer.dart';

class StartupHomePage extends StatefulWidget {
  const StartupHomePage({super.key});

  @override
  State<StartupHomePage> createState() => _StartupHomePageState();
}

class _StartupHomePageState extends State<StartupHomePage> {

  int currentIndex = 0;

  final List<Widget> pages = const [

    AccueilSection(),

    SolutionsSection(),

    PartenairesSection(),

    ContactSection(),

    InformationsSection(),

  ];

  final List<String> titles = [

    "Accueil",

    "Nos solutions",

    "Nos partenaires",

    "Nous contacter",

    "Informations",

  ];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: CustomAppBar(),

      body: AnimatedSwitcher(

        duration: const Duration(milliseconds: 500),

        child: pages[currentIndex],

      ),

      bottomNavigationBar: CustomFooter(

        selectedIndex: currentIndex,

        onItemSelected: (index){

          setState(() {

            currentIndex = index;

          });

        },

      ),

    );

  }

}