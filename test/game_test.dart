import 'package:bowling/game.dart';
import 'package:test/test.dart';

void main() {
  late Game game;

  setUp(() {
    game = Game();
  });

  test('Test two throws no mark', () {
    game.add(5);
    game.add(4);
    expect(game.score, 9);
  });

  test('Test four throws no mark', () {
    game.add(5);
    game.add(4);
    game.add(7);
    game.add(2);
    expect(game.score, 18);
    expect(game.scoreForFrame(1), 9);
    expect(game.scoreForFrame(2), 18);
  });

  test('Test simple spare', () {
    game.add(3);
    game.add(7);
    game.add(3);
    expect(game.scoreForFrame(1), 13);
    
  });

  test('Test simple frame after spare', () {
    game.add(3);
    game.add(7);
    game.add(3);
    game.add(2);
    expect(game.scoreForFrame(1), 13);
    expect(game.scoreForFrame(2), 18);
    expect(game.score, 18);
  });

  test('Test simple strike', () {
    game.add(10);
    game.add(3);
    game.add(6);
    expect(game.scoreForFrame(1), 19);
    expect(game.score, 28);
  });

  test('Test perfect game', () {
    for (var i = 0; i < 12; i++) {
      game.add(10);
    }
    expect(game.score, 300);
    
  });

  test('Test end of array', () {
    for (var i = 0; i < 9; i++) {
      game.add(0);
      game.add(0);
    }
    game.add(2);
    game.add(8);
    game.add(10);
    expect(game.score, 20);
  });
  test('Test sample game', () {
    game.add(1);
    game.add(4);
    game.add(4);
    game.add(5);
    game.add(6);
    game.add(4);
    game.add(5);
    game.add(5);
    game.add(10);
    game.add(0);
    game.add(1);
    game.add(7);
    game.add(3);
    game.add(6);
    game.add(4);
    game.add(10);
    game.add(2);
    game.add(8);
    game.add(6);
    expect(game.score, 133);
  });

  test('Test heart break', () {
    for (var i = 0; i < 11; i++) {
      game.add(10);
    }
    game.add(9);
    expect(game.score, 299);
  });

  test('Test tenth frame spare', () {
    for (var i = 0; i < 9; i++) {
      game.add(10);
    }
    game.add(9);
    game.add(1);
    game.add(1);
    expect(game.score, 270);
  });
}
