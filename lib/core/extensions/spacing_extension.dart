import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension SpacingExtension on num {
  Widget get ph => SizedBox(height: h);
  Widget get pw => SizedBox(width: w);
}
