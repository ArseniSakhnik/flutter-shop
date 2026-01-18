import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/features/authentication/controllers_onboarding/onboarding_controller.dart';
import 'package:untitled/utils/constants/image_strings.dart';
import 'package:untitled/utils/constants/text_strings.dart';
import 'package:untitled/utils/device/device_utility.dart';
import 'package:untitled/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}