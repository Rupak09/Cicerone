import 'package:dijkstra/dijkstra.dart';

List fun(int from, int to) {
  List<List> pairsList = [
    [1, 2],
    [1, 4],
    [1, 5],
    [2, 3],
    [3, 5],
    [5, 4]
  ];
  var op1 = Dijkstra.findPathFromPairsList(pairsList, from, to);
  List op = [];
  for (int i = 0; i < op1.length - 1; i++) {
    int k = (op1[i] * 10) + op1[i + 1];
    op.add(k);
  }
  return op;
}
