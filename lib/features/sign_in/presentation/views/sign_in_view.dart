
import 'package:flutter/material.dart';

import '../../../../core/widgets/auth_content.dart';
import '../../../forgot_password/presentation/views/forgot_password_view.dart';
import '../../../sign_up/presentation/views/sign_up_view.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthContent(
      title: 'Sign In',
      image: 'assets/images/WhatsApp_Image_2024-09-26_at_3.39.30_PM-removebg-preview.png',      fields: ['Email', 'Password'],
      buttonText: 'Next',
      onButtonPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordView()));
      },
      bottomText: "Don't have an account? ",
      bottomButtonText: 'Sign Up',
      onBottomButtonPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView()));
      },
      extraButtonText: 'Forgot Password?',
      onExtraButtonPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordView()));
      },
    );
  }
}
