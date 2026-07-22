import 'package:dokan_track/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows DokanTrack onboarding', (tester) async {
    await tester.pumpWidget(const DokanTrackApp());
    await tester.pumpAndSettle();

    expect(find.text('DokanTrack'), findsOneWidget);
    expect(find.textContaining('Simple records'), findsOneWidget);
    expect(find.text('Get started'), findsOneWidget);
  });
}
