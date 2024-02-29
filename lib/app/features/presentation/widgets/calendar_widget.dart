import 'package:ai_travel_app/app/core/constants/custom_strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  Calender({super.key, required this.startDateTec, required this.endDateTec});
  TextEditingController startDateTec;
  TextEditingController endDateTec;

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late DateTime _focusedDay;
  late DateTime _firstDay;
  late DateTime _lastDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    _focusedDay = DateTime.now();
    _firstDay = DateTime.now().subtract(const Duration(days: 1000));
    _lastDay = DateTime.now().add(const Duration(days: 1000));
    super.initState();
  }

  void onRangeSelected(
    DateTime? rangeStart,
    DateTime? rangeEnd,
    DateTime focusDay,
  ) {
    setState(() {
      _focusedDay = focusDay;
      _rangeStart = rangeStart;
      _rangeEnd = rangeEnd;
      var outputFormat = DateFormat(CustomStrings.dateFormat);
      if (rangeStart != null) {
        var outputRangeStartDate = outputFormat.format(rangeStart);
        widget.startDateTec.text = outputRangeStartDate.toString();
      }
      if (rangeEnd != null) {
        var outputRangeEndDate = outputFormat.format(rangeEnd);

        widget.endDateTec.text = outputRangeEndDate.toString();
      }
      // var outputFormat = DateFormat('MM/dd/yyyy ');
      // var outputDate = outputFormat.format(rangeStart!);

      // widget.startDateTec.text = outputDate.toString();
      // widget.startDateTec.text = rangeStart.toString();
      // widget.endDateTec.text = rangeEnd.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          var outputFormat = DateFormat('MM/dd/yyyy ');
          var outputDate = outputFormat.format(selectedDay);

          widget.startDateTec.text = outputDate.toString();
          _focusedDay = focusedDay; // update `_focusedDay` here as well
        });
      },
      rangeSelectionMode: RangeSelectionMode.toggledOn,
      onRangeSelected: onRangeSelected,
      rangeStartDay: _rangeStart,
      rangeEndDay: _rangeEnd,
      focusedDay: _focusedDay,
      firstDay: _firstDay,
      lastDay: _lastDay,
      calendarFormat: CalendarFormat.week,
      availableCalendarFormats: const {CalendarFormat.week: 'week'},
    );
  }
}
