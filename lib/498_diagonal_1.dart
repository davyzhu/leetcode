import 'dart:collection';

class Data implements Comparable<Data> {
  final int row;
  final int col;
  final int value;
  final int sum;

  Data(this.row, this.col, this.value) : sum = row + col;
  @override
  int compareTo(other) {
    if (sum < other.sum) {
      return -1;
    } else if (sum > other.sum) {
      return 1;
    } else {
      if (sum.isEven) {
        if (col < other.col) {
          return -1;
        } else if (col > other.col) {
          return 1;
        } else {
          return 0;
        }
      } else {
        if (row < other.row) {
          return -1;
        } else if (row > other.row) {
          return 1;
        } else {
          return 0;
        }
      }
    }
  }
}

class Solution {
  final data = SplayTreeSet<Data>();
  List<int> findDiagonalOrder(List<List<int>> mat) {
    for (var i = 0; i < mat.length; i++) {
      for (var j = 0; j < mat[i].length; j++) {
        data.add(Data(i, j, mat[i][j]));
      }
    }

    return data.map((e) => e.value).toList();
  }
}
