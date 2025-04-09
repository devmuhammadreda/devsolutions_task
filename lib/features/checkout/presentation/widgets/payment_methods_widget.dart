import '../../../../core/extensions/build_context.dart';
import '../../../../core/widgets/app_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/payment_method_entity.dart';
import 'payment_method_item_widget.dart';

class PaymentMethodsWidget extends StatefulWidget {
  const PaymentMethodsWidget({
    super.key,
    required this.initId,
    required this.onSelectPaymentMethod,
  });
  final String initId;
  final Function(String) onSelectPaymentMethod;
  @override
  State<PaymentMethodsWidget> createState() => _PaymentMethodsWidgetState();
}

class _PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {
  late String selectedPaymentMethod;
  late List<PaymentMethodEntity> _orderedPaymentMethods;

  @override
  void initState() {
    super.initState();
    selectedPaymentMethod = widget.initId;
    _orderedPaymentMethods = List.from(paymentMethods);
    _moveSelectedPaymentMethodToFirst(selectedPaymentMethod);
  }

  void _moveSelectedPaymentMethodToFirst(String id) {
    final selectedIndex = _orderedPaymentMethods.indexWhere(
      (method) => method.id == id,
    );
    if (selectedIndex > 0) {
      final selectedMethod = _orderedPaymentMethods.removeAt(selectedIndex);
      _orderedPaymentMethods.insert(0, selectedMethod);
    }
  }

  void onSelectPaymentMethod(String id) {
    setState(() {
      selectedPaymentMethod = id;
      _moveSelectedPaymentMethodToFirst(id);
    });
    widget.onSelectPaymentMethod(id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: 150.sp,
      child: ListView.separated(
        itemCount: _orderedPaymentMethods.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, __) => AppSpacer(),
        itemBuilder: (_, index) {
          PaymentMethodEntity paymentMethod = _orderedPaymentMethods[index];
          return PaymentMethodItemWidget(
            paymentMethod: paymentMethod,
            isSelected: selectedPaymentMethod == paymentMethod.id,
            onTap: () => onSelectPaymentMethod(paymentMethod.id),
          );
        },
      ),
    );
  }
}
