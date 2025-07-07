enum TransactionType { income, expense }

extension TransactionTypeExtension on TransactionType {
  String toShortString() => name;

  static TransactionType fromString(String value) {
    return TransactionType.values.firstWhere((e) => e.name == value);
  }
}

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
  others,
}

extension TransactionCategoryExtension on TransactionCategory {
  String toShortString() => name;

  static TransactionCategory fromString(String value) {
    return TransactionCategory.values.firstWhere((e) => e.name == value);
  }
}

class Transactions {
  final String? uid;
  final String userIdTransaction;
  final TransactionType transactionType;
  final TransactionCategory transactionCategory;
  final double quantity;
  final DateTime whenTransaction;
  final DateTime createdAt;

  Transactions({
    this.uid,
    required this.userIdTransaction,
    required this.transactionType,
    required this.transactionCategory,
    required this.quantity,
    required this.whenTransaction,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      if (uid != null) 'uid': uid,
      'userIdTransaction': userIdTransaction,
      'transactionType': transactionType.toShortString(),
      'transactionCategory': transactionCategory.toShortString(),
      'quantity': quantity,
      'whenTransaction': whenTransaction.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      uid: json['uid'],
      userIdTransaction: json['userIdTransaction'],
      transactionType: TransactionTypeExtension.fromString(json['transactionType']),
      transactionCategory: TransactionCategoryExtension.fromString(json['transactionCategory']),
      quantity: (json['quantity'] as num).toDouble(),
      whenTransaction: DateTime.parse(json['whenTransaction']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
