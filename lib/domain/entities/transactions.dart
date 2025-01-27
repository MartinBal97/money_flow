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
  final DateTime whenTransaction;
  final DateTime createdAt;

  Transactions({
    required this.uid,
    required this.userIdTransaction,
    required this.transactionType,
    required this.transactionCategory,
    required this.quantity,
    required this.whenTransaction,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'userIdTransaction': userIdTransaction,
      'transactionType': transactionType,
      'transactionCategory': transactionCategory,
      'quantity': quantity,
      'whenTransaction': whenTransaction,
      'createdAt': createdAt,
    };
  }

  factory Transactions.fromJson(Map<String, dynamic> jsonUser) {
    return Transactions(
      uid: jsonUser['uid'],
      userIdTransaction: jsonUser['userIdTransaction'],
      transactionType: jsonUser['transactionType'],
      transactionCategory: jsonUser['transactionCategory'],
      quantity: jsonUser['quantity'],
      whenTransaction: jsonUser['whenTransaction'],
      createdAt: jsonUser['createdAt'],
    );
  }
}
