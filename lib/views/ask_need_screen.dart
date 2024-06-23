import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/src/flutter_datetime_picker.dart';

class AskNeedScreen extends StatefulWidget {
  @override
  _AskNeedScreenState createState() => _AskNeedScreenState();
}

class _AskNeedScreenState extends State<AskNeedScreen> {
  String? _selectedNeed;
  bool _isPublic = false;
  List<String> _businesses = ['Business 1', 'Business 2', 'Business 3'];
  List<String> _selectedBusinesses = [];
  DateTime? _startTime;
  DateTime? _endTime;
  TextEditingController _noteController = TextEditingController();

  void _selectTime(bool isStart) async {
    // DatePicker.showTimePicker(
    //   context,
    //   showSecondsColumn: false,
    //   onConfirm: (time) {
    //     setState(() {
    //       if (isStart) {
    //         _startTime = time;
    //       } else {
    //         _endTime = time;
    //       }
    //     });
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Need'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Select Need',
              ),
              value: _selectedNeed,
              items: ['Water', 'Gas'].map((String need) {
                return DropdownMenuItem<String>(
                  value: need,
                  child: Text(need),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  _selectedNeed = newValue;
                });
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Visibility:'),
                SizedBox(width: 16),
                Switch(
                  value: _isPublic,
                  onChanged: (value) {
                    setState(() {
                      _isPublic = value;
                    });
                  },
                ),
                Text(_isPublic ? 'Public' : 'Private'),
              ],
            ),
            _isPublic
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select Businesses:'),
                Wrap(
                  spacing: 8.0,
                  children: _businesses.map((String business) {
                    return ChoiceChip(
                      label: Text(business),
                      selected: _selectedBusinesses.contains(business),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedBusinesses.add(business);
                          } else {
                            _selectedBusinesses.remove(business);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            )
                : Container(),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Start Time:'),
                      TextButton(
                        onPressed: () => _selectTime(true),
                        child: Text(
                          _startTime == null
                              ? 'Select Start Time'
                              : _startTime!.toLocal().toString().substring(11, 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('End Time:'),
                      TextButton(
                        onPressed: () => _selectTime(false),
                        child: Text(
                          _endTime == null
                              ? 'Select End Time'
                              : _endTime!.toLocal().toString().substring(11, 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: 'Note',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle the submission logic here
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
