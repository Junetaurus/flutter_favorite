import 'package:flutter_favorite/ui/common/size_fit.dart';

extension DoubleFit on double {

  double get px {
    return SizeFit.setPx(this);
  }

  double get rpx {
    return SizeFit.setRpx(this);
  }

}