import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_pocket/domain/entities/transactions.dart';
import 'package:my_pocket/domain/repository/transactions_repo.dart';

class FirebaseTransactionsRepo implements TransactionRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> addTransaction(Transactions transaction) async {
    await _firestore.collection('transactions').add(transaction.toJson());
  }

  @override
  Future<void> updateTransaction(Transactions transaction) async {
    await _firestore.collection('transactions').doc(transaction.uid).update(transaction.toJson());
  }

  @override
  Future<void> deleteTransaction(String uid) async {
    await _firestore.collection('transactions').doc(uid).delete();
  }

  @override
  Future<List<Transactions>> fetchTransactions(String userId) {
    return _firestore.collection('transactions').where('userIdTransaction', isEqualTo: userId).get().then((snapshot) {
      return snapshot.docs.map((doc) => Transactions.fromJson(doc.data())).toList();
    });
  }

  @override
  Future<Transactions> fetchTransactionById(String uid) {
    return _firestore.collection('transactions').doc(uid).get().then((doc) {
      if (doc.exists) {
        return Transactions.fromJson(doc.data()!);
      } else {
        throw Exception('Transaction not found');
      }
    });
  }
}
