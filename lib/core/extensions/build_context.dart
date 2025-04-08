import 'package:flutter/material.dart';

import '../../l10n/messages.dart';

extension Translations on BuildContext {
  S get translate => S.of(this);
}
