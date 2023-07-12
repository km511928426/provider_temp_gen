/*
 * @Author: cheng
 * @Version: 1.0
 * @Date: 2023-04-25 13:04:14
 * @LastEditors: cheng
 * @LastEditTime: 2023-07-12 10:33:52
 * @FilePath: \provider_temp_gen\bin\provider_temp_gen.dart
 * @ObjectDescription: 
 */
import 'dart:io';

import 'package:args/args.dart';
import 'package:provider_temp_gen/provider_temp_gen.dart' as provider_temp_gen;
import 'package:provider_temp_gen/config.dart' as provider_temp_gen_config;

void main(List<String> args) async {
  try {
    final parser = ArgParser();

    parser.addOption(
      'template',
      abbr: 't',
      defaultsTo: 'page',
      help: 'provider template name',
      allowed: [
        'provider',
        'stateful',
        'stateless',
      ],
    );

    parser.addOption('gen-path',
        abbr: 'p',
        defaultsTo: '.',
        help: 'Where the template should be gen',
        valueHelp: './test');
    parser.addOption('name',
        abbr: 'n', help: 'template name', valueHelp: 'TestPage');

    parser.addFlag(
      'help',
      abbr: 'h',
    );

    final result = parser.parse(args);
    if (args.isEmpty) {
      print(parser.usage);
      exit(1);
    }

    if (result['help'] == true) {
      print(parser.usage);
      exit(1);
    }

    var matcher = RegExp(r'^[a-z][a-z_]{3,50}$');

    final name = result['name'];
    final genPath = result['gen-path'];
    final temp = provider_temp_gen_config.convertTemp(result['template']);
    if ((name as String?)?.isNotEmpty != true) {
      print('name 不能为空');
      exit(2);
    }

    if (!matcher.hasMatch(name ?? '')) {
      print('name 首字母必须小写');
      exit(2);
    }
    if ((genPath as String?)?.isNotEmpty != true) {
      print('生成路径 不能为空');
      exit(2);
    }
    if (temp == null) {
      print('模版不能为空');
      exit(2);
    }

    final futures = provider_temp_gen.ProviderTempGen(
            psiPath: genPath!, name: name!, temp: temp)
        .generate();

    await Future.wait(futures);
    print('successfully');
    exit(0);
  } catch (e) {
    print(e);
    exit(2);
  }
}

// extension StringExt on String {
//   bool? isUpperCase() {
//     String first = substring(0, 1);
//     String second = substring(0, 1);
//     return first == second.toUpperCase();
//   }
// }
