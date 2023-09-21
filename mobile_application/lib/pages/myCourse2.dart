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
      body: SingleChildScrollView(
        child: Column(
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
            Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set the ash color here
                borderRadius: BorderRadius.circular(12.0), // Set border radius
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Question 01: Print "Hello World" using Java Language.',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  // Add the multiple-choice question and answers here
                  buildAnswerTile("a. print(\"Hello World\");", 1),
                  buildAnswerTile("b. System.out.println(Hello World);", 2),
                  buildAnswerTile("c. System.out.println(\"Hello World\");", 3),
                  buildAnswerTile("d. print \"Hello World\";", 4),
                ],
              ),
            ),
            // Add the additional containers with texts and dropdown icons
            buildAdditionalContainer("Answer"),
            buildAdditionalContainer("Sample Code"),
            buildAdditionalContainer("Explanation"),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add 8 pixels horizontal padding
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
            children: [
              Container(
                margin: const EdgeInsets.only(right: 5.0), // Add 5 pixels margin between buttons
                child: ElevatedButton(
                  onPressed: () {
                    // Clear button action
                    setState(() {
                      selectedAnswer = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 165, 152, 151), // Customize button color
                    minimumSize: const Size(120, 40), // Set button size
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0), // Adjust horizontal padding
                    child: Text("Clear", style: TextStyle(fontSize: 16.0)), // Adjust button text size
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.0), // Add 5 pixels margin between buttons
                child: ElevatedButton(
                  onPressed: () {
                    // Submit button action
                    if (selectedAnswer != null) {
                      // Handle the submission logic here
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(120, 40), // Set button size
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0), // Adjust horizontal padding
                    child: Text("Submit", style: TextStyle(fontSize: 16.0)), // Adjust button text size
                  ),
                ),
              ),
            ],
          ),
        ),
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

  Widget buildAdditionalContainer(String labelText) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[300], // Set the ash color here
        borderRadius: BorderRadius.circular(12.0), // Set border radius
      ),
      child: Row(
        children: [
          Text(
            labelText,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          const Spacer(),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
