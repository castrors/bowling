import 'scorer.dart';

class Game {
  var _currentFrame = 0;
  var _isFirstThrow = true;
  var scorer = Scorer();

  int get score => scoreForFrame(_currentFrame);

  void add(int pins) {
    scorer.addThrow(pins);
    _adjustCurrentFrame(pins);
  }

  void _adjustCurrentFrame(int pins) {
    if (_lastBallInFrame(pins)) {
      _advanceFrame();
    } else {
      _isFirstThrow = false;
    }
  }

  bool _lastBallInFrame(int pins) => _strike(pins) || (!_isFirstThrow);

  bool _strike(int pins) => _isFirstThrow && pins == 10;

  void _advanceFrame() {
    _currentFrame++;
    if (_currentFrame > 10) {
      _currentFrame = 10;
    }
  }

  int scoreForFrame(int theFrame) {
    return scorer.scoreForFrame(theFrame);
  }
}
