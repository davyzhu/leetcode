import 'dart:collection';

const maxEnd = 10000000000;

final class EntryItem extends LinkedListEntry<EntryItem> {
  final int start;
  final int end;
  final int booking;

  EntryItem(this.start, this.end, this.booking);

  @override
  String toString() {
    return '[$start, $end)';
  }
}

class MyCalendarTwo {
  final calendar = LinkedList<EntryItem>();

  MyCalendarTwo() {
    calendar.add(EntryItem(0, maxEnd, 0));
  }

  bool book(final int start, final int end) {
    if (isMaxBooked(start, end)) {
      return false;
    } else {
      update(start, end);
      return true;
    }
  }

  bool isMaxBooked(final int start, final int end, [final int maxBooking = 2]) {
    for (EntryItem? e = calendar.first; e != null; e = e.next) {
      if (isOverlap(e, start, end) && e.booking == maxBooking) {
        return true;
      }
    }
    return false;
  }

  void update(final int start, final int end) {
    assert(calendar.isNotEmpty);
    
  }

  bool isNotOverlap(final EntryItem e, final start, final end) {
    return (e.end <= start) || (end <= e.start);
  }

  bool isOverlap(final EntryItem e, final start, final end) {
    return !isNotOverlap(e, start, end);
  }
}
