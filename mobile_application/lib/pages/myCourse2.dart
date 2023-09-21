import 'package:flutter/material.dart';

class MyCourse2 extends StatefulWidget {
  const MyCourse2({Key? key}) : super(key: key);

  @override
  _MyCourse2State createState() => _MyCourse2State();
}

class _MyCourse2State extends State<MyCourse2> {
  int? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Courses',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Lesson 3 | Quiz',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Question 01: Print "Hello World" using Java Language.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
          ),
          // Add the multiple-choice question and answers here
          Column(
            children: [
              buildAnswerTile("a. print(\"Hello World\");", 1),
              buildAnswerTile("b. System.out.println(Hello World);", 2),
              buildAnswerTile("c. System.out.println(\"Hello World\");", 3),
              buildAnswerTile("d. print \"Hello World\";", 4),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildAnswerTile(String answerText, int value) {
    return ListTile(
      title: Text(answerText),
      leading: Radio<int>(
        value: value,
        groupValue: selectedAnswer,
        onChanged: (int? newValue) {
          setState(() {
            selectedAnswer = newValue;
          });
        },
      ),
      tileColor: selectedAnswer == value ? const Color.fromARGB(255, 235, 232, 232) : null,
      selectedTileColor: Colors.black,
    );
  }
}
