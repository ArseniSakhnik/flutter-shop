import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/common/styles/spacing_styles.dart';
import 'package:untitled/features/authentication/screens/login/widgets/login_form.dart';
import 'package:untitled/features/authentication/screens/login/widgets/login_header.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyle.paddingWthAppBarHeight,
        child: Column(
          children: [
            TLoginHeader(),

            TLoginForm(),

            TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            TSocialButtons(),
          ],
        ),
      ),
    );
  }
}






