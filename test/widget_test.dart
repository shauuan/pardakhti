import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pardakhti/app.dart';

void main() {
  testWidgets('app builds sample shell', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: PardakhtiApp()),
    );
    await tester.pump();
    expect(find.text('پرداختی'), findsWidgets);
  });
}
