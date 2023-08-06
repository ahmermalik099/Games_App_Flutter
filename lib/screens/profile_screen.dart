import 'package:flutter/material.dart';

void main() {
  runApp(ProfileApp());
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String email = 'youremail@example.com';
  String phoneNumber = '+123 456 7890';

  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController emailController =
        TextEditingController(text: email);
        TextEditingController phoneController =
        TextEditingController(text: phoneNumber);

        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  email = emailController.text;
                  phoneNumber = phoneController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage('images/game.jpeg'),
              //backgroundImage: NetworkImage('https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/1631895/xbox-controller-clipart-xl.png',),
            ),
            SizedBox(height: 10),
            Text(
              'Your Name',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              'Gamer',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(email),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(phoneNumber),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editProfile,
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
