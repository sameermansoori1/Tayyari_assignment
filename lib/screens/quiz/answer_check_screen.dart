import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tayyari_assignment/screens/quiz/result_screen.dart';

import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/quiz_paper/quiz_controller.dart';
import '../../widgets/common/content_area.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/main_button.dart';
import '../../widgets/common/screen_background_decoration.dart';
import '../../widgets/quiz/answer_card.dart';

class AnswersCheckScreen extends GetView<QuizController> {
  const AnswersCheckScreen({Key? key}) : super(key: key);

  static const String routeName = '/answercheck';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
          'Question ${(controller.questionIndex.value + 1).toString().padLeft(2, '')}',
          style: kQuizeTS,
        )),
        showActionIcon: true,
        onMenuActionTap: () {
          Get.toNamed(Resultcreen.routeName);
        },
      ),
      body: BackgroundDecoration(
        child: Obx(
          () => Column(
            children: [
              Expanded(
                child: ContentArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Q${(controller.questionIndex.value + 1).toString().padLeft(2, '')}:',
                                style: kQuizeTS.copyWith(fontSize: 24,color: Colors.black.withOpacity(0.8)),
                              ),
                              TextSpan(
                                text: ' ${controller.currentQuestion.value!.question}',
                                style: kQuizeTS.copyWith(color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                        GetBuilder<QuizController>(
                            id: 'answers_review_list',
                            builder: (context) {
                              return ListView.separated(
                                itemCount: controller
                                    .currentQuestion.value!.answers.length,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(top: 25),
                                physics: const NeverScrollableScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return const SizedBox(
                                    height: 10,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  final answer = controller
                                      .currentQuestion.value!.answers[index];
                                  final selectedAnswer = controller
                                      .currentQuestion.value!.selectedAnswer;
                                  final correctAnswer = controller
                                      .currentQuestion.value!.correctAnswer;

                                  final String answerText =
                                      '${answer.identifier}. ${answer.answer}';

                                  if (correctAnswer == selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return CorrectAnswerCard(
                                        answer: answerText);
                                  } else if (selectedAnswer == null) {
                                    return NotAnswerCard(answer: answerText);
                                  } else if (correctAnswer != selectedAnswer &&
                                      answer.identifier == selectedAnswer) {
                                    return WrongAnswerCard(answer: answerText);
                                  } else if (correctAnswer ==
                                      answer.identifier) {
                                    return CorrectAnswerCard(
                                        answer: answerText);
                                  }

                                  return AnswerCard(
                                    isSelected: false,
                                    onTap: () {},
                                    answer: answerText,
                                  );
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                ),
              ),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.screenPadding,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 55,
                        width: 55,
                        child: MainButton(
                          color: Colors.blue,
                          onTap: () {
                            controller.prevQuestion();
                          },
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: MainButton(
                          color: Colors.blue,
                          onTap: () {

                            controller.nextQuestion();
                          },
                          title: 'Next',
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
