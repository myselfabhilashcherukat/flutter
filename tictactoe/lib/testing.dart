void main() {
  List<List<int>> b = [];
  for (int j = 0; j < 3; j++) {
    List<int> a = [];
    for (int i = 0; i < 3; i++) {
      a.add(j * 10 + i);
    }
    b.add(a);
    print(b);
  }
  print(b);
}
