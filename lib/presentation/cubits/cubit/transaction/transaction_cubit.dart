import 'package:bloc/bloc.dart';
import 'package:my_pocket/domain/entities/transactions.dart';
import 'package:my_pocket/domain/repository/transactions_repo.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  final TransactionRepo transactionRepo;

  TransactionCubit({required this.transactionRepo}) : super(TransactionInitial());

  Future<void> fetchTransactions(String userId) async {
    try {
      emit(TransactionLoading());
      final transactions = await transactionRepo.fetchTransactions(userId);
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> addTransaction(Transactions transactionData) async {
    try {
      emit(TransactionLoading());
      await transactionRepo.addTransaction(transactionData);
      await fetchTransactions(transactionData.userIdTransaction);
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> updateTransaction(Transactions transactionData) async {
    try {
      emit(TransactionLoading());
      await transactionRepo.updateTransaction(transactionData);
      await fetchTransactions(transactionData.uid!);
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }

  Future<void> deleteTransaction(String transactionId, String uid) async {
    try {
      emit(TransactionLoading());
      await transactionRepo.deleteTransaction(transactionId);
      await fetchTransactions(uid);
    } catch (e) {
      emit(TransactionError(e.toString()));
    }
  }
}
