import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Verify Account",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 1, 14),
              constraints: BoxConstraints(maxWidth: 320),
              child: Text(
                "Your personal information will help our service reach you easily",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "University Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 44,
                      width: screenWidth * 0.45, // Adjust width as needed
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Student ID",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: 44,
                      width: screenWidth * 0.45, // Adjust width as needed
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Batch",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Id Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 1, 14),
                    constraints: BoxConstraints(maxWidth: 280),
                    child: Text(
                      "Your ID verification will helps us to identify who you are",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 24,
                    width: double.infinity,
                    child: Text(
                      "Front side",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          SizedBox(
                            height: 135,
                            width: 350,
                            child: OutlinedButton(
                              onPressed: () {
                                // Implement logic to upload the front side of the identity card.
                              },
                              child: SizedBox.expand(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.verified,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                        Text(
                                          "Verified",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 24,
                    width: double.infinity,
                    child: Text(
                      "Back side",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          SizedBox(
                            height: 135,
                            width: 350,
                            child: OutlinedButton(
                              onPressed: () {
                                // Implement logic to upload the back side of the identity card.
                              },
                              child: SizedBox.expand(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Back Side",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.verified,
                                          color: Colors.green,
                                          size: 20,
                                        ),
                                        Text(
                                          "Verified",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Implement the verification logic here.
            },
            child: Text("Verify"),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyPage(),
  ));
}
