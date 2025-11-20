import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  const QuantitySelector({
    super.key,
    this.initialQuantity = 1,
    this.minQuantity = 1,
    this.maxQuantity = 999,
    this.onChanged,
    this.onDelete,
  });

  final int initialQuantity;
  final int minQuantity;
  final int maxQuantity;
  final ValueChanged<int>? onChanged;
  final VoidCallback? onDelete;

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increment() {
    if (_quantity >= widget.maxQuantity) return;

    setState(() {
      _quantity++;
      widget.onChanged?.call(_quantity);
    });
  }

  void _decrement() {
    if (_quantity <= widget.minQuantity) {
      widget.onDelete?.call();
      return;
    }
    setState(() {
      _quantity--;
      widget.onChanged?.call(_quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 使用父容器的约束
        final double parentHeight = constraints.maxHeight;
        final double parentWidth = constraints.maxWidth;

        // 计算实际使用的尺寸（取最小值确保不溢出）
        final double actualHeight = parentHeight;
        final double actualWidth = parentWidth;

        // 根据父容器尺寸计算其他元素大小
        final double iconSize = actualHeight * 0.4;
        final double fontSize = actualHeight * 0.5;
        final double borderRadius = actualHeight * 0.15;

        final bool canIncrement = _quantity < widget.maxQuantity;

        return Container(
          height: actualHeight,
          width: actualWidth,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Row(
            children: [
              // 减号按钮 - 宽度占 30%
              _buildButton(
                icon: Icons.remove,
                onPressed: _decrement,
                width: actualWidth * 0.3,
                height: actualHeight,
                iconSize: iconSize,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                ),
              ),

              // 数量显示 - 宽度占 40%
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    '$_quantity',
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              // 加号按钮 - 宽度占 30%
              _buildButton(
                icon: Icons.add,
                onPressed: _increment,
                width: actualWidth * 0.3,
                height: actualHeight,
                iconSize: iconSize,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _buildButton({
  required IconData icon,
  required VoidCallback? onPressed,
  required double width,
  required double height,
  required double iconSize,
  required BorderRadius borderRadius,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: Material(
      borderRadius: borderRadius,
      color: Colors.grey[200],
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onPressed,
        child: Icon(icon, size: iconSize, color: Colors.grey[800]),
      ),
    ),
  );
}
