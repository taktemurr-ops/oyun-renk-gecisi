import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_renk_gecisi/oyun_renk_gecisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(renkConfig.title.length, 33);
    expect(renkConfig.tagline.length, 33);
    for (final s in renkConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(renkRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: renkId, optionalMechanics: renkRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(renkRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
