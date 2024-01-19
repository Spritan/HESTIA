import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hestia/features/core/controllers/half_map_controller.dart';
import 'package:hestia/features/core/screens/home/widgets/cart.dart';
import 'package:hestia/features/core/screens/home/widgets/home_header_map_with_buttons.dart';
import 'package:hestia/features/personalization/controllers/settings_controller.dart';
import 'package:hestia/utils/constants/images_strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HalfMapController halfMapController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F616B),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 69, 79),
        centerTitle: true,
        title: Text(
          "HESTIA",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 7),
          child: Image(
            image: AssetImage(MyAppImages.appIcon1),
          ),
        ),
      ),
      body: Column(
        children: [
          /// --Half Map Screen with Search, move to SOS, move to Marker Map Button
          HomeHeaderMapWithButtons(halfMapController: halfMapController),

          // --Home Screen Footer
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(
                  height: 8,
                ),

                /// User Name & Greetings
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 26, vertical: 3),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Obx(
                          () => Text(
                            "Hi ${settingsController.instance.name.value}!",
                            style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Here are some stats near you",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 6,
                ),

                /// Analytics
                const Cart(
                  title: "Homeless Sightings",
                  number: 4,
                  rating: 4.5,
                  color: Colors.red,
                ),

                const Cart(
                  title: "Events Organized",
                  number: 6,
                  rating: 4.9,
                  color: Colors.yellow,
                ),

                const Cart(
                  title: "Crime Incidents",
                  number: 2,
                  rating: 3.1,
                  color: Colors.green,
                ),

                const SizedBox(
                  height: 22,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}