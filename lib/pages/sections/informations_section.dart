import 'package:flutter/material.dart';

class InformationsSection extends StatelessWidget {
  const InformationsSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      body: SingleChildScrollView(

        child: Column(

          children: [

            //================ HEADER =====================

            Container(

              width: double.infinity,

              color: const Color(0xff0D1B2A),

              padding: const EdgeInsets.symmetric(
                vertical: 80,
                horizontal: 25,
              ),

              child: const Column(

                children: [

                  Text(

                    "Qui sommes-nous ?",

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 42,

                    ),

                  ),

                  SizedBox(height:20),

                  Text(

                    "Une startup innovante au service de la transformation numérique.",

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize:18,

                      height:1.6,

                    ),

                  )

                ],

              ),

            ),

            const SizedBox(height:50),

            buildSection(

              Icons.history,

              "Notre histoire",

              "NOC est une startup monté en 2021 après sa participation et son incubation au sein du Cluster VALBIOM qui siège à Oujda, "
              "La startup a pour vocation de fournir des solutions innovantes combinant et conciliant ancien et nouveau. Pour son premier projet, il a proposé une solution intérupteur-augmenté avec lequel il remporté la septième place. Aujourd'hui au sein de la startup plursieurs solutions sont en développement dont parmi elles une solution d'aide aux éléveurs de volailles en enceintes fermées."
              "La startup est encore à ces débuts et cherches à se faire connaitre et s'étendre à grande échelle.",

            ),

            buildSection(

              Icons.visibility,

              "Notre vision",

              "Construire un monde où l'ancien et le nouveau se retrouvent pour donner naissance à des solutions innovantes plus écologiques.",

            ),

            buildSection(

              Icons.flag,

              "Notre mission",

              "Concevoir des solutions intelligentes, simples et accessibles répondant aux besoins des entreprises, collectivités et particuliers.",

            ),

            buildSection(

              Icons.favorite,

              "Nos valeurs",

              "Innovation\nQualité\nTransparence\nDurabilité\nCollaboration\nExcellence",

            ),

            const SizedBox(height:50),

            Container(

              width: double.infinity,

              color: Colors.white,

              padding: const EdgeInsets.symmetric(
                vertical:60,
                horizontal:25,
              ),

              child: Column(

                children: [

                  const Text(

                    "Notre expertise",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize:32,

                    ),

                  ),

                  const SizedBox(height:40),

                  Wrap(

                    spacing:20,

                    runSpacing:20,

                    alignment: WrapAlignment.center,

                    children: const [

                      SkillCard("Intelligence Artificielle"),

                      SkillCard("Deep Learning"),

                      SkillCard("IoT"),

                      SkillCard("Agriculture intelligente"),

                      SkillCard("SIG"),

                      SkillCard("Flutter"),

                      SkillCard("Cloud"),

                      SkillCard("Cybersécurité"),

                      SkillCard("Vision par ordinateur"),

                      SkillCard("Big Data"),

                    ],

                  )

                ],

              ),

            ),

            const SizedBox(height:50),

            Container(

              width: double.infinity,

              padding: const EdgeInsets.symmetric(
                horizontal:20,
                vertical:60,
              ),

              child: Column(

                children: [

                  const Text(

                    "Notre évolution",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize:32,

                    ),

                  ),

                  const SizedBox(height:40),

                  const TimelineCard("2021","Création de la startup"),

                  const TimelineCard("2023","Premiers partenaires"),

                  const TimelineCard("2024","Déploiement de nos premières solutions"),

                  const TimelineCard("2025","Expansion internationale"),

                  const TimelineCard("2026","Développement des solutions IA"),

                ],

              ),

            ),

            Container(

              width: double.infinity,

              color: Colors.white,

              padding: const EdgeInsets.symmetric(
                vertical:60,
                horizontal:20,
              ),

              child: Column(

                children: [

                  const Text(

                    "Pourquoi nous choisir ?",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize:32,

                    ),

                  ),

                  const SizedBox(height:40),

                  Wrap(

                    spacing:20,

                    runSpacing:20,

                    alignment: WrapAlignment.center,

                    children: const [

                      AdvantageCard(Icons.speed,"Rapidité"),

                      AdvantageCard(Icons.workspace_premium,"Qualité"),

                      AdvantageCard(Icons.security,"Sécurité"),

                      AdvantageCard(Icons.support_agent,"Support"),

                      AdvantageCard(Icons.groups,"Accompagnement"),

                      AdvantageCard(Icons.lightbulb,"Innovation"),

                    ],

                  )

                ],

              ),

            ),

            Container(

              width: double.infinity,

              color: const Color(0xff0D1B2A),

              padding: const EdgeInsets.symmetric(
                vertical:80,
                horizontal:20,
              ),

              child: Column(

                children: [

                  const Text(

                    "Ensemble pour des solutions écologiques et responsables tournées vers l'avenir",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize:34,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height:25),

                  const Text(

                    "Notre ambition est de mettre la technologie au service de l'innovation durable.",

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize:18,

                    ),

                  ),

                  const SizedBox(height:35),

                  FilledButton(

                    onPressed: (){},

                    child: const Text("Découvrir nos solutions"),

                  )

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

  static Widget buildSection(
      IconData icon,
      String titre,
      String texte,
      ){

    return Padding(

      padding: const EdgeInsets.symmetric(
        horizontal:25,
        vertical:15,
      ),

      child: Card(

        elevation:3,

        child: Padding(

          padding: const EdgeInsets.all(30),

          child: Row(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Icon(
                icon,
                size:50,
                color: Colors.green,
              ),

              const SizedBox(width:25),

              Expanded(

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(

                      titre,

                      style: const TextStyle(

                        fontWeight: FontWeight.bold,

                        fontSize:26,

                      ),

                    ),

                    const SizedBox(height:15),

                    Text(

                      texte,

                      style: const TextStyle(

                        fontSize:17,

                        height:1.7,

                      ),

                    )

                  ],

                ),

              )

            ],

          ),

        ),

      ),

    );

  }

}

class SkillCard extends StatelessWidget{

  final String title;

  const SkillCard(this.title,{super.key});

  @override
  Widget build(BuildContext context){

    return Chip(

      label: Padding(

        padding: const EdgeInsets.all(8),

        child: Text(title),

      ),

      avatar: const Icon(Icons.check_circle,color:Colors.green),

    );

  }

}

class TimelineCard extends StatelessWidget{

  final String year;
  final String text;

  const TimelineCard(this.year,this.text,{super.key});

  @override
  Widget build(BuildContext context){

    return ListTile(

      leading: CircleAvatar(

        backgroundColor: Colors.green,

        child: Text(year.substring(2)),

      ),

      title: Text(year),

      subtitle: Text(text),

    );

  }

}

class AdvantageCard extends StatelessWidget{

  final IconData icon;
  final String title;

  const AdvantageCard(this.icon,this.title,{super.key});

  @override
  Widget build(BuildContext context){

    return Container(

      width:220,

      padding: const EdgeInsets.all(25),

      decoration: BoxDecoration(

        color: Colors.green.shade50,

        borderRadius: BorderRadius.circular(18),

      ),

      child: Column(

        children: [

          Icon(icon,size:55,color:Colors.green),

          const SizedBox(height:15),

          Text(

            title,

            style: const TextStyle(

              fontSize:20,

              fontWeight: FontWeight.bold,

            ),

          )

        ],

      ),

    );

  }

}