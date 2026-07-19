import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';

class PartenairesSection extends StatefulWidget {
  const PartenairesSection({super.key});

  @override
  State<PartenairesSection> createState() => _PartenairesSectionState();
}

class _PartenairesSectionState extends State<PartenairesSection> {

  final PageController controller = PageController();

  int currentPage = 0;

  Timer? timer;

  final List<String> logos = [

    "assets/images/partenaires/smartagriculture.jfif",
    "assets/images/partenaires/elevage.jfif",
    "assets/images/partenaires/connectyshop.jfif",
    "assets/images/partenaires/smartcities.jfif",
    "assets/images/partenaires/hotel.jfif",

  ];

  @override
  void initState() {

    super.initState();

    timer = Timer.periodic(

      const Duration(seconds: 3),

      (timer) {

        currentPage++;

        if(currentPage>=logos.length){
          currentPage=0;
        }

        if(controller.hasClients){

          controller.animateToPage(

            currentPage,

            duration: const Duration(milliseconds: 700),

            curve: Curves.easeInOut,

          );

        }

      },

    );

  }

  @override
  void dispose() {

    timer?.cancel();

    controller.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    

    final provider = Provider.of<LocaleProvider>(context);
    final local = AppLocalizations.of(context)!;

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      body: SingleChildScrollView(

        child: Column(

          children: [

            Container(

              width: double.infinity,

              color: const Color(0xff0D1B2A),

              padding: const EdgeInsets.symmetric(
                vertical: 70,
                horizontal: 30,
              ),

              child:  Column(

                children: [

                  Text(

                    local.partners,

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 42,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  SizedBox(height:20),

                  Text(

                    local.partners_txt,

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize:18,

                      height:1.6,

                    ),

                  ),

                ],

              ),

            ),

            const SizedBox(height:50),

            SizedBox(

              height:170,

              child: PageView.builder(

                controller: controller,

                itemCount: logos.length,

                itemBuilder:(context,index){

                  return Padding(

                    padding: const EdgeInsets.all(20),

                    child: Image.asset(logos[index]),

                  );

                },

              ),

            ),

            const SizedBox(height:50),

            Wrap(

              spacing:25,

              runSpacing:25,

              alignment: WrapAlignment.center,

              children:  [

                PartnerCard(
                  image:"assets/images/partenaires/smartagriculture.jfif",
                  title: local.agricultor,
                  subtitle: local.agricultordescript,
                ),

                PartnerCard(
                  image:"assets/images/partenaires/elevage.jfif",
                  title:local.eleveurs,
                  subtitle: local.eleveursdescript,
                ),

                PartnerCard(
                  image:"assets/images/partenaires/connectyshop.jfif",
                  title:local.boutiques,
                  subtitle:local.boutiquesdescript,
                ),

                PartnerCard(
                  image:"assets/images/partenaires/smartcities.jfif",
                  title: local.smartcities,
                  subtitle: local.smartcitiesdescript,
                ),

                PartnerCard(
                  image:"assets/images/partenaires/hotel.jfif",
                  title:local.grandspace,
                  subtitle: local.grandespacedescript,
                ),

                PartnerCard(
                  image:"assets/images/partenaires/population.jfif",
                  title:local.populationServices,
                  subtitle: local.populationServicesdescript,
                ),

                PartnerCard(
                  image:"assets/images/partenaires/gouv.jfif",
                  title:local.gov,
                  subtitle: local.govdescription,
                ),


              ],

            ),

            const SizedBox(height:70),

            Container(

              width: double.infinity,

              color: Colors.white,

              padding: const EdgeInsets.symmetric(
                vertical:60,
                horizontal:20,
              ),

              child: Wrap(

                spacing:25,

                runSpacing:25,

                alignment: WrapAlignment.center,

                children:  [

                  NumberCard(number:"35+",label:local.partners),

                  NumberCard(number:"18",label:local.country),

                  NumberCard(number:"120+",label:local.ourProjects),

                  NumberCard(number:"10",label:local.year),

                ],

              ),

            ),

            Container(

              width: double.infinity,

              color: const Color(0xff0D1B2A),

              padding: const EdgeInsets.symmetric(
                vertical:80,
                horizontal:25,
              ),

              child: Column(

                children: [

                   Text(

                    local.becomePartner,

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize:34,

                    ),

                  ),

                  const SizedBox(height:25),

                   Text(
                    local.partnersdescript,

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize:18,

                      height:1.6,

                    ),

                  ),

                  const SizedBox(height:40),

                  FilledButton(

                    style: FilledButton.styleFrom(

                      backgroundColor: Colors.green,

                      padding: const EdgeInsets.symmetric(

                        horizontal:40,
                        vertical:18,

                      ),

                    ),

                    onPressed:(){},

                    child: Text(

                      local.rejoindre,

                      style: TextStyle(fontSize:18),

                    ),

                  )

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}

class PartnerCard extends StatelessWidget{

  final String image;
  final String title;
  final String subtitle;

  const PartnerCard({

    super.key,

    required this.image,
    required this.title,
    required this.subtitle,

  });

  @override
  Widget build(BuildContext context){

    return Container(

      width:280,

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [

          BoxShadow(
            color: Colors.black12,
            blurRadius:10,
          )

        ],

      ),

      child: Padding(

        padding: const EdgeInsets.all(25),

        child: Column(

          children: [

            Image.asset(
              image,
              height:90,
            ),

            const SizedBox(height:20),

            Text(

              title,

              style: const TextStyle(

                fontWeight: FontWeight.bold,

                fontSize:22,

              ),

            ),

            const SizedBox(height:10),

            Text(

              subtitle,

              textAlign: TextAlign.center,

            ),

          ],

        ),

      ),

    );

  }

}

class NumberCard extends StatelessWidget{

  final String number;
  final String label;

  const NumberCard({

    super.key,

    required this.number,
    required this.label,

  });

  @override
  Widget build(BuildContext context){

    return Container(

      width:220,

      padding: const EdgeInsets.all(30),

      decoration: BoxDecoration(

        color: Colors.green.shade50,

        borderRadius: BorderRadius.circular(18),

      ),

      child: Column(

        children: [

          Text(

            number,

            style: const TextStyle(

              fontSize:38,

              fontWeight: FontWeight.bold,

              color: Colors.green,

            ),

          ),

          const SizedBox(height:10),

          Text(

            label,

            style: const TextStyle(fontSize:18),

          )

        ],

      ),

    );

  }

}