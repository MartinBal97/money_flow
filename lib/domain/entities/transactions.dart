enum TransactionType { income, expense }

enum TransactionCategory {
  food,
  transport,
  car,
  home,
  market,
  health,
  education,
  sport,
  clothing,
  rent,
  salary,
  ocio,
  others
}

class Transactions {
  final String uid;
  final String userIdTransaction;
  final TransactionType transactionType;
  final TransactionCategory transactionCategory;
  final double quantity;
  final bool habitualPayment;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transactions({
    required this.uid,
    required this.userIdTransaction,
    required this.transactionType,
    required this.transactionCategory,
    required this.quantity,
    required this.habitualPayment,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userIdTransaction': userIdTransaction,
      'transactionType': transactionType,
      'transactionCategory': transactionCategory,
      'quantity': quantity,
      'habitualPayment': habitualPayment,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Transactions.fromJson(Map<String, dynamic> jsonUser) {
    return Transactions(
      uid: jsonUser['uid'],
      userIdTransaction: jsonUser['userIdTransaction'],
      transactionType: jsonUser['transactionType'],
      transactionCategory: jsonUser['transactionCategory'],
      quantity: jsonUser['quantity'],
      habitualPayment: jsonUser['habitualPayment'],
      createdAt: jsonUser['createdAt'],
      updatedAt: jsonUser['updatedAt'],
    );
  }
}
