import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../l10n/app_localizations.dart';
import '../../provider/locale_provider.dart';

class BackgroundSlider extends StatefulWidget {

  final List<String> images;

  final Widget child;

  const BackgroundSlider({
    super.key,
    required this.images,
    required this.child,
  });

  @override
  State<BackgroundSlider> createState() => _BackgroundSliderState();
}

class _BackgroundSliderState extends State<BackgroundSlider> {

  final PageController controller = PageController();

  int currentPage = 0;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 4), (_) {

      currentPage++;

      if (currentPage >= widget.images.length) {
        currentPage = 0;
      }

      if (controller.hasClients) {
        controller.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
      }
    });
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

    return Stack(

      children: [

        PageView.builder(

          controller: controller,

          physics: const NeverScrollableScrollPhysics(),

          itemCount: widget.images.length,

          itemBuilder: (context,index){

            return Stack(

              fit: StackFit.expand,

              children: [

                Image.asset(
                  widget.images[index],
                  fit: BoxFit.cover,
                ),

                Container(
                  color: Colors.black.withOpacity(.45),
                ),

              ],

            );

          },

        ),

        widget.child,

      ],

    );

  }

}