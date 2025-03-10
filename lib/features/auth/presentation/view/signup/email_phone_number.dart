import 'package:elmer/core/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/core/utils/colors.dart';

class EmailPhoneScreen extends StatefulWidget {
  const EmailPhoneScreen({Key? key}) : super(key: key);

  @override
  _EmailPhoneScreenState createState() => _EmailPhoneScreenState();
}

class _EmailPhoneScreenState extends State<EmailPhoneScreen> {
  final TextEditingController _emailPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.elmerGreen,
        centerTitle: true,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailPhoneController,
              decoration: InputDecoration(
                hintText: 'Email / Phone Number',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.email, color: Colors.grey[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.elmerGreen),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.elmerGreen),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: AppColors.elmerGreen),
                ),
              ),
            ),
            100.toColumnSpace(),
            ElevatedButton(
              onPressed: () {
                final emailPhone = _emailPhoneController.text.trim();
                if (emailPhone.isNotEmpty) {
                  Navigator.pushNamed(context, AppRoutes.mobileSignUpOtp);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.elmerGreen,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
