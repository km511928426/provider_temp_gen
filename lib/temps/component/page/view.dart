/*
 * @Author: cheng
 * @Version: 1.0
 * @Date: 2023-04-25 13:27:10
 * @LastEditors: cheng
 * @LastEditTime: 2023-06-05 14:10:58
 * @FilePath: \provider_temp_gen\lib\temps\component\page\view.dart
 * @ObjectDescription: stateless页面模板
 */

const stateless = r'''
import 'package:flutter/material.dart';
import 'package:provider_base_tools/tools.dart';

import '../$stateName.dart';

class $namePage extends InitBaseStatelessWidget<$nameModel,$nameState> {
  const $namePage({super.key});

  @override
  void finish() {}

  @override
  $nameModel getModel() {
    return $nameModel.getInstance($nameState());
  }

  @override
  Widget successedBuilder(BuildContext context) {
    return getChildView();
  }
}
''';

// const stateful = r'''
// import 'package:flutter/material.dart';
// import '/Tools.dart';

// import '../$stateName.dart';

// class $namePage extends InitBaseStatefulWidget<$nameModel,$nameState> {
//   const $namePage({super.key});

//   @override
//   BaseState<$nameModel,$nameState> getBaseState() {
//     return _$nameState();
//   }
// }

// class _$nameState extends BaseState<$nameModel,$nameState> {
//   @override
//   void finish() {}

//   @override
//   $nameModel getModel() {
//     return $nameModel.getInstance($nameState());
//   }

//   @override
//   void onReady() {}

//   @override
//   Widget successedBuilder(BuildContext context) {
//     return getChildView();
//   }
// }
// ''';
