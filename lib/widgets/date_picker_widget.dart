import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerWidget extends StatefulWidget {
  final Function(DateTime) onDateSelected;

  DatePickerWidget({required this.onDateSelected});

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
  }





  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        widget.onDateSelected(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: AbsorbPointer(
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'Date of Birth',
            hintText: DateFormat('yyyy-MM-dd').format(selectedDate),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class DatePickerWidget extends StatefulWidget {
//   final Function(DateTime) onDateSelected;
//
//   DatePickerWidget({required this.onDateSelected});
//
//   @override
//   _DatePickerWidgetState createState() => _DatePickerWidgetState();
// }
//
// class _DatePickerWidgetState extends State<DatePickerWidget> {
//   late DateTime selectedDate;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedDate = DateTime.now();
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != selectedDate)
//       setState(() {
//         selectedDate = picked;
//         widget.onDateSelected(picked);
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: () => _selectDate(context),
//           child: AbsorbPointer(
//             child: TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Date of Birth',
//                 hintText: DateFormat('yyyy-MM-dd').format(selectedDate),
//               ),
//             ),
//           ),
//         ),
//         Text('Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}'),
//       ],
//     );
//   }
// }
//
//
