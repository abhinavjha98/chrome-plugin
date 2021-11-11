class SmsModel {
  String status;
  String message;

  static SmsModel fromMap(Map<String, dynamic> map) {
    var _faq = SmsModel();
    try {
      _faq.status = map['status'];
      _faq.message = map['message'];
    } catch (err) {
      print(err);
    }
    return _faq;
  }
}
