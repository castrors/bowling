class Scorer {
  late int _ball;
  final _throws = List<int>.filled(21, 0);
  int _currentThrow = 0;

  void addThrow(int pins) {
    _throws[_currentThrow++] = pins;
  }

  int scoreForFrame(int theFrame) {
    _ball = 0;
    var score = 0;

    for (var currentFrame = 0; currentFrame < theFrame; currentFrame++) {
      if (_strike) {
        score += 10 + _nextTwoBallsForStrike;
        _ball++;
      } else if (_spare) {
        score += 10 + _nextBallForSpare;
        _ball += 2;
      } else {
        score += _twoBallsInFrame;
        _ball += 2;
      }
    }
    return score;
  }

  int get _nextTwoBallsForStrike => _throws[_ball + 1] + _throws[_ball + 2];

  int get _nextBallForSpare => _throws[_ball + 2];

  bool get _strike => _throws[_ball] == 10;

  int get _twoBallsInFrame => _throws[_ball] + _throws[_ball + 1];

  bool get _spare => _throws[_ball] + _throws[_ball + 1] == 10;
}
