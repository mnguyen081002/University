const double kActionSize = 100;
const kSliderBarOptions = ['Đánh giá', 'Điểm cao', 'ĐHQG', 'Hot'];
const kTabBarOptions = [
  'rate',
  'maxTuition',
  'isNationalUniversity',
  'mixTuition'
];
const MAIN_COLLECTION = 'ListUniversity';

abstract class FirebaseCollection {
  static const MAIN_COLLECTION = 'ListUniversity';
}

abstract class FirebaseField {
  static const KEYWORD = 'keyword';
  static const RATE = 'rate';
  static const MAX_TUITION = 'maxTuition';
  static const MIN_TUITION = 'isNationalUniversity';
  static const NATIONAL_UNIVERSITY = 'minTuition';
}
