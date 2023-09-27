import 'package:leetcode/729_my_calendar_1.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () {
    var myCalendar = MyCalendar();
    expect(myCalendar.book(10, 20), true);
    expect(myCalendar.book(15, 25), false);
    expect(myCalendar.book(20, 30), true);
  });
  test('#2', () {
    var myCalendar = MyCalendar();
    expect(myCalendar.book(47, 50), equals(true));
    expect(myCalendar.book(33, 41), equals(true));
    expect(myCalendar.book(39, 45), equals(false));
    expect(myCalendar.book(33, 42), equals(false));
    expect(myCalendar.book(25, 32), equals(true));
    expect(myCalendar.book(26, 35), equals(false));
    expect(myCalendar.book(19, 25), equals(true));
    expect(myCalendar.book(3, 8), equals(true));
    expect(myCalendar.book(8, 13), equals(true));
    expect(myCalendar.book(18, 27), equals(false));
  });
}
