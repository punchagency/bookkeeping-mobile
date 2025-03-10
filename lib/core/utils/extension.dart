import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

extension NumberExtension on num {
  SizedBox toColumnSpace() => SizedBox(
        height: toDouble().h,
      );
  SizedBox toRowSpace() => SizedBox(
        width: toDouble().w,
      );
  double toFontSize() => sp;
  String toOrdinal() {
    if (this % 100 == 11 || this % 100 == 12 || this % 100 == 13) {
      return '${this}th';
    }

    switch (this % 10) {
      case 1:
        return '${this}st';
      case 2:
        return '${this}nd';
      case 3:
        return '${this}rd';
      default:
        return '${this}th';
    }
  }
}

extension StringExt on String {}

extension FormatDateTime on DateTime {
  String formatDate([String format = "dd/MM/yyyy"]) =>
      DateFormat(format).format(this);
  String monthDayYear() {
    return DateFormat("MMMM dd, yyyy").format(this);
  }

  String formatDateTime([String format = "MMM dd, yyyy  hh:mma"]) {
    // ignore: unnecessary_this
    String formattedDateTime = DateFormat(format).format(this.toLocal());
    return formattedDateTime;
  }
}

extension FormatedDateTime on DateTime {
  String formattedDate() {
    return DateFormat("EEEE, MMMM d, y, h:mm a").format(this);
  }
}

extension TextEditingControllerExtension on TextEditingController {
  bool get isEmpty => text.isEmpty;
}
