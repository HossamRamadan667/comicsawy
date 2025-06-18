import 'package:comicsawy/src/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadButton extends StatelessWidget {
  const UploadButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(double.infinity, 50.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Upload', style: TextStyles.font20Gray),
            // on idel
            Icon(Icons.upload),
            // on loading
            // SizedBox(
            //     width: 15,
            //     height: 15,
            //     child: CircularProgressIndicator(
            //       strokeWidth: 2,
            //     )),
            // on success
            // Icon(Icons.download_done_rounded)
          ],
        ));
  }
}
