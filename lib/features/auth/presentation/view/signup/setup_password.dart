import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/features/onboarding/presentation/view/bussiness-personal.dart';
import 'package:flutter/material.dart';
import 'package:elmer/core/utils/extension.dart';

class SetupPasswordScreen extends StatefulWidget {
  static const routeName = '/setup_password';
  const SetupPasswordScreen({Key? key}) : super(key: key);

  @override
  _SetupPasswordScreenState createState() => _SetupPasswordScreenState();
}

class _SetupPasswordScreenState extends State<SetupPasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Setup Password'),
        backgroundColor: AppColors.elmerGreen,
        centerTitle: true,
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
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'New Password',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.elmerGreen,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.elmerGreen,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.elmerGreen,
                  ),
                ),
              ),
              obscureText: !_isPasswordVisible,
            ),
            20.toColumnSpace(),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.lock, color: Colors.grey[600]),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey[600],
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
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
              obscureText: !_isConfirmPasswordVisible,
            ),
            20.toColumnSpace(),
            ElevatedButton(
              onPressed: () {
                final password = _passwordController.text.trim();
                final confirmPassword = _confirmPasswordController.text.trim();

                if (password.isNotEmpty && confirmPassword.isNotEmpty) {
                  if (password == confirmPassword) {
                    Navigator.pushNamed(
                        context, BussinesPersonalPage.routeName);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Passwords do not match. Please try again.'),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please fill in all fields.'),
                    ),
                  );
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
                'Submit',
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
