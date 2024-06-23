import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _phoneController = TextEditingController();
  List<String> _recentNeeds = ['Need 1', 'Need 2', 'Need 3']; // Example data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Placeholder image
            ),
            SizedBox(height: 16),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    // Handle phone number save
                  },
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  Text('Recent Needs/Asks:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ..._recentNeeds.map((need) => ListTile(title: Text(need))).toList(),
                  SizedBox(height: 16),
                  Text('States:', style: TextStyle(fontWeight: FontWeight.bold)),
                  // Add other states or information here
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
