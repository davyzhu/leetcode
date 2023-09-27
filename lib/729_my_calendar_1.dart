import 'dart:collection';

final class EntryItem extends LinkedListEntry<EntryItem> {
  final int start;
  final int end;

  EntryItem(this.start, this.end);

  @override
  String toString() {
    return '[$start, $end)';
  }
}

class MyCalendar {
  final calendar = LinkedList<EntryItem>();

  MyCalendar();

  bool book(int start, int end) {
    if (calendar.isEmpty) {
      calendar.add(EntryItem(start, end));
      return true;
    } else {
      EntryItem? prev;
      for (EntryItem? c = calendar.first; c != null; c = c.next) {
        if (c == calendar.first && end <= c.start) {
          c.insertBefore(EntryItem(start, end));
          return true;
        } else if (c == calendar.last && c.end <= start) {
          c.insertAfter(EntryItem(start, end));
          return true;
        } else {
          if (prev != null && prev.end <= start && end <= c.start) {
            c.insertBefore(EntryItem(start, end));
            return true;
          }
        }
        prev = c;
      }
    }
    return false;
  }
}
