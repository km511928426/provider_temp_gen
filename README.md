<!--
 * @Author: cheng
 * @Version: 1.0
 * @Date: 2023-04-25 13:04:14
 * @LastEditors: cheng
 * @LastEditTime: 2023-07-12 11:25:26
 * @FilePath: \provider_temp_gen\README.md
 * @ObjectDescription: 使用说明  window mac通用
-->
# provider_temp_gen

provider模版生成器
在$gen-path路径下生成一个$name文件夹,内包含模版文件

1. #### 安装    （window和mac通用）
    ```
    dart pub global activate provider_temp_gen
    ```
2. #### 使用
    ```
    provider_temp_gen -t 选择模板(stateless/statefull) -n 名称(必须是首字母小写,只能小写+下划线) 
    provider_temp_gen -n xxx (不选择模板默认InitBaseStatelessWidget,ps:需要集成provider_base_tools插件)
    ``` 

    执行结果
    ```
    file generated ==> ./test/test.dart
    file generated ==> ./test/bean/bean.dart
    file generated ==> ./test/model/model.dart
    file generated ==> ./test/model/model_contidion.dart
    file generated ==> ./test/page/view.dart
    file generated ==> ./test/page/widget.dart
    successfully
    ```
3. #### 参数解析  
    | 参数 | 简写 | 说明 | 默认值 |
    | - | - | - | - |
    | --templeate | -t | 要生成的模版 | stateless(继承StatelessWidget), stateful<继承StatefulWidget> |
    | --gen-path | -p | 要生成模版的位置 | . |
    | --name | -n | 模块名称(例: test_demo,about 等,会自动转换为TestDemo,About,命名规则:首字母小写,小写字母加下划线,会自动转换为驼峰命名,下划线命名,ps:页面名称会自动加上Page后缀,如:TestPage) | 无 |
    
    ```
    dart
    -t, --template     要生成的模版
                    [stateless(继承StatelessWidget), stateful<继承StatefulWidget>]
    -p, --gen-path     Where the template should be gen,要生成模版的位置
                    (defaults to ".")
    -n, --name         template name 模块名称(例: test_demo,about 等,会自动转换为TestDemo,About,命名规则:首字母小写,小写字母加下划线,会自动转换为驼峰命名,下划线命名,ps:页面名称会自动加上Page后缀,如:TestPage)
    -h, --[no-]help

    ```