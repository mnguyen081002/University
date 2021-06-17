import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PopularDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text(arg['name'])),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          children: [
            Image.network(
              arg['imageUrl'],
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const SizedBox();
              },
            ),
            Html(data: arg['codeHtml']),
          ],
        ),
      ),
    );
  }
}
