import 'package:flutter/material.dart';

PageRouteBuilder<dynamic> pageRouteReturn({required Widget previousPage}) =>
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => previousPage,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
