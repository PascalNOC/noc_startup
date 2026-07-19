import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';

class InformationsSection extends StatelessWidget {
  const InformationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    

    final provider = Provider.of<LocaleProvider>(context);
    final local = AppLocalizations.of(context)!;

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

              child:  Column(

                children: [

                  Text(

                    local.whosUs,

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 42,

                    ),

                  ),

                  SizedBox(height:20),

                  Text(

                    local.infoinfo,

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

              local.ourHistory,

              local.stories_txt,

            ),

            buildSection(

              Icons.visibility,

              local.ourVision,

              local.ourVision_txt,

            ),

            buildSection(

              Icons.flag,

              local.ourMission,

              local.ourMission_text,

            ),

            buildSection(

              Icons.favorite,

              local.ourValues,

              local.ourValues_text,

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

                   Text(

                    local.ourExpertise,

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

                    children:  [

                      SkillCard(local.ia),

                      SkillCard(local.deepia),

                      SkillCard(local.iot),

                      SkillCard(local.agri),

                      SkillCard(local.maps),

                      SkillCard(local.flutter_app),

                      SkillCard(local.cloud),

                      SkillCard(local.cyber),

                      SkillCard(local.visiocomput),

                      SkillCard(local.bigdata),

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

                   Text(

                    local.ourEv,

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize:32,

                    ),

                  ),

                  const SizedBox(height:40),

                   TimelineCard("2021",local.ourEv1),

                   TimelineCard("2023",local.ourEv2),

                   TimelineCard("2024",local.ourEv3),

                   TimelineCard("2025",local.ourEv4),

                   TimelineCard("2026",local.ourEv5),

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

                   Text(

                    local.whyChooseUs,

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

                    children:  [

                      AdvantageCard(Icons.speed,local.rapidity),

                      AdvantageCard(Icons.workspace_premium,local.quality),

                      AdvantageCard(Icons.security,local.security),

                      AdvantageCard(Icons.support_agent,local.support),

                      AdvantageCard(Icons.groups,local.accompagnement),

                      AdvantageCard(Icons.lightbulb,local.innovation),

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

                   Text(

                    local.fin_txt1,

                    style: TextStyle(

                      color: Colors.white,

                      fontSize:34,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height:25),

                   Text(

                    local.fin_txt2,

                    textAlign: TextAlign.center,

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize:18,

                    ),

                  ),

                  const SizedBox(height:35),

                  /*FilledButton(

                    onPressed: (){},

                    child:  Text(local.fin_txt3),

                  )*/

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