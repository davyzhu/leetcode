import 'package:leetcode/732_my_calendar_3.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () {
    var myCalendarThree = MyCalendarThree();
    expect(myCalendarThree.book(10, 20), equals(1));
    expect(myCalendarThree.book(50, 60), equals(1));
    expect(myCalendarThree.book(10, 40), equals(2));
    expect(myCalendarThree.book(5, 15), equals(3));
    expect(myCalendarThree.book(5, 10), equals(3));
    expect(myCalendarThree.book(25, 55), equals(3));
  });
}
