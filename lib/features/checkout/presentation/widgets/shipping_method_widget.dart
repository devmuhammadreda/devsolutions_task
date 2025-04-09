import 'package:devsolutions_task/core/extensions/build_context.dart';
import 'package:devsolutions_task/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/global/enums.dart';
import 'shipping_method_item_widget.dart';

class ShippingMethodWidget extends StatefulWidget {
  const ShippingMethodWidget({
    super.key,
    required this.initVal,
    required this.onChanged,
  });
  final ShippingMethod initVal;
  final Function(ShippingMethod) onChanged;

  @override
  State<ShippingMethodWidget> createState() => _ShippingMethodWidgetState();
}

class _ShippingMethodWidgetState extends State<ShippingMethodWidget> {
  late ShippingMethod _selectedShippingMethod;
  @override
  void initState() {
    super.initState();
    _selectedShippingMethod = widget.initVal;
  }

  void _onShippingMethodChanged(ShippingMethod value) {
    setState(() {
      _selectedShippingMethod = value;
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      padding: EdgeInsets.all(2.sp),
      decoration: BoxDecoration(
        color: ColorsManager.lightGrey,
        borderRadius: BorderRadius.circular(80.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: ShippingMethodItemWidget(
              shippingMethod: ShippingMethod.homeDelivery,
              isSelected:
                  _selectedShippingMethod == ShippingMethod.homeDelivery,
              onTap:
                  () => _onShippingMethodChanged(ShippingMethod.homeDelivery),
            ),
          ),
          Expanded(
            child: ShippingMethodItemWidget(
              shippingMethod: ShippingMethod.pickInStore,
              isSelected: _selectedShippingMethod == ShippingMethod.pickInStore,
              onTap: () => _onShippingMethodChanged(ShippingMethod.pickInStore),
            ),
          ),
        ],
      ),
    );
  }
}
