import 'package:bowling/frame.dart';
import 'package:test/test.dart';

void main() {
  test('Test score no throws', () {
    var frame = Frame();
    expect(frame.score, 0);
  });

  test('Test add one throw', () {
    var frame = Frame();
    frame.add(5);
    expect(frame.score, 5);
  });
}