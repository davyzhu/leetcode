import 'package:leetcode/1912_movie.dart';
import 'package:test/test.dart';

void main() {
  test('1912 movie #1 ', () async {
    var movieRentingSystem = MovieRentingSystem(3, [
      [0, 1, 5],
      [0, 2, 6],
      [0, 3, 7],
      [1, 1, 4],
      [1, 2, 7],
      [2, 1, 5]
    ]);
    expect(movieRentingSystem.search(1), equals([1, 0, 2]));
    movieRentingSystem.rent(0, 1);
    movieRentingSystem.rent(1, 2);
    expect(
        movieRentingSystem.report(),
        equals([
          [0, 1],
          [1, 2]
        ]));
    movieRentingSystem.drop(1, 2);
    expect(movieRentingSystem.search(2), equals([0, 1]));
  });

  test('1912 movie #2 ', () async {
    var movieRentingSystem = MovieRentingSystem(69, [
      [16, 4156, 1511],
      [20, 8501, 8417],
      [34, 7901, 7776],
      [54, 6691, 9511],
      [44, 8931, 8434],
      [42, 9640, 5251],
      [22, 4534, 9161],
      [32, 6506, 6831],
      [13, 8501, 731],
      [4, 7610, 8474],
      [33, 820, 2341],
      [17, 6490, 1161],
      [29, 7120, 2703],
      [8, 8723, 7613],
      [38, 9544, 1804],
      [30, 8723, 1047],
      [1, 5015, 7763],
      [60, 1625, 2383],
      [29, 3336, 3542],
      [39, 7535, 6066],
      [1, 9074, 9400],
      [39, 1625, 7944],
      [26, 9160, 6874],
      [55, 2465, 888],
      [35, 8530, 6025]
    ]);
    movieRentingSystem.rent(32, 6506);
    expect(movieRentingSystem.search(8501), equals([13, 20]));
    expect(movieRentingSystem.search(6275), equals([]));
    expect(
        movieRentingSystem.report(),
        equals([
          [32, 6506]
        ]));
    movieRentingSystem.rent(30, 8723);
    movieRentingSystem.rent(8, 8723);
    expect(
        movieRentingSystem.report(),
        equals([
          [30, 8723],
          [32, 6506],
          [8, 8723]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [30, 8723],
          [32, 6506],
          [8, 8723]
        ]));
    expect(movieRentingSystem.search(6699), equals([]));
    expect(movieRentingSystem.search(115), equals([]));
    movieRentingSystem.rent(20, 8501);
    movieRentingSystem.rent(16, 4156);
    expect(movieRentingSystem.search(9447), equals([]));
    movieRentingSystem.drop(30, 8723);
    movieRentingSystem.drop(8, 8723);
    movieRentingSystem.drop(32, 6506);
    movieRentingSystem.drop(16, 4156);
    movieRentingSystem.rent(42, 9640);
    expect(
        movieRentingSystem.report(),
        equals([
          [42, 9640],
          [20, 8501]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [42, 9640],
          [20, 8501]
        ]));
    movieRentingSystem.rent(17, 6490);
    movieRentingSystem.drop(20, 8501);
    expect(movieRentingSystem.search(8175), equals([]));
    expect(
        movieRentingSystem.report(),
        equals([
          [17, 6490],
          [42, 9640]
        ]));
    movieRentingSystem.drop(17, 6490);
    expect(
        movieRentingSystem.report(),
        equals([
          [42, 9640]
        ]));
    movieRentingSystem.drop(42, 9640);
    movieRentingSystem.rent(54, 6691);
    expect(
        movieRentingSystem.report(),
        equals([
          [54, 6691]
        ]));
    expect(movieRentingSystem.search(1625), equals([60, 39]));
    expect(movieRentingSystem.search(3291), equals([]));
    movieRentingSystem.rent(60, 1625);
    movieRentingSystem.rent(39, 1625);
    expect(
        movieRentingSystem.report(),
        equals([
          [60, 1625],
          [39, 1625],
          [54, 6691]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [60, 1625],
          [39, 1625],
          [54, 6691]
        ]));
    movieRentingSystem.drop(60, 1625);
    expect(
        movieRentingSystem.report(),
        equals([
          [39, 1625],
          [54, 6691]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [39, 1625],
          [54, 6691]
        ]));
    movieRentingSystem.drop(39, 1625);
    expect(
        movieRentingSystem.report(),
        equals([
          [54, 6691]
        ]));
    movieRentingSystem.drop(54, 6691);
    movieRentingSystem.rent(8, 8723);
    movieRentingSystem.drop(8, 8723);
    expect(movieRentingSystem.search(2260), equals([]));
    movieRentingSystem.rent(29, 7120);
    expect(movieRentingSystem.search(746), equals([]));
    movieRentingSystem.drop(29, 7120);
    movieRentingSystem.rent(38, 9544);
    movieRentingSystem.drop(38, 9544);
    expect(movieRentingSystem.report(), equals([]));
    movieRentingSystem.rent(1, 9074);
    movieRentingSystem.drop(1, 9074);
    movieRentingSystem.rent(54, 6691);
    movieRentingSystem.rent(39, 1625);
    movieRentingSystem.drop(54, 6691);
    expect(
        movieRentingSystem.report(),
        equals([
          [39, 1625]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [39, 1625]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [39, 1625]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [39, 1625]
        ]));
    movieRentingSystem.rent(26, 9160);
    movieRentingSystem.drop(26, 9160);
    expect(
        movieRentingSystem.report(),
        equals([
          [39, 1625]
        ]));
    movieRentingSystem.drop(39, 1625);
    movieRentingSystem.rent(42, 9640);
    expect(movieRentingSystem.search(9640), equals([]));
    movieRentingSystem.drop(42, 9640);
    expect(movieRentingSystem.report(), equals([]));
    movieRentingSystem.rent(29, 7120);
    expect(movieRentingSystem.search(5630), equals([]));
    expect(movieRentingSystem.search(1842), equals([]));
    expect(
        movieRentingSystem.report(),
        equals([
          [29, 7120]
        ]));
    movieRentingSystem.rent(16, 4156);
    expect(
        movieRentingSystem.report(),
        equals([
          [16, 4156],
          [29, 7120]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [16, 4156],
          [29, 7120]
        ]));
    movieRentingSystem.rent(1, 9074);
    expect(
        movieRentingSystem.report(),
        equals([
          [16, 4156],
          [29, 7120],
          [1, 9074]
        ]));
    expect(
        movieRentingSystem.report(),
        equals([
          [16, 4156],
          [29, 7120],
          [1, 9074]
        ]));
    expect(movieRentingSystem.search(7992), equals([]));
    movieRentingSystem.rent(4, 7610);
    movieRentingSystem.rent(29, 3336);
    expect(movieRentingSystem.search(1333), equals([]));
  });
}
