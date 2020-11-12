class Frame {
  int _score = 0;
  int get score => _score;

  void add(int pins) {
    _score += pins;
  }
}
