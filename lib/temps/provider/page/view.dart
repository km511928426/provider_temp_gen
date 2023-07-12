const stateful = r'''
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
    
import '../$stateName.dart';
    
class $namePage extends StatefulWidget {
    const $namePage({Key? key}) : super(key: key);
  
    @override
    State<$namePage> createState() => _$namePageState();
  }
  
  class _$namePageState extends State<$namePage> {
    @override
    Widget build(BuildContext context) {
      return ChangeNotifierProvider<$nameModel>.value(
        value: $nameModel(),
        child: widget.getChildView(context),
      );
    }
  }

''';

const stateless = r'''
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
    
import '../$stateName.dart';
    
class $namePage extends StatelessWidget {
    const $namePage({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return ChangeNotifierProvider<$nameModel>.value(
          value: $nameModel(),
          child: getChildView(context),
      );
    }
}

''';
