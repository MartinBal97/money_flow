import 'package:my_pocket/domain/entities/transactions.dart';

abstract class TransactionRepo {
  Future<List<Transactions>> fetchTransactions(String uid);
  Future<void> addTransaction(Transactions transaction);
  Future<void> updateTransaction(Transactions transaction);
  Future<void> deleteTransaction(String transactionId);
  Future<Transactions> fetchTransactionById(String uid);
}
