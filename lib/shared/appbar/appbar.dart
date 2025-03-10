import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:elmer/core/utils/colors.dart';

class ElmerAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Color iconcolor;
  final VoidCallback? onpressed;
  final Color? color;

  const ElmerAppBar({
    super.key,
    required this.title,
    this.color,
    this.automaticallyImplyLeading = true,
    this.actions,
    this.onpressed,
    this.iconcolor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Text(title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColors.appBkBlack,
              fontWeight: FontWeight.bold,
              fontSize: 20.sp)),
      // leading: automaticallyImplyLeading
      //     ? IconButton(
      //         icon: SvgPicture.asset(
      //           karrowbackbutton,
      //           height: 30.h,
      //           width: 30.w,
      //           // ignore: deprecated_member_use
      //           color: iconcolor,
      //         ),
      //         onPressed: onpressed ??
      //             () {
      //               if (Navigator.canPop(context)) {
      //                 Navigator.pop(context);
      //               }
      //             },
      //       )
      //     : null,
      // actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
