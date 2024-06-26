
import 'package:easy_separator/easy_separator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../configs/themes/app_icons_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/quiz_paper/quiz_papers_controller.dart';
import '../../models/quiz_paper_model.dart';
import '../../screens/leaderboard/leaderboard_screen.dart';
import '../common/icon_with_text.dart';

class QuizPaperCard extends GetView<QuizPaperController> {
  const QuizPaperCard({Key? key, required this.model}) : super(key: key);

  final QuizPaperModel model;

  @override
  Widget build(BuildContext context) {
    const double _padding = 10.0;
    return Ink(
      decoration: BoxDecoration(
        borderRadius: UIParameters.cardBorderRadius,
        color: Colors.white,
      ),
      child: InkWell(
        borderRadius: UIParameters.cardBorderRadius,
        onTap: () {
          controller.navigatoQuestions(
            paper: model
          );
        },
        child: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: UIParameters.cardBorderRadius,
                      child: ColoredBox(
                          color:
                             Colors.blue.withOpacity(0.1),
                          child: SizedBox(
                            width: 65,
                            height: 65,
                            child: model.imageUrl == null ||  model.imageUrl!.isEmpty ? null : Image.network(model.imageUrl!),
                          )),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.title,
                          style: cardTitleTs(context),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(model.description,style: TextStyle(color: Colors.black.withOpacity(0.8)),),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: EasySeparatedRow(
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 15);
                            },
                            children: [
                              IconWithText(
                                  icon: Icon(Icons.help_outline_sharp,
                                      color: Colors.blue[700]),
                                  text: Text(
                                    '${model.questionsCount} quizzes',
                                    style: kDetailsTS.copyWith(
                                        color: Colors.blue[700]),
                                  )),
                              IconWithText(
                                  icon: const Icon(Icons.timer,
                                      color: Colors.blueGrey),
                                  text: Text(
                                    model.timeInMinits(),
                                    style: kDetailsTS.copyWith(
                                        color: Colors.blueGrey),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ))
                  ],
                ),

              ],
            )),
      ),
    );
  }
}
