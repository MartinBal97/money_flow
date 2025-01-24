import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/transactions.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';

class ExpensesIncomesScreen extends StatefulWidget {
  final bool isTypeIncome;
  final bool isHabitualPayment;

  const ExpensesIncomesScreen({
    super.key,
    required this.isTypeIncome,
    required this.isHabitualPayment,
  });

  @override
  State<ExpensesIncomesScreen> createState() => _ExpensesIncomesScreenState();
}

class _ExpensesIncomesScreenState extends State<ExpensesIncomesScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isHabitualPayment
            ? const Text('Añadir habitual')
            : Text(
                widget.isTypeIncome ? 'Añadir ingreso' : 'Añadir gasto',
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gapH32,
            const Text(
              'Ingresá el monto:',
              style: bodyLargeRTS,
            ),
            gapH32,
            const Text(
              'Total',
              style: bodySmallRTS,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: '00.00',
                hintStyle: disBigTS.copyWith(color: neutral300),
                prefixIcon: const Icon(CupertinoIcons.money_dollar, size: 35, color: black),
                prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                contentPadding: EdgeInsets.zero,
              ),
            ),
            gapH32,
            const Text(
              'Selecioná una categoría',
              style: bodyLargeRTS,
            ),
            gapH24,
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              child: Row(
                spacing: 10,
                children: [
                  CategoryButtonSelection(transactionCategory: TransactionCategory.food),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.transport),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.car),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.home),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.market),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.health),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.education),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.sport),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.clothing),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.rent),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.salary),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.ocio),
                  CategoryButtonSelection(transactionCategory: TransactionCategory.others),
                ],
              ),
            ),
            gapH32,
            const Text(
              'Detalles',
              style: bodyLargeRTS,
            ),
            const Spacer(),
            MainButton(text: 'Añadir', onTap: () {}),
            gapH64,
          ],
        ),
      ),
    );
  }
}
