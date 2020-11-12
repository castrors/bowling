import 'package:bowling/game.dart';
import 'package:test/test.dart';

void main() {
  Game game;

  setUp(() {
    game = Game();
  });

  test('Test two throws no mark', () {
    game.add(5);
    game.add(4);
    expect(game.score, 9);
    expect(game.currentFrame, 2);
  });

  test('Test four throws no mark', () {
    game.add(5);
    game.add(4);
    game.add(7);
    game.add(2);
    expect(game.score, 18);
    expect(game.scoreForFrame(1), 9);
    expect(game.scoreForFrame(2), 18);
    expect(game.currentFrame, 3);
  });

  test('Test simple spare', () {
    game.add(3);
    game.add(7);
    game.add(3);
    expect(game.scoreForFrame(1), 13);
    expect(game.currentFrame, 2);
  });

  test('Test simple frame after spare', () {
    game.add(3);
    game.add(7);
    game.add(3);
    game.add(2);
    expect(game.scoreForFrame(1), 13);
    expect(game.scoreForFrame(2), 18);
    expect(game.score, 18);
    expect(game.currentFrame, 3);
  });

  test('Test simple strike', () {
    game.add(10);
    game.add(3);
    game.add(6);
    expect(game.scoreForFrame(1), 19);
    expect(game.score, 28);
    expect(game.currentFrame, 3);
  });

  test('Test perfect game', () {
    for (var i = 0; i < 12; i++) {
      game.add(10);
    }
    expect(game.score, 300);
    expect(game.currentFrame, 11);
  });
}
