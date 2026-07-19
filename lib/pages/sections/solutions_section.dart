import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:url_launcher/url_launcher.dart';

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';

class SolutionModel {
  final String categorie;
  final String liens;

  SolutionModel({
    required this.categorie,
    required this.liens,
  });

  factory SolutionModel.fromJson(Map<String, dynamic> json) {
    return SolutionModel(
      categorie: json["categorie"],
      liens: json["lien"],
    );
  }
}

Future<List<SolutionModel>> getSolutions(String categorie) async {

  final uri = Uri.https(
    "script.google.com",
    "/macros/s/AKfycbxJXGvpV74jvp9Dr5VrEHpm4TVXk_OVTLJAAlfMv9PsFjyoy1fPMbmIHzFoRv9YwEvy/exec",
    {
      "categorie": categorie,
    },
  );

  final response = await http.get(uri);
  print(response);
  if (response.statusCode != 200) {
    throw Exception("Erreur ${response.statusCode}");
  }

  final List<dynamic> data = jsonDecode(response.body);
  print(data);
  return data
      .map((e) => SolutionModel.fromJson(e))
      .toList();
}



class SolutionsSection extends StatelessWidget {
  const SolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    

    final provider = Provider.of<LocaleProvider>(context);
    final local = AppLocalizations.of(context)!;


    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      body: SingleChildScrollView(

        child: Column(

          children: [

            //=============================
            // HEADER
            //=============================

            Container(

              width: double.infinity,

              padding: const EdgeInsets.symmetric(
                vertical: 70,
                horizontal: 30,
              ),

              color: const Color(0xff0D1B2A),

              child:  Column(

                children: [

                  Text(
                    local.solutions,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    local.solutionstexte,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      height: 1.6,
                    ),
                  )

                ],

              ),

            ),

            const SizedBox(height: 40),

            Wrap(

              spacing: 25,

              runSpacing: 25,

              alignment: WrapAlignment.center,

              children: [

            SolutionCard(
              image: "assets/images/ia.jpg",
              icon: Icons.psychology,
              title: local.ia,
              description: local.iadescript,
              categorie: "ia",
            ),

            SolutionCard(
              image: "assets/images/iot.jfif",
              icon: Icons.sensors,
              title: local.iot,
              description: local.iotdescript,
              categorie: "iot",
            ),

                SolutionCard(
                  image: "assets/images/agriculture.jfif",
                  icon: Icons.agriculture,
                  title: local.agri,
                  description:
                      local.agridescript,
                  categorie: "agri",

                ),

                SolutionCard(
                  image: "assets/images/water.jpg",
                  icon: Icons.water_drop,
                  title: local.water,
                  description:
                      local.waterdescript,
                  categorie: "water",
                ),

                SolutionCard(
                  image: "assets/images/maps.jpg",
                  icon: Icons.map,
                  title: local.maps,
                  description:
                      local.mapsdescript,
                  categorie: "maps",
                ),

                SolutionCard(
                  image: "assets/images/cloud.jpg",
                  icon: Icons.cloud,
                  title: local.cloud,
                  description:
                      local.clouddescript,
                  categorie: "cloud",
                ),

              ],

            ),

            const SizedBox(height: 60),

            Container(

              width: double.infinity,

              color: Colors.white,

              padding: const EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 25,
              ),

              child: Column(

                children: [

                  Text(

                    local.whyChooseUs,

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),

                  ),

                  const SizedBox(height: 40),

                  Wrap(

                    spacing: 20,

                    runSpacing: 20,

                    alignment: WrapAlignment.center,

                    children: [

                      BenefitCard(
                        icon: Icons.speed,
                        title: local.rapidity,
                      ),

                      BenefitCard(
                        icon: Icons.security,
                        title: local.security,
                      ),

                      BenefitCard(
                        icon: Icons.workspace_premium,
                        title: local.quality,
                      ),

                      BenefitCard(
                        icon: Icons.support_agent,
                        title: local.support,
                      ),

                    ],

                  )

                ],

              ),

            ),

            const SizedBox(height: 50)

          ],

        ),

      ),

    );

  }

}

class SolutionCard extends StatelessWidget {

  final String image;
  final IconData icon;
  final String title;
  final String description;
  final String categorie;

  const SolutionCard({

    super.key,

    required this.image,
    required this.icon,
    required this.title,
    required this.description,
    required this.categorie,

  });


Future<void> ouvrirPopup(

    BuildContext context,

    String categorie,

    String titre,

) async {

  final solutions = await getSolutions(categorie);

  showDialog(

    context: context,

    builder: (_) => SolutionDialog(

      title: titre,

      solutions: solutions,

    ),

  );

}

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final local = AppLocalizations.of(context)!;


    return Container(

      width: 360,

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [

          BoxShadow(
            blurRadius: 12,
            color: Colors.black12,
          )

        ],

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          ClipRRect(

            borderRadius: const BorderRadius.only(

              topLeft: Radius.circular(20),

              topRight: Radius.circular(20),

            ),

            child: Image.asset(

              image,

              height: 220,

              width: double.infinity,

              fit: BoxFit.cover,

            ),

          ),

          Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Icon(
                  icon,
                  size: 40,
                  color: Colors.green,
                ),

                const SizedBox(height: 15),

                Text(

                  title,

                  style: const TextStyle(

                    fontWeight: FontWeight.bold,

                    fontSize: 22,

                  ),

                ),

                const SizedBox(height: 15),

                Text(

                  description,

                  style: const TextStyle(

                    height: 1.6,

                    fontSize: 16,

                  ),

                ),

                const SizedBox(height: 25),

                FilledButton.icon(

                onPressed: () {

                    ouvrirPopup(

                      context,

                      categorie,

                      title,

                    );

                },

                  icon: const Icon(Icons.arrow_forward),

                  label:  Text(local.discover),

                )

              ],

            ),

          )

        ],

      ),

    );

  }

}

class BenefitCard extends StatelessWidget {

  final IconData icon;
  final String title;

  const BenefitCard({

    super.key,

    required this.icon,
    required this.title,

  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final local = AppLocalizations.of(context)!;

    return Container(

      width: 220,

      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(

        color: Colors.green.shade50,

        borderRadius: BorderRadius.circular(18),

      ),

      child: Column(

        children: [

          Icon(

            icon,

            size: 55,

            color: Colors.green,

          ),

          const SizedBox(height: 20),

          Text(

            title,

            style: const TextStyle(

              fontSize: 20,

              fontWeight: FontWeight.bold,

            ),

          ),

        ],

      ),

    );

  }

}

class SolutionDialog extends StatelessWidget {

  final String title;
  final List<SolutionModel> solutions;

  const SolutionDialog({

    super.key,

    required this.title,

    required this.solutions,

  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final local = AppLocalizations.of(context)!;
    return AlertDialog(

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      title: Text(title),

      content: SizedBox(

        width: 450,

        child: ListView.builder(

          shrinkWrap: true,

          itemCount: solutions.length,

          itemBuilder: (context,index){
            final item = solutions[index];
            return Card(

              child: ListTile(

                leading: const Icon(
                  Icons.link,
                  color: Colors.green,
                ),

                title: Text(item.liens),

                trailing: IconButton(

                  icon: const Icon(Icons.open_in_new),

                onPressed: () {

                  onPressed: () async {

                      final Uri url = Uri.parse(item.liens);

                      if(await canLaunchUrl(url)){

                          await launchUrl(

                              url,

                              mode: LaunchMode.externalApplication,

                          );

                      }

                  };

                },

                ),

              ),

            );

          },

        ),

      ),

      actions: [

        FilledButton(

          onPressed: (){
            Navigator.pop(context);
          },

          child:  Text(local.close),

        )

      ],

    );

  }

}