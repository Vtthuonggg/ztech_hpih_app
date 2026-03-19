import 'package:flutter/material.dart';

import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

import '../theme/app_theme.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Color? primaryColor;

  const CustomDatePicker({
    super.key,
    required this.initialDate,
    this.firstDate,
    this.lastDate,
    this.primaryColor,
  });

  static Future<DateTime?> show({
    required BuildContext context,
    required DateTime initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    Color? primaryColor,
  }) async {
    return await showDialog<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return CustomDatePicker(
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(1990),
          lastDate: lastDate ?? DateTime.now().add(Duration(days: 365)),
          primaryColor: primaryColor ?? AppTheme.primaryColor,
        );
      },
    );
  }

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  late DateTime focusedDay;
  DateTime? selectedDate;
  bool _isSelectingYear = false;
  bool _isSelectingMonth = false;

  @override
  void initState() {
    super.initState();
    focusedDay = widget.initialDate;
    selectedDate = widget.initialDate;
  }

  Color get primaryColor => widget.primaryColor ?? AppTheme.primaryColor;

  DateTime get _normalizedFirstDate {
    final firstDate = widget.firstDate ?? DateTime(1990);
    return DateTime(firstDate.year, firstDate.month, firstDate.day);
  }

  DateTime get _normalizedLastDate {
    final lastDate = widget.lastDate ?? DateTime.now().add(Duration(days: 365));
    return DateTime(lastDate.year, lastDate.month, lastDate.day);
  }

  bool get _canGoToPreviousMonth {
    final previousMonth = DateTime(focusedDay.year, focusedDay.month - 1, 1);
    final firstMonth = DateTime(
      _normalizedFirstDate.year,
      _normalizedFirstDate.month,
      1,
    );
    return !previousMonth.isBefore(firstMonth);
  }

  bool get _canGoToNextMonth {
    final nextMonth = DateTime(focusedDay.year, focusedDay.month + 1, 1);
    final lastMonth = DateTime(
      _normalizedLastDate.year,
      _normalizedLastDate.month,
      1,
    );
    return !nextMonth.isAfter(lastMonth);
  }

  void _selectYear(int year) {
    final candidate = DateTime(year, focusedDay.month, 1);
    final firstMonth = DateTime(
      _normalizedFirstDate.year,
      _normalizedFirstDate.month,
      1,
    );
    final lastMonth = DateTime(
      _normalizedLastDate.year,
      _normalizedLastDate.month,
      1,
    );
    if (candidate.isBefore(firstMonth) || candidate.isAfter(lastMonth)) return;
    setState(() {
      focusedDay = candidate;
      _isSelectingYear = false;
    });
  }

  void _selectMonth(int month) {
    final candidate = DateTime(focusedDay.year, month, 1);
    final firstMonth = DateTime(
      _normalizedFirstDate.year,
      _normalizedFirstDate.month,
      1,
    );
    final lastMonth = DateTime(
      _normalizedLastDate.year,
      _normalizedLastDate.month,
      1,
    );
    if (candidate.isBefore(firstMonth) || candidate.isAfter(lastMonth)) return;
    setState(() {
      focusedDay = candidate;
      _isSelectingMonth = false;
    });
  }

  void _previousMonth() {
    if (!_canGoToPreviousMonth) return;
    setState(() {
      focusedDay = DateTime(focusedDay.year, focusedDay.month - 1, 1);
    });
  }

  void _nextMonth() {
    if (!_canGoToNextMonth) return;
    setState(() {
      focusedDay = DateTime(focusedDay.year, focusedDay.month + 1, 1);
    });
  }

  void _onDaySelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(20),
        constraints: BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            SizedBox(height: 16),
            if (_isSelectingYear)
              _buildYearSelector()
            else if (_isSelectingMonth)
              _buildMonthSelector()
            else ...[
              _buildMonthNavigation(),
              SizedBox(height: 16),
              _buildCalendarGrid(),
              SizedBox(height: 16),
              if (selectedDate != null) _buildSelectedDateDisplay(),
              SizedBox(height: 16),
            ],
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Chọn ngày',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xff262A37),
          ),
        ),
        IconButton(
          icon: Icon(Icons.close, color: Colors.grey[600]),
          onPressed: () => Navigator.pop(context),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
      ],
    );
  }

  Widget _buildMonthNavigation() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.chevron_left, color: primaryColor),
            onPressed: _canGoToPreviousMonth ? _previousMonth : null,
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isSelectingMonth = true;
                    _isSelectingYear = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Tháng ${focusedDay.month}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff262A37),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              InkWell(
                onTap: () {
                  setState(() {
                    _isSelectingYear = true;
                    _isSelectingMonth = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${focusedDay.year}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff262A37),
                    ),
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, color: primaryColor),
            onPressed: _canGoToNextMonth ? _nextMonth : null,
          ),
        ],
      ),
    );
  }

  Widget _buildYearSelector() {
    final currentYear = DateTime.now().year;
    final startYear = widget.firstDate?.year ?? 2000;
    final endYear = widget.lastDate?.year ?? currentYear + 10;

    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _isSelectingYear = false;
                    });
                  },
                  icon: Icon(Icons.arrow_back, color: primaryColor, size: 20),
                  label: Text(
                    'Chọn năm',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff262A37),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: endYear - startYear + 1,
              itemBuilder: (context, index) {
                final year = endYear - index;
                final isSelected = year == focusedDay.year;
                final isDisabled =
                    year < _normalizedFirstDate.year ||
                    year > _normalizedLastDate.year;

                return InkWell(
                  onTap: isDisabled ? null : () => _selectYear(year),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDisabled
                          ? Colors.grey[50]
                          : isSelected
                          ? primaryColor
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '$year',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isDisabled
                              ? Colors.grey[300]
                              : isSelected
                              ? Colors.white
                              : Color(0xff262A37),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    final months = [
      'Tháng 1',
      'Tháng 2',
      'Tháng 3',
      'Tháng 4',
      'Tháng 5',
      'Tháng 6',
      'Tháng 7',
      'Tháng 8',
      'Tháng 9',
      'Tháng 10',
      'Tháng 11',
      'Tháng 12',
    ];

    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _isSelectingMonth = false;
                    });
                  },
                  icon: Icon(Icons.arrow_back, color: primaryColor, size: 20),
                  label: Text(
                    'Chọn tháng - ${focusedDay.year}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff262A37),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final month = index + 1;
                final isSelected = month == focusedDay.month;
                final candidate = DateTime(focusedDay.year, month, 1);
                final firstMonth = DateTime(
                  _normalizedFirstDate.year,
                  _normalizedFirstDate.month,
                  1,
                );
                final lastMonth = DateTime(
                  _normalizedLastDate.year,
                  _normalizedLastDate.month,
                  1,
                );
                final isDisabled =
                    candidate.isBefore(firstMonth) ||
                    candidate.isAfter(lastMonth);

                return InkWell(
                  onTap: isDisabled ? null : () => _selectMonth(month),
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDisabled
                          ? Colors.grey[50]
                          : isSelected
                          ? primaryColor
                          : Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        months[index],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w400,
                          color: isDisabled
                              ? Colors.grey[300]
                              : isSelected
                              ? Colors.white
                              : Color(0xff262A37),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(focusedDay.year, focusedDay.month, 1);
    final lastDayOfMonth = DateTime(focusedDay.year, focusedDay.month + 1, 0);
    final daysInMonth = lastDayOfMonth.day;
    final startWeekday = firstDayOfMonth.weekday % 7;
    final now = DateTime.now();
    final firstDate = _normalizedFirstDate;
    final lastDate = _normalizedLastDate;

    return SizedBox(
      height: 260,
      child: Column(
        children: [
          // Weekday headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'].map((day) {
              return Expanded(
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff5C5C5C),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 8),

          // Calendar days
          Expanded(
            child: Column(
              children: List.generate(6, (weekIndex) {
                return Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(7, (dayIndex) {
                      final dayNumber =
                          weekIndex * 7 + dayIndex - startWeekday + 1;

                      if (dayNumber < 1 || dayNumber > daysInMonth) {
                        return Expanded(child: SizedBox());
                      }

                      final date = DateTime(
                        focusedDay.year,
                        focusedDay.month,
                        dayNumber,
                      );
                      final isToday =
                          date.year == now.year &&
                          date.month == now.month &&
                          date.day == now.day;
                      final isSelected =
                          selectedDate != null &&
                          date.year == selectedDate!.year &&
                          date.month == selectedDate!.month &&
                          date.day == selectedDate!.day;
                      final isDisabled =
                          date.isBefore(firstDate) || date.isAfter(lastDate);

                      return Expanded(
                        child: GestureDetector(
                          onTap: isDisabled ? null : () => _onDaySelected(date),
                          child: Container(
                            margin: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? primaryColor
                                  : isToday
                                  ? primaryColor.withValues(alpha: 0.1)
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: isToday && !isSelected
                                  ? Border.all(color: primaryColor, width: 1.5)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                '$dayNumber',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: isSelected || isToday
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isDisabled
                                      ? Colors.grey[300]
                                      : isSelected
                                      ? Colors.white
                                      : Color(0xff262A37),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedDateDisplay() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: primaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(IconsaxPlusLinear.calendar, size: 16, color: primaryColor),
          SizedBox(width: 8),
          Text(
            DateFormat('EEEE, dd/MM/yyyy', 'vi').format(selectedDate!),
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey[300]!),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Hủy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xff5C5C5C),
              ),
            ),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context, selectedDate);
            },
            child: Text(
              'Áp dụng',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
