import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:untitled/utils/constants/image_strings.dart';
import 'package:untitled/utils/constants/sizes.dart';
import 'package:untitled/utils/constants/text_strings.dart';
import 'package:untitled/utils/device/device_utility.dart';
import 'package:untitled/utils/helpers/helper_functions.dart';
import '../../../../../utils/constants/colors.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? TColors.light : TColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
