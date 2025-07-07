part of 'transaction_cubit.dart';

abstract class TransactionState {}

class TransactionInitial extends TransactionState {}

class TransactionLoading extends TransactionState {}

class TransactionSuccess extends TransactionState {
  final List<Transactions> transactions;

  TransactionSuccess(this.transactions);
}

class TransactionError extends TransactionState {
  final String message;

  TransactionError(this.message);
}
