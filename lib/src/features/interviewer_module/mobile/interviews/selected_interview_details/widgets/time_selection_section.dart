import 'package:all_in_one/src/core/extension/string_extension.dart';
import 'package:all_in_one/src/core/utils/colors.dart';
import 'package:all_in_one/src/core/utils/size_config.dart';
import 'package:all_in_one/src/core/utils/strings.dart';
import 'package:all_in_one/src/core/widgets/text_widget.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/all_interviews/model/all_interviews_model.dart';
import 'package:all_in_one/src/features/interviewer_module/mobile/interviews/selected_interview_details/widgets/interview_confirmation_button.dart';
import 'package:flutter/material.dart';

class InterviewTimeSelectedSection extends StatefulWidget {
  const InterviewTimeSelectedSection({
    super.key,
    required this.interview,
  });
  final ViewInterviewResponseData interview;
  @override
  State<InterviewTimeSelectedSection> createState() =>
      _InterviewTimeSelectedSectionState();
}

class _InterviewTimeSelectedSectionState
    extends State<InterviewTimeSelectedSection> {
  final ValueNotifier<String> selectedTime = ValueNotifier<String>('');
  final ValueNotifier<bool> selectSlotA = ValueNotifier<bool>(false);
  final ValueNotifier<bool> selectSlotB = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: CommonColor.blackColor,
      child: ValueListenableBuilder<bool>(
        valueListenable: selectSlotA,
        builder: (BuildContext context, bool timeSlotA, child) {
          return ValueListenableBuilder<bool>(
            valueListenable: selectSlotB,
            builder: (BuildContext context, bool timeSlotB, child) {
              return SizedBox(
                height: timeSlotA || timeSlotB ? 250 : 195,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Your introductory test is scheduled on ',
                              style: TextStyle(
                                color: CommonColor.blackColor1,
                                fontSize: 20,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: getFormattedDate(
                                  widget.interview.date), //'16th May 2023',
                              style: const TextStyle(
                                color: CommonColor.blackColor1,
                                fontSize: 20,
                                fontFamily: AppStrings.sfProDisplay,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const TextWidget(
                        text: AppStrings.acceptYourAvailableTimeslot,
                        color: CommonColor.blackColor2,
                        maxLine: 1,
                        fontFamily: AppStrings.sfProDisplay,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                selectSlotA.value = !selectSlotA.value;
                                if (selectSlotB.value) {
                                  selectSlotB.value = false;
                                }
                                //Navigator.pop(context, true);
                                selectedTime.value =
                                    widget.interview.timeSlotA!;
                              },
                              child: Container(
                                width: SizeConfig.screenWidth,
                                height: 60,
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: selectSlotA.value
                                      ? CommonColor.blueColor1
                                      : CommonColor.whiteColor,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50,
                                        color: selectSlotA.value
                                            ? CommonColor.blueColor1
                                            : CommonColor.greyColor5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: CommonColor.blackColor3,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: TextWidget(
                                  text: widget.interview.timeSlotA ?? '',
                                  color: selectSlotA.value
                                      ? CommonColor.whiteColor
                                      : CommonColor.blackColor4,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                selectSlotB.value = !selectSlotB.value;
                                if (selectSlotA.value) {
                                  selectSlotA.value = false;
                                }
                                selectedTime.value =
                                    widget.interview.timeSlotB!;
                              },
                              child: Container(
                                width: SizeConfig.screenWidth,
                                height: 60,
                                alignment: Alignment.center,
                                clipBehavior: Clip.antiAlias,
                                decoration: ShapeDecoration(
                                  color: selectSlotB.value
                                      ? CommonColor.blueColor1
                                      : Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 0.50,
                                        color: selectSlotB.value
                                            ? CommonColor.blueColor1
                                            : CommonColor.greyColor5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: CommonColor.blackColor3,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: TextWidget(
                                  text:
                                      widget.interview.timeSlotB!, //"10:00 AM",
                                  color: selectSlotB.value
                                      ? CommonColor.whiteColor
                                      : CommonColor.blackColor4,
                                  maxLine: 1,
                                  fontFamily: AppStrings.inter,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Visibility(
                        visible: (selectSlotA.value || selectSlotB.value),
                        child: InterviewConfarmationButton(
                          selectedDate:
                              getFormattedDate(widget.interview.date) ?? '',
                          selectedTime: selectedTime.value,
                          interview: widget.interview,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
