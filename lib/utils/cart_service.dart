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

  // User information
  void setCurrentUser() {}

  //setters
  void setTime(String time) {
    this.time = time;
  }

  void setDate(String date) {
    this.date = date;
  }

  //getters
  get getDate => date;
  get getTime => time;
}
