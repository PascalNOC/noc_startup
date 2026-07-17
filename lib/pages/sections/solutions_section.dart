import 'package:flutter/material.dart';

class SolutionsSection extends StatelessWidget {
  const SolutionsSection({super.key});

  @override
  Widget build(BuildContext context) {

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

              child: const Column(

                children: [

                  Text(
                    "Nos Solutions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 20),

                  Text(
                    "Nous concevons des solutions innovantes basées sur "
                    "l'intelligence artificielle, les objets connectés, "
                    "la cartographie numérique et les plateformes web.",
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

              children: const [

                SolutionCard(
                  image: "assets/images/ia.jpg",
                  icon: Icons.psychology,
                  title: "Intelligence Artificielle",
                  description:
                      "Développement d'algorithmes de Machine Learning "
                      "et Deep Learning pour l'aide à la décision.",
                ),

                SolutionCard(
                  image: "assets/images/iot.jfif",
                  icon: Icons.sensors,
                  title: "Internet des Objets",
                  description:
                      "Capteurs intelligents, collecte des données "
                      "et surveillance en temps réel.",
                ),

                SolutionCard(
                  image: "assets/images/agriculture.jfif",
                  icon: Icons.agriculture,
                  title: "Agriculture Intelligente",
                  description:
                      "Optimisation de la production agricole grâce "
                      "à l'analyse intelligente des données.",
                ),

                SolutionCard(
                  image: "assets/images/water.jpg",
                  icon: Icons.water_drop,
                  title: "Gestion de l'Eau",
                  description:
                      "Pilotage intelligent de l'irrigation et "
                      "optimisation de la consommation d'eau.",
                ),

                SolutionCard(
                  image: "assets/images/maps.jpg",
                  icon: Icons.map,
                  title: "Cartographie",
                  description:
                      "SIG, cartographie interactive, géolocalisation "
                      "et suivi des ressources.",
                ),

                SolutionCard(
                  image: "assets/images/cloud.jpg",
                  icon: Icons.cloud,
                  title: "Cloud & Plateformes",
                  description:
                      "Applications Web, Flutter, API REST "
                      "et solutions Cloud sécurisées.",
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

                  const Text(

                    "Pourquoi choisir notre startup ?",

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

                    children: const [

                      BenefitCard(
                        icon: Icons.speed,
                        title: "Rapidité",
                      ),

                      BenefitCard(
                        icon: Icons.security,
                        title: "Sécurité",
                      ),

                      BenefitCard(
                        icon: Icons.workspace_premium,
                        title: "Qualité",
                      ),

                      BenefitCard(
                        icon: Icons.support_agent,
                        title: "Support",
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

  const SolutionCard({

    super.key,

    required this.image,
    required this.icon,
    required this.title,
    required this.description,

  });

  @override
  Widget build(BuildContext context) {

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

                  onPressed: () {},

                  icon: const Icon(Icons.arrow_forward),

                  label: const Text("Découvrir"),

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