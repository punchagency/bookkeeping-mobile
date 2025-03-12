import 'package:elmer/config/theme/text_styles.dart';
import 'package:elmer/core/routes/route.dart';
import 'package:elmer/core/utils/colors.dart';
import 'package:elmer/core/utils/extension.dart';
import 'package:elmer/features/onboarding/presentation/view/widget/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndustryCategoryPage extends StatefulWidget {
  const IndustryCategoryPage({super.key});
  @override
  _IndustryCategoryPageState createState() => _IndustryCategoryPageState();
}

class _IndustryCategoryPageState extends State<IndustryCategoryPage> {
  String? selectedCategory;
  final TextEditingController categoryController = TextEditingController();

  final List<String> industryCategories = [
    'Technology',
    'Healthcare',
    'Finance',
    'Education',
    'Retail',
    'Manufacturing',
    'Transportation',
    'Construction',
    'Entertainment',
    'Hospitality',
    'Agriculture',
    'Energy',
    'Telecommunications',
    'Media',
    'Real Estate',
    'Pharmaceuticals',
    'Automotive',
    'Aerospace',
    'Food & Beverage',
    'Other'
  ];

  void _showDropdownMenu(BuildContext context) {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final Offset offset = renderBox.localToGlobal(Offset.zero);

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        offset.dx,
        offset.dy + renderBox.size.height,
        offset.dx + renderBox.size.width,
        offset.dy + renderBox.size.height + 200,
      ),
      items: industryCategories.map((String category) {
        return PopupMenuItem<String>(
          value: category,
          child: Text(
            category,
            style: AppTextStyle.b1.copyWith(
              color: AppColors.appBKWhite150,
            ),
          ),
        );
      }).toList(),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedCategory = value;
          categoryController.text = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.menu,
                  color: AppColors.elmerGreen,
                  size: 40.sp,
                ),
              ),
              200.toColumnSpace(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3➝',
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
                          'Industry Category',
                          style: AppTextStyle.l3.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryText,
                          ),
                        ),
                        10.toRowSpace(),
                        Text(
                          'Description (optional)',
                          style: AppTextStyle.b2.copyWith(
                            fontWeight: FontWeight.w200,
                            fontStyle: FontStyle.italic,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        10.toColumnSpace(),
                        SizedBox(height: 8.h),
                        TextFormField(
                          controller: categoryController,
                          decoration: InputDecoration(
                            hintText: 'Type or select an option',
                            hintStyle: AppTextStyle.l3.copyWith(
                              fontWeight: FontWeight.w300,
                              color: AppColors.hintText,
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.inputBorder,
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.inputBorder,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 30.sp,
                                color: AppColors.elmerGreen,
                              ),
                              onPressed: () => _showDropdownMenu(context),
                            ),
                          ),
                          style: AppTextStyle.l3.copyWith(
                            fontWeight: FontWeight.w300,
                            color: AppColors.primaryText,
                          ),
                        ),
                        10.toColumnSpace(),
                        Row(
                          children: [
                            Text(
                              'Edit choices',
                              style: AppTextStyle.l3.copyWith(
                                fontWeight: FontWeight.w300,
                                decoration: TextDecoration.underline,
                                color: AppColors.elmerGreen,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '${industryCategories.length} option in list',
                              style: AppTextStyle.l4.copyWith(
                                fontWeight: FontWeight.w200,
                                color: AppColors.elmerGreen,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              100.toColumnSpace(),
              Align(
                alignment: Alignment.center,
                child: CustomButton(
                  text: 'Next',
                  onTap: () {
                    Navigator.pushNamed(
                        context, AppRoutes.mobileBusinessStructure);
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
