const widget = r'''
import 'package:flutter/material.dart';

import '../$stateName.dart';
    
extension $nameWidget on $namePage {
  
  Widget getChildView(BuildContext context) => throw UnimplementedError();
}

''';
