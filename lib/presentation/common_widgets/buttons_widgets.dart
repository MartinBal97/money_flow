import 'package:flutter/material.dart';
import 'package:my_pocket/core/constans/app_sizes.dart';
import 'package:my_pocket/core/theme/app_theme.dart';
import 'package:my_pocket/domain/entities/transactions.dart';

class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? backGroundcolor;
  final Color? textColor;

  const MainButton({
    super.key,
    required this.text,
    this.onTap,
    this.backGroundcolor = blue500,
    this.textColor = white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(Sizes.p12)),
          ),
          backgroundColor: WidgetStatePropertyAll(backGroundcolor),
        ),
        onPressed: onTap,
        child: Text(text, style: buttonsTS.copyWith(color: textColor)),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Widget widget;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.widget,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(color: aliceBlue, borderRadius: BorderRadius.circular(12)),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget,
            Text(text, style: bodySmallRTS.copyWith(color: blue500)),
          ],
        ),
      ),
    );
  }
}

class CategoryButtonSelection extends StatelessWidget {
  final TransactionCategory transacCategory;
  final TransactionCategory transacCategorySelected;
  final VoidCallback onTap;

  const CategoryButtonSelection({
    super.key,
    required this.transacCategory,
    required this.transacCategorySelected,
    required this.onTap,
  });

  List get categoriesOptions {
    switch (transacCategory) {
      case TransactionCategory.food:
        return [Icons.fastfood, 'Comida'];
      case TransactionCategory.transport:
        return [Icons.directions_bus, 'Transporte'];
      case TransactionCategory.car:
        return [Icons.directions_car, 'Auto'];
      case TransactionCategory.home:
        return [Icons.home, 'Casa'];
      case TransactionCategory.market:
        return [Icons.shopping_cart, 'Mercado'];
      case TransactionCategory.health:
        return [Icons.local_hospital, 'Salud'];
      case TransactionCategory.education:
        return [Icons.school, 'Educación'];
      case TransactionCategory.sport:
        return [Icons.sports_soccer, 'Deporte'];
      case TransactionCategory.clothing:
        return [Icons.shopping_bag, 'Ropa'];
      case TransactionCategory.rent:
        return [Icons.house, 'Alquiler'];
      case TransactionCategory.salary:
        return [Icons.monetization_on, 'Salario'];
      case TransactionCategory.ocio:
        return [Icons.movie, 'Ocio'];
      case TransactionCategory.others:
        return [Icons.more_horiz, 'Otros'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: blue200,
              shape: BoxShape.circle,
              border: transacCategory == transacCategorySelected ? Border.all(color: blue500, width: 3) : null,
            ),
            child: Icon(categoriesOptions.first, color: blue500, size: 56 * 0.5),
          ),
          Text(categoriesOptions.last, style: smallRegularTS),
        ],
      ),
    );
  }
}
