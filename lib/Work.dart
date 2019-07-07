import 'package:myapp/Shift.dart';

class Work {
  List<Shift> shifts = [];
  Shift todayShift;

  void add(Shift shift) => this.shifts.add(shift);
  Shift removeAt(int index) => shifts.removeAt(index);

  void setTodayShift(int index) {
    todayShift = shifts[index];
  }
}