import 'package:flutter/material.dart';

import '../widgets/background_slider.dart';
import '../widgets/animated_text.dart';

import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';


class AccueilSection extends StatelessWidget {
  const AccueilSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context, listen: false,);

    

    String selectedLanguage = provider.locale.languageCode;
    final local = AppLocalizations.of(context)!;

    return BackgroundSlider(

      images: const [

        "assets/images/cloud.jpg",
        "assets/images/maps.jpg",
        "assets/images/water.jpg",
        "assets/images/agriculture.jfif",
        "assets/images/iot.jfif",

      ],

      child: SingleChildScrollView(

        child: Column(

          children: [

            SizedBox(

              height: MediaQuery.of(context).size.height,

              child: AnimatedTextWidget(

                title: local.welcome,

                subtitle:
                    local.heroSubtitle,

                //buttonText: local.discover,

                //onPressed: () {},

              ),

            ),

            Container(

              width: double.infinity,

              color: Colors.white,

              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 50,
              ),

              child: Column(

                children: [

                   Text(

                    local.whosUs,

                    style: TextStyle(

                      fontSize: 32,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 25),

                   Text(

                    local.accueil_txt1,

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 18,
                      height: 1.7,
                    ),

                  ),

                  const SizedBox(height: 60),

                  Wrap(

                    spacing: 20,

                    runSpacing: 20,

                    alignment: WrapAlignment.center,

                    children:  [

                      _FeatureCard(
                        icon: Icons.psychology,
                        title: local.ia,
                      ),

                      _FeatureCard(
                        icon: Icons.sensors,
                        title: local.iot,
                      ),

                      _FeatureCard(
                        icon: Icons.water_drop,
                        title: local.water,
                      ),

                      _FeatureCard(
                        icon: Icons.agriculture,
                        title: local.agri,
                      ),

                      _FeatureCard(
                        icon: Icons.map,
                        title: local.maps,
                      ),

                      _FeatureCard(
                        icon: Icons.cloud,
                        title: local.cloud,
                      ),

                    ],

                  ),

                ],

              ),

            ),

            Container(

              width: double.infinity,

              color: Colors.grey.shade100,

              padding: const EdgeInsets.symmetric(
                vertical: 70,
                horizontal: 20,
              ),

              child: Column(

                children: [

                   Text(

                    local.chiffres,

                    style: TextStyle(

                      fontSize: 30,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 40),

                  Wrap(

                    spacing: 30,

                    runSpacing: 30,

                    alignment: WrapAlignment.center,

                    children:  [

                      _StatCard(
                        value: "50+",
                        title: local.project,
                      ),

                      _StatCard(
                        value: "20+",
                        title: local.partners,
                      ),

                      _StatCard(
                        value: "1000+",
                        title: local.user,
                      ),

                      _StatCard(
                        value: "5",
                        title: local.country,
                      ),

                    ],

                  ),

                ],

              ),

            ),

            Container(

              width: double.infinity,

              color: const Color(0xff0D1B2A),

              padding: const EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 25,
              ),

              child: Column(

                children: [

                  Text(

                   local.heroTitle,

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 32,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 20),

                   Text(

                    local.accueil_txt2,

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize: 18,

                    ),

                  ),

                  const SizedBox(height: 35),

                  /*FilledButton(

                    style: FilledButton.styleFrom(

                      backgroundColor: Colors.green,

                      padding: const EdgeInsets.symmetric(

                        horizontal: 40,

                        vertical: 18,

                      ),

                    ),

                    onPressed: () {},

                    child: Text(

                      local.contactUs,

                      style: TextStyle(fontSize: 18),

                    ),

                  ),*/

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}

class _FeatureCard extends StatelessWidget {

  final IconData icon;
  final String title;

  const _FeatureCard({

    required this.icon,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    final app = AppLocalizations.of(context)!;

    final provider = Provider.of<LocaleProvider>(context);
    return Container(

      width: 220,

      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.08),

            blurRadius: 10,

          ),

        ],

      ),

      child: Column(

        children: [

          Icon(
            icon,
            size: 55,
            color: Colors.green,
          ),

          const SizedBox(height: 15),

          Text(

            title,

            textAlign: TextAlign.center,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

              fontSize: 18,

            ),

          ),

        ],

      ),

    );

  }

}

class _StatCard extends StatelessWidget {

  final String value;
  final String title;

  const _StatCard({

    required this.value,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 220,

      padding: const EdgeInsets.all(30),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color: Colors.black.withOpacity(.08),

            blurRadius: 10,

          ),

        ],

      ),

      child: Column(

        children: [

          Text(

            value,

            style: const TextStyle(

              fontSize: 38,

              fontWeight: FontWeight.bold,

              color: Colors.green,

            ),

          ),

          const SizedBox(height: 10),

          Text(

            title,

            style: const TextStyle(
              fontSize: 18,
            ),

          ),

        ],

      ),

    );

  }

}