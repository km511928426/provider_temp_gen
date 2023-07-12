import 'dart:async';
import 'dart:io';
import 'package:provider_temp_gen/lock.dart';

import 'config.dart';
import 'temps/component.dart' as component;
import 'temps/provider.dart' as provider;

class ProviderTempGen {
  final String name;
  final Temp temp;
  final String psiPath;
  final Lock _lock = Lock();

  ProviderTempGen({
    required this.name,
    required this.psiPath,
    required this.temp,
  });

  List<Future<void>> generate() {
    switch (temp) {
      case Temp.provider:
        return _generateComponent(Temp.provider);
      case Temp.stateless:
        return _generateComponent(Temp.stateless);
      case Temp.stateful:
        return _generateComponent(Temp.stateful);
    }
  }

  List<Future<void>> _generateComponent(Temp temp) {
    final List<Future<void>> futures = <Future<void>>[];
    // final String subPackage = _hump2Underline(name);
    final String subPackage = name;

    futures.add(_generateFile(
        temp == Temp.provider ? component.componet : provider.provider,
        '$psiPath/$subPackage',
        '$subPackage.dart'));
    futures.add(_generateFile(
        temp == Temp.provider ? component.bean : provider.bean,
        '$psiPath/$subPackage/bean',
        'bean.dart'));
    futures.add(_generateFile(
        temp == Temp.provider ? component.model : provider.model,
        '$psiPath/$subPackage/model',
        'model.dart'));
    futures.add(_generateFile(
        temp == Temp.provider
            ? component.modelCondition
            : provider.modelCondition,
        '$psiPath/$subPackage/model',
        'model_contidion.dart'));
    // futures.add(_generateFile(
    //     component.modelGet, '$psiPath/$subPackage/model', 'model_get.dart'));
    // futures.add(_generateFile(
    //     component.modelSet, '$psiPath/$subPackage/model', 'model_set.dart'));
    // --------------
    // futures.add(_generateFile(
    //     temp == Temp.stateless ? component.stateless : component.stateful,
    //     '$psiPath/$subPackage/page',
    //     'view.dart'));
    // futures.add(_generateFile(
    //     temp == Temp.stateless
    //         ? component.statelessWidget
    //         : component.statefulWidget,
    //     '$psiPath/$subPackage/page',
    //     'widget.dart'));
    futures.add(_generateFile(
        temp == Temp.provider
            ? component.stateless
            : temp == Temp.stateful
                ? provider.stateful
                : provider.stateless,
        '$psiPath/$subPackage/page',
        'view.dart'));
    futures.add(_generateFile(
        temp == Temp.provider ? component.statelessWidget : provider.widget,
        '$psiPath/$subPackage/page',
        'widget.dart'));
    futures.add(_generateFile(
        temp == Temp.provider ? component.state : provider.state,
        '$psiPath/$subPackage/state',
        'state.dart'));
    return futures;
  }

  Future<void> _generateFile(String content, String filePath, String fileName) {
    content = _dealFile(content);
    return _write2File(content, filePath, fileName);
  }

  String _dealFile(String content) {
    content = content.replaceAll(r'$name', _upTolower(name));
    // content = content.replaceAll(r'$subName', _hump2Underline(name));
    content = content.replaceAll(r'$stateName', name);
    return content;
  }

  Future<void> _write2File(
      String content, String filepath, String filename) async {
    return _lock.mutex(() async {
      try {
        final Directory folder = Directory(filepath);
        if (!await folder.exists()) {
          await folder.create();
        }
        final File file = File('$filepath/$filename');
        if (!await file.exists()) {
          await file.create();
        } else {
          throw Exception('已存在$filename文件!');
        }

        await file.writeAsString(content);
        print('file generated ==> ${file.path}');
      } catch (e) {
        print(e);
      }
    });
  }

  /// 驼峰转下横线
  // String _hump2Underline(String para) {
  //   String newString = '';
  //   if (!para.contains('_')) {
  //     for (int i = 0; i < para.length; i++) {
  //       if (charIsUpperCase(para[i])) {
  //         newString += '_${para[i].toLowerCase()}';
  //       } else {
  //         newString += para[i];
  //       }
  //     }
  //   }
  //   if (newString[0] == '_') {
  //     return newString.substring(1);
  //   } else {
  //     return newString;
  //   }
  // }

  // 下划线转驼峰
  String _upTolower(String para) {
    String newString = '';
    para.split('_').forEach((element) {
      newString += element.substring(0, 1).toUpperCase() +
          element.substring(1).toLowerCase();
    });
    return para.contains('_')
        ? newString
        : para.substring(0, 1).toUpperCase() + para.substring(1).toLowerCase();
  }

  ///判断是否是大写
  bool charIsUpperCase(String c) {
    return c == c.toUpperCase();
  }
}
