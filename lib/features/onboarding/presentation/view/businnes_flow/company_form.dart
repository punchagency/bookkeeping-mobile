import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/button.dart';
import 'package:flutter/material.dart';

class CompanyFormPage extends StatefulWidget {
  const CompanyFormPage({
    Key? key,
  }) : super(key: key);

  @override
  _CompanyFormPageState createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends State<CompanyFormPage> {
  final TextEditingController _companyNameController = TextEditingController();

  @override
  void dispose() {
    _companyNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.elmerGreen,
        title: Text(
          'Elmer',
          style: AppTextStyle.h2.copyWith(
            color: AppColors.appBKWhite150,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '1➝',
                    style: AppTextStyle.l3.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.elmerGreen,
                    ),
                  ),
                  10.toRowSpace(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Company Name",
                          style: AppTextStyle.l2.copyWith(),
                        ),
                        Text(
                          'Description (optional)',
                          style: AppTextStyle.b2.copyWith(
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        20.toColumnSpace(),
                        Text(
                          "First Name",
                          style: AppTextStyle.l2.copyWith(),
                        ),
                        10.toColumnSpace(),
                        TextField(
                          controller: _companyNameController,
                          decoration: const InputDecoration(
                            hintText: 'Jane',
                            border: OutlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ),
                        ),
                        20.toColumnSpace(),
                        Text(
                          "Last Name",
                          style: AppTextStyle.l2.copyWith(),
                        ),
                        10.toColumnSpace(),
                        TextField(
                          controller: _companyNameController,
                          decoration: const InputDecoration(
                            hintText: 'Smith',
                            border: OutlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ),
                        ),
                        20.toColumnSpace(),
                        Text(
                          "Last Name",
                          style: AppTextStyle.l2.copyWith(),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _companyNameController,
                          decoration: const InputDecoration(
                            hintText: 'Enter your company name',
                            border: OutlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ),
                        ),
                        20.toColumnSpace(),
                        Text(
                          "Email",
                          style: AppTextStyle.l2.copyWith(),
                        ),
                        10.toColumnSpace(),
                        TextField(
                          controller: _companyNameController,
                          decoration: const InputDecoration(
                            hintText: 'name@example.com',
                            border: OutlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ),
                        ),
                        20.toColumnSpace(),
                        Text(
                          "Company",
                          style: AppTextStyle.l2.copyWith(),
                        ),
                        10.toColumnSpace(),
                        TextField(
                          controller: _companyNameController,
                          decoration: const InputDecoration(
                            hintText: 'Acme Corpotion',
                            border: OutlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              32.toColumnSpace(),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.mobileCompanyWebsiteForm,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
