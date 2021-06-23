import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PopularDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(arg['name']),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              arg['imageUrl'],
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return const SizedBox();
              },
            ),
            //Todo sub feature xem các nội dung liên quan
            // Container(
            //   margin: EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.4),
            //         spreadRadius: 1,
            //         blurRadius: 4,
            //         offset: Offset(1, 2), // changes position of shadow
            //       ),
            //     ],
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   padding: EdgeInsets.all(10),
            //   child: RichText(
            //     text: TextSpan(
            //       text: 'Xem các trường dạy ${arg['name']}',
            //       children: [
            //         WidgetSpan(
            //           child: Icon(Icons.arrow_forward_ios),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Html(data: arg['codeHtml']),
          ],
        ),
      ),
    );
  }
}
