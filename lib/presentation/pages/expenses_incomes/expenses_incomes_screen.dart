import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/transactions.dart';
import 'package:my_pocket/presentation/common_widgets/buttons_widgets.dart';
import 'package:my_pocket/presentation/cubits/cubit/auth/auth_cubit.dart';
import 'package:my_pocket/presentation/utils/utils.dart';

class ExpensesIncomesScreen extends StatefulWidget {
  final bool isTypeIncome;

  const ExpensesIncomesScreen({
    super.key,
    required this.isTypeIncome,
  });

  @override
  State<ExpensesIncomesScreen> createState() => _ExpensesIncomesScreenState();
}

class _ExpensesIncomesScreenState extends State<ExpensesIncomesScreen> {
  final GlobalKey<FormState> _formKeyExpensesIncomes = GlobalKey<FormState>();

  final TextEditingController moneyController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  TransactionCategory categorySelected = TransactionCategory.others;

  @override
  void initState() {
    super.initState();
    //* Set the current date in the dateController
    dateController.text =
        '${DateTime.now().day}/${DateTime.now().month < 10 ? '0${DateTime.now().month}' : DateTime.now().month}/${DateTime.now().year}';
  }

  @override
  void dispose() {
    super.dispose();
    moneyController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<AuthCubit>().currentUser;

    void onSubmitForm() {
      if (_formKeyExpensesIncomes.currentState!.validate()) {
        final String moneyS = moneyController.text.replaceAll(',', '.');
        final double money = double.parse(moneyS);
        final String date = dateController.value.text;

        final Transactions userTransaction = Transactions(
          uid: 'asdfasf',
          userIdTransaction: currentUser!.uid,
          quantity: money,
          transactionCategory: categorySelected,
          transactionType: widget.isTypeIncome ? TransactionType.income : TransactionType.expense,
          whenTransaction: DateTime.parse(date),
          createdAt: DateTime.now(),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isTypeIncome ? 'Añadir ingreso' : 'Añadir gasto'),
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
                    children: List.generate(
                      TransactionCategory.values.length,
                      (index) => CategoryButtonSelection(
                        transacCategory: TransactionCategory.values[index],
                        transacCategorySelected: categorySelected,
                        onTap: () => setState(() => categorySelected = TransactionCategory.values[index]),
                      ),
                    ),
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
                MainButton(text: 'Añadir', onTap: () => onSubmitForm()),
                gapH64,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
