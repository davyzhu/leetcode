import 'package:leetcode/731_my_calendar_2.dart';
import 'package:test/test.dart';

void main() {
  test('#1', () {
    var myCalendarTwo = MyCalendarTwo();
    expect(myCalendarTwo.book(10, 20), true);
    expect(myCalendarTwo.book(50, 60), true);
    expect(myCalendarTwo.book(10, 40), true);
    expect(myCalendarTwo.book(5, 15), false);
    expect(myCalendarTwo.book(5, 10), true);
    expect(myCalendarTwo.book(25, 55), true);
  });
}
