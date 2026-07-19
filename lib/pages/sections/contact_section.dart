import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';

import 'nocposition.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {

  final nom = TextEditingController();
  final prenom = TextEditingController();
  final email = TextEditingController();
  final telephone = TextEditingController();
  final sujet = TextEditingController();
  final message = TextEditingController();

  bool loading=false;

  @override
  void dispose() {
    nom.dispose();
    prenom.dispose();
    email.dispose();
    telephone.dispose();
    sujet.dispose();
    message.dispose();
    super.dispose();
  }

  Future<void> ouvrirLien(String url) async {

    final Uri uri = Uri.parse(url);

    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception("Impossible d'ouvrir $url");
    }

  }

  Future<void> envoyerMessage() async {

  // Vérification des champs obligatoires
  if (nom.text.isEmpty ||
      prenom.text.isEmpty ||
      email.text.isEmpty ||
      telephone.text.isEmpty ||
      sujet.text.isEmpty ||
      message.text.isEmpty) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Veuillez remplir tous les champs."),
      ),
    );

    return;
  }

  // Vérification de l'email
  if (!RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$')
      .hasMatch(email.text.trim())) {

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Adresse email invalide."),
      ),
    );

    return;
  }

  setState(() {
    loading = true;
  });

  try {

    final uri = Uri.https(
      "script.google.com",
      "/macros/s/AKfycbxN0YeXoNq-e4fXigdeOGU_yKAUN7vKZKJxw4laz8qUl6PfSrP_RwZQg8O-w5ePVod9/exec",
      {
        "nom": nom.text,
        "prenom": prenom.text,
        "email": email.text,
        "telephone": telephone.text,
        "sujet": sujet.text,
        "message": message.text,
      },
    );

    final response = await http.get(uri);

    final data = jsonDecode(response.body);

    if (data["success"] == true) {

      nom.clear();
      prenom.clear();
      email.clear();
      telephone.clear();
      sujet.clear();
      message.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.messagesent,
          ),
        ),
      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(data["message"] ?? "Erreur lors de l'envoi."),
        ),
      );

    }

  } catch (e) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Erreur : $e"),
      ),
    );

  }

  setState(() {
    loading = false;
  });

}

  Widget informationCard(
      IconData icon,
      String titre,
      String valeur,
      ) {

    return Container(

      width: 260,

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(20),

        boxShadow: const [

          BoxShadow(

            color: Colors.black12,

            blurRadius: 8,

          )

        ],

      ),

      child: Column(

        children: [

          Icon(
            icon,
            color: Colors.green,
            size: 45,
          ),

          const SizedBox(height: 15),

          Text(

            titre,

            style: const TextStyle(

              fontWeight: FontWeight.bold,

              fontSize: 20,

            ),

          ),

          const SizedBox(height: 10),

          Text(

            valeur,

            textAlign: TextAlign.center,

          )

        ],

      ),

    );

  }

  Widget champ(TextEditingController c,String label,{int lines=1}){

    return Padding(

      padding: const EdgeInsets.symmetric(vertical:10),

      child: TextField(

        controller: c,

        maxLines: lines,

        decoration: InputDecoration(

          labelText: label,

          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(12),

          ),

        ),

      ),

    );

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
                vertical:70,
                horizontal:20,
              ),

              child:  Column(

                children: [

                  Text(

                    local.contactUs,

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 40,

                    ),

                  ),

                  SizedBox(height:20),

                  Text(

                   local.contactUs_txt,

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

            Wrap(

              spacing:20,

              runSpacing:20,

              alignment: WrapAlignment.center,

              children: [

                informationCard(Icons.phone,local.phone,"+212 646 53 48 69"),

                informationCard(Icons.email,local.email,"entreprisesarl@startup.com"),

                informationCard(Icons.language,local.website,"www.startup.com"),

                informationCard(Icons.location_on,local.address,"Tanger, Morocco, Rue Boukhalef"),

                informationCard(Icons.schedule,local.openingHours,"Lun - Ven\n08h00 - 16h30"),

              ],

            ),

            const SizedBox(height:60),

            Text(

             local.followUs,

              style: TextStyle(

                fontSize:30,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height:25),

            Wrap(
              spacing: 20,
              children: [

                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    size: 40,
                  ),
                  onPressed: () => ouvrirLien(
                    "https://www.facebook.com",
                  ),
                ),

                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                  onPressed: () => ouvrirLien(
                    "https://www.linkedin.com",
                  ),
                ),

                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                    size: 40,
                  ),
                  onPressed: () => ouvrirLien(
                    "https://www.instagram.com",
                  ),
                ),

                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.xTwitter,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () => ouvrirLien(
                    "https://x.com",
                  ),
                ),

                IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.youtube,
                    color: Colors.red,
                    size: 40,
                  ),
                  onPressed: () => ouvrirLien(
                    "https://www.youtube.com",
                  ),
                ),

              ],
            )

            const SizedBox(height:60),

            Container(

              constraints: const BoxConstraints(maxWidth:700),

              padding: const EdgeInsets.all(30),

              child: Column(

                children: [

                  Text(

                    local.sendMessage,

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize:30,

                    ),

                  ),

                  const SizedBox(height:30),

                  champ(nom,local.name),

                  champ(prenom,local.firstName),

                  champ(email,local.email),

                  champ(telephone,local.phone),

                  champ(sujet,local.subject),

                  champ(message,local.message,lines:6),
                  

                  const SizedBox(height:25),
                  

                  loading

                  ? const CircularProgressIndicator()

                  : FilledButton.icon(

                      onPressed: envoyerMessage,

                      icon: const Icon(Icons.send),

                      label: Text(local.sent),

                  )
                ],

              ),

            ),

            const SizedBox(height:50),

            Container(

              width: double.infinity,

              color: Colors.white,

              padding: const EdgeInsets.all(40),

              child: Column(

                children: [

                   Text(

                   local.ourLocation,

                    style: TextStyle(

                      fontSize:30,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height:30),

                  Container(
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child:  MapPage(),
                  )

                ],

              ),

            ),

            const SizedBox(height:60),

          ],

        ),

      ),

    );

  }

}