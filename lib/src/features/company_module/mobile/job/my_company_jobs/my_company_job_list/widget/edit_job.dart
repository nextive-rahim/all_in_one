import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/image_constant.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class EditJob extends StatelessWidget {
  const EditJob({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Edir');
        // controller.deleteCompanyJob(job.id!).then((v) {
        //   controller.companyJobList.removeWhere((v) => v.id == v.id);
        // });
      },
      child: Row(
        children: [
          Image.asset(
            ImageConstant.edit,
            color: CommonColor.greenColor1,
          ),
          const SizedBox(width: 5),
          const TextWidget(
            textAlign: TextAlign.start,
            text: AppStrings.edit,
            color: CommonColor.greenColor1,
            maxLine: 1,
            fontFamily: AppStrings.sfProDisplay,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
