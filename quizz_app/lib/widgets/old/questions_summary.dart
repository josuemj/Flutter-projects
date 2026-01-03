import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({
    super.key,
    required this.summaryData,
  });
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((data) {
              var isOk = (data["user_answer"].toString() ==
                  data["correct_answer"].toString());
              return Row(
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Optional: Align Row's children at the top

                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: (isOk) ? Colors.green : Colors.redAccent,
                    ),
                    child: Center(
                      child: Text(
                        ((data["question_index"] as int) + 1).toString(),
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Align children to start

                      children: [
                        Text(
                          data["question"].toString(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          data["user_answer"].toString(),
                        ),
                        Text(
                          data["correct_answer"].toString(),
                        )
                      ],
                    ),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
