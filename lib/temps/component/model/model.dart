/*
 * @Author: cheng
 * @Version: 1.0
 * @Date: 2023-04-25 14:22:46
 * @LastEditors: cheng
 * @LastEditTime: 2023-05-11 16:29:19
 * @FilePath: \provider_temp_gen\lib\temps\component\model\model.dart
 * @ObjectDescription: model模板
 */
const model = r'''
import 'package:provider_base_tools/tools.dart';

import '../$stateName.dart';

class $nameModel extends BaseModel<$nameState> {
  $nameModel.getInstance(super.initial) : super.getInstance();

  @override
  bool get dataIsEmpty => false;

  @override
  List<VoidAsyncFunction> initFutures() {
    return [];
  }
}
''';
