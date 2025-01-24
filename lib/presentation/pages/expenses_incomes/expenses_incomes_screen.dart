import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/transactions.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';
import 'package:my_pocket/presentation/utils/utils.dart';

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
  final GlobalKey<FormState> _formKeyExpensesIncomes = GlobalKey<FormState>();

  final TextEditingController moneyController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  TransactionCategory categorySelected = TransactionCategory.others;

  void onSubmitForm() {
    if (_formKeyExpensesIncomes.currentState!.validate()) {
      final double money = double.parse(moneyController.value.text);
      final String date = dateController.value.text;

      log('Money: $money, Date: $date, Category: $categorySelected');
    }
  }

  @override
  void dispose() {
    super.dispose();
    moneyController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isHabitualPayment
            ? const Text('Añadir habitual')
            : Text(widget.isTypeIncome ? 'Añadir ingreso' : 'Añadir gasto'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Form(
            key: _formKeyExpensesIncomes,
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
                TextFormField(
                  controller: moneyController,
                  validator: moneyValidator,
                  keyboardAppearance: Brightness.dark,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: disBigTS,
                  decoration: InputDecoration(
                    hintText: '00.00',
                    errorStyle: smallRegularTS.copyWith(color: error500),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 10,
                    children: [
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.others,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.others),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.food,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.food),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.transport,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.transport),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.car,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.car),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.home,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.home),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.market,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.market),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.health,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.health),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.education,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.education),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.sport,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.sport),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.clothing,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.clothing),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.rent,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.rent),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.salary,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.salary),
                      ),
                      CategoryButtonSelection(
                        transacCategory: TransactionCategory.ocio,
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.ocio),
                      ),
                    ],
                  ),
                ),
                gapH32,
                const Text(
                  'Detalles',
                  style: bodyLargeRTS,
                ),
                gapH20,
                TextFormField(
                  controller: dateController,
                  validator: dateValidator,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                    hintText: 'Fecha',
                    prefixIcon: const Icon(CupertinoIcons.calendar),
                    errorStyle: smallRegularTS.copyWith(color: error500),
                    suffixIcon: const Icon(CupertinoIcons.chevron_up_chevron_down, size: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: neutral300),
                    ),
                  ),
                ),
                gapH64,
                MainButton(
                    text: 'Añadir',
                    onTap: () {
                      onSubmitForm();
                    }),
                gapH64,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
