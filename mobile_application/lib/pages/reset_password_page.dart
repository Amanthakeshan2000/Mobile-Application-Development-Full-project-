import 'package:flutter/material.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  bool _isResetting = false;
  bool _passwordsMatch = true;

  void _resetPassword() {
    setState(() {
      _isResetting = true;
    });

    //password reset process
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isResetting = false;
        // Show a success message
      });
    });
  }

  void _validatePasswords() {
    setState(() {
      _passwordsMatch =
          _newPasswordController.text == _confirmPasswordController.text;
    });
  }

void _showResetSuccessDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          height: 441, // 
          width: 400, // Width
          child: AlertDialog(
            title: Text(
              'Successful',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromRGBO(1, 198, 43, 1),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min, // Allow the dialog to shrink to fit its content
              children: [
                Image.asset(
                  'assets/tick2.jpeg', 
                  width: 180, //width
                  height: 150, //height
                ),
                SizedBox(height: 16.0),
                Text('Your password is successfully changed!',
                textAlign: TextAlign.center,),
              ],
            ),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(325, 50),  
                ),
                child: Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/resetpassword1.png',fit: BoxFit.cover, height: 250),
              SizedBox(height: 16.0),
              Text('Use at least 8 characters strong password', textAlign: TextAlign.center ,style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 16.0),
              Text('skillupnsbm@nsbm.ac.lk', style: TextStyle(fontSize: 15)),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _passwordsMatch ? Colors.blue : Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                 child: TextField(
                   controller: _newPasswordController,
                  obscureText: true,
                   decoration: InputDecoration(
                     labelText: '     Enter new Password',
                     border: InputBorder.none,
                   ),
                 ),

              ),
              SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _passwordsMatch ? Colors.blue : Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  onChanged: (value) => _validatePasswords(),
                  decoration: InputDecoration(
                    labelText: '     Re enter password',
                    errorText:
                        _passwordsMatch ? null : 'Passwords do not match',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 180.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                minimumSize: Size(350, 50), 
                ),
                onPressed:
                    _isResetting || !_passwordsMatch ? null : _resetPassword,
                child: _isResetting
                    ? CircularProgressIndicator()
                    : Text('Continue', style: TextStyle(fontSize: 23),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

