const double kActionSize = 100;
const kSliderBarOptions = ['Đánh giá', 'Điểm cao', 'ĐHQG', 'Hot'];
const kTabBarOptions = [
  'rate',
  'maxTuition',
  'isNationalUniversity',
  'mixTuition'
];
const MAIN_COLLECTION = 'ListUniversity';

abstract class TabBarOptions {
  static const RATE = _Paths.RATE;
  static const MAX_TUITION = _Paths.MAX_TUITION;
  static const MIN_TUITION = _Paths.MIN_TUITION;
  static const NATIONAL_UNIVERSITY = _Paths.NATIONAL_UNIVERSITY;
}

abstract class _Paths {
  static const RATE = 'rate';
  static const MAX_TUITION = 'maxTuition';
  static const NATIONAL_UNIVERSITY = 'isNationalUniversity';
  static const MIN_TUITION = 'minTuition';
}
