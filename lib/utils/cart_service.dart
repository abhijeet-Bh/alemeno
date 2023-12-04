import 'package:alemeno/features/home/domain/entities/test_entity.dart';

class CartService {
  // Private constructor to prevent direct instantiation
  CartService._();

  // Singleton instance
  static final CartService _instance = CartService._();

  // Factory constructor to provide access to the instance
  factory CartService() {
    return _instance;
  }

  //variables
  String? date;
  String? time;
  TestEntity? test;

  // User information
  void setCurrentUser() {}

  //setters
  void setTime(String time) {
    this.time = time;
  }

  void setDate(String date) {
    this.date = date;
  }

  void setTest(TestEntity test) {
    this.test = test;
  }

  void emptyCart() {
    date = null;
    time = null;
    test = null;
  }

  //getters
  get getDate => date;
  get getTime => time;
  get getTest => test;

  bool isCartEmpty() {
    if (test == null) {
      return true;
    } else {
      return false;
    }
  }

  bool isDateTimeEmpty() {
    if (date == null || time == null) {
      return true;
    } else {
      return false;
    }
  }
}
