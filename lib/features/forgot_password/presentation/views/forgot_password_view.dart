
import 'package:flutter/material.dart';
import 'package:snap_and_shape/features/verify_otp/presentation/views/verify_otp.dart';

import '../../../../core/widgets/auth_content.dart';
import '../../../sign_in/presentation/views/sign_in_view.dart';

class ForgotPasswordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthContent(
      title: 'Forgot Password',
      image: 'assets/images/WhatsApp_Image_2024-09-26_at_3.39.30_PM-removebg-preview.png',
      fields: ['Enter your email address'],
      buttonText: 'Submit',
      onButtonPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyOTP()));
      },
      bottomText: 'Get back to ',
      bottomButtonText: 'Sign In',
      onBottomButtonPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignInView()));
      },
    );
  }
}
