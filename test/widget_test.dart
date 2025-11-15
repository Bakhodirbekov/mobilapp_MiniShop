import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:little_treasures/main.dart';
import 'package:little_treasures/providers/card_provider.dart';
import 'package:little_treasures/providers/auth_provider.dart';
import 'package:little_treasures/providers/wishlist_provider.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CardProvider()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => WishlistProvider()),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that the home screen is displayed.
    expect(find.text('Little Treasures'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
  });
}
