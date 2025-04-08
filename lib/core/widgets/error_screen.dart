
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/text_styles.dart';

handelErrorScreen(BuildContext context) {
  return ErrorWidget.builder = ((details) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "An error occurred",
                  style: TextStyles.bold20,
                ),
                if (kDebugMode) Text(details.stack.toString()),
              ],
            ),
          ),
        ),
      ),
    );
  });
}
