import 'package:desafio_positiv/views/list_fav_repositorie_view.dart';
import 'package:desafio_positiv/views/list_repositories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeTestable(Widget widget) => MaterialApp(home: widget);

void main() {
  testWidgets("Test list at home page", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (ctx) => ListRepositoriesView(),
        "/favorite": (ctx) => ListFavRepositoriesView()
      },
    ));
    await tester.pump();
    expect(find.text("Repositorios"), findsOneWidget);
    expect(find.byWidget(Card()), findsWidgets);
  });
}
