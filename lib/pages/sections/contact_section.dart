import 'package:flutter/material.dart';

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

              child: const Column(

                children: [

                  Text(

                    "Nous contacter",

                    style: TextStyle(

                      color: Colors.white,

                      fontWeight: FontWeight.bold,

                      fontSize: 40,

                    ),

                  ),

                  SizedBox(height:20),

                  Text(

                    "Notre équipe est à votre écoute pour répondre à toutes vos questions.",

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

                informationCard(Icons.phone,"Téléphone","+212 646 53 48 69"),

                informationCard(Icons.email,"Email","entreprisesarl@startup.com"),

                informationCard(Icons.language,"Site Web","www.startup.com"),

                informationCard(Icons.location_on,"Adresse","Tanger, Morocco, Rue Boukhalef"),

                informationCard(Icons.schedule,"Horaires","Lun - Ven\n08h00 - 16h30"),

              ],

            ),

            const SizedBox(height:60),

            const Text(

              "Nos réseaux sociaux",

              style: TextStyle(

                fontSize:30,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height:25),

            Wrap(

              spacing:20,

              children: [

                CircleAvatar(radius:30,child:Icon(Icons.facebook)),
                CircleAvatar(radius:30,child:Icon(Icons.business)),
                CircleAvatar(radius:30,child:Icon(Icons.chat)),
                CircleAvatar(radius:30,child:Icon(Icons.video_library)),
                CircleAvatar(radius:30,child:Icon(Icons.message)),

              ],

            ),

            const SizedBox(height:60),

            Container(

              constraints: const BoxConstraints(maxWidth:700),

              padding: const EdgeInsets.all(30),

              child: Column(

                children: [

                  const Text(

                    "Envoyez-nous un message",

                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                      fontSize:30,

                    ),

                  ),

                  const SizedBox(height:30),

                  champ(nom,"Nom"),

                  champ(prenom,"Prénom"),

                  champ(email,"Email"),

                  champ(telephone,"Téléphone"),

                  champ(sujet,"Sujet"),

                  champ(message,"Votre message",lines:6),

                  const SizedBox(height:25),

                  FilledButton.icon(

                    style: FilledButton.styleFrom(

                      minimumSize: const Size(220,55),

                    ),

                    onPressed: (){

                      ScaffoldMessenger.of(context).showSnackBar(

                        const SnackBar(

                          content: Text("Message envoyé."),

                        ),

                      );

                    },

                    icon: const Icon(Icons.send),

                    label: const Text("Envoyer"),

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

                  const Text(

                    "Notre localisation",

                    style: TextStyle(

                      fontSize:30,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height:30),

                  Container(

                    height:350,

                    decoration: BoxDecoration(

                      color: Colors.grey.shade300,

                      borderRadius: BorderRadius.circular(20),

                    ),

                    child: const Center(

                      child: Text(

                        "Google Maps\n(à intégrer)",

                        textAlign: TextAlign.center,

                        style: TextStyle(fontSize:22),

                      ),

                    ),

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