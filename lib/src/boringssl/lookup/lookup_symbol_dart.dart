// Copyright 2020 Google LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:ffi';
import 'symbols.generated.dart';
import 'utils.dart';

/// Dynamically load `webcrypto_lookup_symbol` function.
final Pointer<Void> Function(Sym) lookupSymbol = () {
  final lookup = lookupLibraryInDotDartTool();
  if (lookup != null) {
    return lookup;
  }

  throw UnsupportedError(
    'package:webcrypto cannot be used from Dart or `pub run test` '
    'unless `flutter pub run webcrypto:setup` has been run for the current '
    'root project.',
  );
}();
