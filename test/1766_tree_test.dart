import 'package:leetcode/1766_tree.dart';
import 'package:test/test.dart';

void main() {
  test('tree 1', () async {
    var s = Solution();
    var nums = [2, 3, 3, 2];
    var edges = [
      [0, 1],
      [1, 2],
      [1, 3]
    ];
    var outputs = [-1, 0, 0, 1];
    expect(s.getCoprimes(nums, edges), equals(outputs));
  });

  test('tree 2', () async {
    var s = Solution();
    var nums = [5, 6, 10, 2, 3, 6, 15];
    var edges = [
      [0, 1],
      [0, 2],
      [1, 3],
      [1, 4],
      [2, 5],
      [2, 6]
    ];
    var outputs = [-1, 0, -1, 0, 0, 0, -1];
    expect(s.getCoprimes(nums, edges), equals(outputs));
  });

  test('tree 3', () async {
    var s = Solution();
    var nums = [
      9,
      16,
      30,
      23,
      33,
      35,
      9,
      47,
      39,
      46,
      16,
      38,
      5,
      49,
      21,
      44,
      17,
      1,
      6,
      37,
      49,
      15,
      23,
      46,
      38,
      9,
      27,
      3,
      24,
      1,
      14,
      17,
      12,
      23,
      43,
      38,
      12,
      4,
      8,
      17,
      11,
      18,
      26,
      22,
      49,
      14,
      9
    ];
    var edges = [
      [17, 0],
      [30, 17],
      [41, 30],
      [10, 30],
      [13, 10],
      [7, 13],
      [6, 7],
      [45, 10],
      [2, 10],
      [14, 2],
      [40, 14],
      [28, 40],
      [29, 40],
      [8, 29],
      [15, 29],
      [26, 15],
      [23, 40],
      [19, 23],
      [34, 19],
      [18, 23],
      [42, 18],
      [5, 42],
      [32, 5],
      [16, 32],
      [35, 14],
      [25, 35],
      [43, 25],
      [3, 43],
      [36, 25],
      [38, 36],
      [27, 38],
      [24, 36],
      [31, 24],
      [11, 31],
      [39, 24],
      [12, 39],
      [20, 12],
      [22, 12],
      [21, 39],
      [1, 21],
      [33, 1],
      [37, 1],
      [44, 37],
      [9, 44],
      [46, 2],
      [4, 46]
    ];
    var outputs = [
      -1,
      21,
      17,
      43,
      10,
      42,
      7,
      13,
      29,
      44,
      17,
      31,
      39,
      10,
      10,
      29,
      32,
      0,
      40,
      23,
      12,
      39,
      12,
      40,
      25,
      35,
      15,
      38,
      40,
      40,
      17,
      24,
      5,
      1,
      19,
      14,
      17,
      21,
      25,
      24,
      14,
      17,
      40,
      25,
      37,
      17,
      10
    ];
    expect(s.getCoprimes(nums, edges), equals(outputs));
  });
  test('large tree stack overflow', () async {
    var s = Solution();

    List<int> nums = [];
    nums.add(3);
    for (var i = 0; i < 99999; i++) {
      if (i.isEven) {
        nums.add(2);
      } else {
        nums.add(6);
      }
    }

    List<List<int>> edges = [];
    for (var i = 0; i < 99998; i++) {
      if (i.isEven) {
        edges.add([i, i + 2]);
      } else {
        edges.add([i - 1, i]);
      }
    }
    edges.add([99998, 99999]);

    List<int> outputs = [];
    for (var i = 0; i <= 99999; i++) {
      outputs.add(i.isEven ? -1 : 0);
    }
    expect(s.getCoprimes(nums, edges),equals(outputs));
  });
}
