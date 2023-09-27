void main() {
  var commands = [
    "MyCalendar",
    "book",
    "book",
    "book",
    "book",
    "book",
    "book",
    "book",
    "book",
    "book",
    "book"
  ];
  var args = [
    [],
    [47, 50],
    [33, 41],
    [39, 45],
    [33, 42],
    [25, 32],
    [26, 35],
    [19, 25],
    [3, 8],
    [8, 13],
    [18, 27]
  ];

  var outputs = [
    null,
    true,
    true,
    false,
    false,
    true,
    false,
    true,
    true,
    true,
    false
  ];

  for (var i = 0; i < commands.length; i++) {
    switch (commands[i]) {
      case 'MyCalendar':
        print('var myCalendar = MyCalendar();');
        break;
      case 'book':
        print('expect(myCalendar.book(${args[i][0]}, ${args[i][1]}), equals(${outputs[i]}));');
        break;
      default:
        assert(false);
    }
  }
}
