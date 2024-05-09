import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled1/pages/home_screen/four.dart';

class AppointmentBookingPage extends StatefulWidget {
  const AppointmentBookingPage({Key? key}) : super(key: key);

  @override
  _AppointmentBookingPageState createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  late CalendarFormat _calendarFormat;
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  TimeOfDay _selectedTime = TimeOfDay(hour: 9, minute: 0); // Default time

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(35),
          ),
        ),
        backgroundColor: const Color(0xffae95e52),
        leading: IconButton(
          onPressed: () {
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Four()),
              );
          },
          icon: const Icon(Icons.arrow_back_sharp),
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFFF0EDEA), // Page background color
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset(
                  'assets/images/Plumber with tools .png', 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top:
                      20), 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(20),
              ),
              child: TableCalendar(
                firstDay: DateTime.now(),
                lastDay:
                    DateTime(DateTime.now().year, DateTime.now().month + 3),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
            ),

            // Display selected day and month in a button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () {
                      // Add your logic here for what happens when the button is pressed
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    child: Text(
                      '${_selectedDay.day}/${_selectedDay.month}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      _selectTime(context);
                    },
                    child: AbsorbPointer(
                      child: TextFormField(
                        controller: TextEditingController(
                            text: _selectedTime.format(context)),
                        decoration: InputDecoration(
                          labelText: 'Time',
                          filled: true,
                          fillColor: Colors.blue.withOpacity(0.1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.access_time),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Button to book appointment
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Four()),
                    );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Color(0xFFE95E52)), // Button color
                      ),
                      child: Text(
                        'Book Appointment',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }
}