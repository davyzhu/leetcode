import 'dart:collection';

const maxEnd = 10000000000;

final class EntryItem extends LinkedListEntry<EntryItem> {
  int start;
  int end;
  int booking;

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
    for (EntryItem? e = calendar.first; e != null; e = e.next) {
      if (isOverlap(e, start, end)) {
        if (e.start < start && end < e.end) {
          // case 1: split e into 3 new ranges by adding 2 new entry, middle one booking +1 
          e.insertBefore(EntryItem(e.start, start, e.booking)); //left
          e.insertBefore(EntryItem(start, end, e.booking + 1));//middle
          e.start = end;
        } else if (start <= e.start && e.end <= end) {
          // case 2: update e's booking + 1
          e.booking += 1;
        } else if (e.start < start && e.end <= end) {
          // case 3: split e into 2 new ranges, right booking +1 
          e.insertBefore(EntryItem(e.start, start, e.booking)); //left
          e.start = start;
          e.booking += 1;
        } else if (start <= e.start && end < e.end) {
          // case 3: split e into 2 new ranges, left booking +1
          e.insertBefore(EntryItem(e.start, end, e.booking+1)); //left
          e.start = end;
        } else {
          assert(false,"Invalid case");
        }
      }
    }
    
  }

  bool isNotOverlap(final EntryItem e, final start, final end) {
    return (e.end <= start) || (end <= e.start);
  }

  bool isOverlap(final EntryItem e, final start, final end) {
    return !isNotOverlap(e, start, end);
  }
}
