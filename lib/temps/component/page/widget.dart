/*
 * @Author: cheng
 * @Version: 1.0
 * @Date: 2023-04-25 13:27:10
 * @LastEditors: cheng
 * @LastEditTime: 2023-05-29 15:35:02
 * @FilePath: \provider_temp_gen\lib\temps\component\page\widget.dart
 * @ObjectDescription: stateless页面组件模板
 */

const statelessWidget = r'''
import 'package:flutter/material.dart';

import '../$stateName.dart';

extension $nameWidget on $namePage {
  
  Widget getChildView() => throw UnimplementedError();
}
''';

// const statefulWidget = r'''
// import 'package:flutter/material.dart';
// import '/Tools.dart';

// import '../$stateName.dart';

// extension $nameWidget on BaseState<$nameModel,$nameState> {

//   Widget getChildView() => Container();
// }
// ''';
