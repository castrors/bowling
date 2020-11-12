class Game {
  int _score = 0;
  int _currentThrow = 0;
  final _throws = List<int>(21);

  int _currentFrame = 1;
  bool _isFirstThrow = true;

  int get score => scoreForFrame(_currentFrame - 1);
  int get currentFrame => _currentFrame;

  void add(int pins) {
    _throws[_currentThrow++] = pins;
    _score += pins;

    _adjustCurrentFrame(pins);
  }

  void _adjustCurrentFrame(int pins) {
    if (_isFirstThrow) {
      if (pins == 10) {
        _currentFrame++;
      } else {
        _isFirstThrow = false;
      }
    } else {
      _isFirstThrow = true;
      _currentFrame++;
    }
    if (currentFrame > 11) {
      _currentFrame = 11;
    }
  }

  int scoreForFrame(int theFrame) {
    var ball = 0;
    var score = 0;

    for (var currentFrame = 0; currentFrame < theFrame; currentFrame++) {
      final firstThrow = _throws[ball++];
      if (firstThrow == 10) {
        score += 10 + _throws[ball] + _throws[ball + 1];
      } else {
        final secondThrow = _throws[ball++];
        final frameScore = firstThrow + secondThrow;

        if (frameScore == 10) {
          score += frameScore + _throws[ball];
        } else {
          score += frameScore;
        }
      }
    }

    return score;
  }
}
