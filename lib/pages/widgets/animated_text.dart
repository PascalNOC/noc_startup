import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';

class AnimatedTextWidget extends StatefulWidget {

  final String title;

  final String subtitle;

  //final String buttonText;

  //final VoidCallback onPressed;

  const AnimatedTextWidget({

    super.key,

    required this.title,

    required this.subtitle,

    //required this.buttonText,

    //required this.onPressed,

  });

  @override
  State<AnimatedTextWidget> createState() => _AnimatedTextWidgetState();
}

class _AnimatedTextWidgetState extends State<AnimatedTextWidget>
    with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  late Animation<double> opacity;

  late Animation<Offset> slide;

  @override
  void initState() {

    super.initState();

    animationController = AnimationController(

      vsync: this,

      duration: const Duration(milliseconds: 1200),

    );

    opacity = Tween<double>(

      begin: 0,

      end: 1,

    ).animate(animationController);

    slide = Tween<Offset>(

      begin: const Offset(0, .25),

      end: Offset.zero,

    ).animate(

      CurvedAnimation(

        parent: animationController,

        curve: Curves.easeOut,

      ),

    );

    animationController.forward();
  }

  @override
  void dispose() {

    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final app = AppLocalizations.of(context)!;

    final provider = Provider.of<LocaleProvider>(context);

    return Center(

      child: FadeTransition(

        opacity: opacity,

        child: SlideTransition(

          position: slide,

          child: Container(

            constraints: const BoxConstraints(maxWidth: 900),

            padding: const EdgeInsets.all(30),

            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Text(

                  widget.title,

                  textAlign: TextAlign.center,

                  style: const TextStyle(

                    color: Colors.white,

                    fontWeight: FontWeight.bold,

                    fontSize: 46,

                  ),

                ),

                const SizedBox(height: 25),

                Text(

                  widget.subtitle,

                  textAlign: TextAlign.center,

                  style: const TextStyle(

                    color: Colors.white,

                    height: 1.6,

                    fontSize: 22,

                  ),

                ),

                const SizedBox(height: 40),

                /*FilledButton(

                  style: FilledButton.styleFrom(

                    backgroundColor: Colors.green,

                    padding: const EdgeInsets.symmetric(

                      horizontal: 40,
                      vertical: 20,
                    ),

                  ),

                  /*onPressed: widget.onPressed,

                  child: Text(
                    widget.buttonText,
                    style: const TextStyle(fontSize: 18),
                  ),*/

                )*/

              ],

            ),

          ),

        ),

      ),

    );

  }

}