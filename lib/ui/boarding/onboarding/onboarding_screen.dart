import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jahitkeeun/const/color.dart';
import 'package:jahitkeeun/reusable/customfilledbutton.dart';
import 'package:jahitkeeun/ui/boarding/onboarding/onboarding_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      init: OnboardingController(),
      builder: (controller) {
        return Scaffold(
          body: Stack(
            children: [
              CarouselSlider(
                items: controller.image,
                options: CarouselOptions(
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    height: Get.height,
                    onPageChanged: (index, reason) => controller.currentIndex),
                carouselController: controller.carouselController,
              ),
              Positioned(
                bottom: 10,
                child: Column(
                  children: [
                    Obx(()=>Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentIndex == 0 ?  mainColor : lightColor),
                        ),
                        Container(
                          width: 12,
                          height: 12,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentIndex == 1 ? mainColor : lightColor),
                        ),
                        Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.currentIndex == 2 ? mainColor : lightColor,
                            )),
                      ],
                    )),

                    CustomFilledButton(
                      width: Get.width,
                      height: 50,
                      title: 'lanjut',
                      color: mainColor,
                      onPressed: () {
                        controller.currentIndex++;
                        print(controller.currentIndex);
                        controller.currentIndex != 3
                            ? controller.carouselController.nextPage()
                            : Get.offAllNamed('/login');
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      }
    );;
  }
}
