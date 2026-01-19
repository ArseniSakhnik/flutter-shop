import 'package:flutter/material.dart';
import 'package:untitled/utils/constants/image_strings.dart';
import 'package:untitled/utils/constants/text_strings.dart';
import 'package:untitled/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          width: 200,
          image: AssetImage(
            dark ? TImages.lightAppLogo : TImages.darkAppLogo,
          ),
        ),
        Text(
          TTexts.loginTitle,
          style: Theme
              .of(context)
              .textTheme
              .headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          TTexts.loginSubTitle,
          style: Theme
              .of(context)
              .textTheme
              .bodyMedium,
        ),
      ],
    );
  }
}