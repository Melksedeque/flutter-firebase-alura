import 'package:flutter/material.dart';
import 'package:myapp/model/dish.dart';
import 'package:myapp/ui/_core/app_colors.dart';
import 'package:myapp/ui/_core/bag_provider.dart';
import 'package:provider/provider.dart' show Provider;

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    if (bagProvider.dishesOnBag.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text("Sacola")),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.backgroundDangerColor,
              border: Border.all(
                color: AppColors.borderDangerColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Sua sacola está vazia",
                    style: TextStyle(
                      color: AppColors.textDangerColor,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Sacola"),
        actions: [
          TextButton(
            onPressed: () {
              bagProvider.clearBag();
            },
            child: Text("Limpar"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Pedidos", textAlign: TextAlign.center),
              Column(
                children: List.generate(
                  bagProvider.getMapByAmount().keys.length,
                  (index) {
                    Dish dish =
                        bagProvider.getMapByAmount().keys.toList()[index];

                    return ListTile(
                      leading: Image.asset(
                        'assets/dishes/default.png',
                        height: 48.0,
                        width: 48.0,
                      ),
                      title: Text(dish.name),
                      subtitle: Text("R\$${dish.price.toStringAsFixed(2)}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              bagProvider.addAllDishes([dish]);
                            },
                            icon: Icon(Icons.add),
                          ),
                          Text(
                            bagProvider.getMapByAmount()[dish].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                          IconButton(
                            onPressed: () {
                              bagProvider.removeDish(dish);
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
