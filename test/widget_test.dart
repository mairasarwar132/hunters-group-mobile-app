import 'package:flutter_test/flutter_test.dart';
import 'package:hunters_group/main.dart';

void main() {
  testWidgets('Hunters Group app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const HuntersGroupApp());
    expect(find.text('Hunters Group'), findsWidgets);
  });
}