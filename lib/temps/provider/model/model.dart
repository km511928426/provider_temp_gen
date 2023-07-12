const model = r'''
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../$stateName.dart';
  
class $nameModel with ChangeNotifier,DiagnosticableTreeMixin{
    final state = $nameState();
  }

''';
