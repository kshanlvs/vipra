import 'package:flutter/material.dart';
import 'package:vipratechuserauth/features/summary/models/summary_model.dart';
import 'package:provider/src/provider.dart';
import 'package:vipratechuserauth/features/summary/services/summary_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Order Summary")),
      body: FutureBuilder<SummaryModel?>(
        future: context.read<SummaryProvider>().getSummaryData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.summaryList?.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProductName(snapshot, index),
                      _buildProductPrice(snapshot, index),
                      _buildProductSummary(snapshot, index),
                    ],
                  ),
                )),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Text("Something went wrong");
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }

  OrderSummaryCard _buildProductSummary(
      AsyncSnapshot<SummaryModel?> snapshot, int index) {
    return OrderSummaryCard(
      keyText: "Purchase Date: ",
      valueText: snapshot.data?.summaryList?[index].purchaseDate ?? "",
    );
  }

  OrderSummaryCard _buildProductPrice(
      AsyncSnapshot<SummaryModel?> snapshot, int index) {
    return OrderSummaryCard(
      keyText: "Product Price: ",
      valueText: snapshot.data?.summaryList?[index].productPrice ?? "",
    );
  }

  OrderSummaryCard _buildProductName(
      AsyncSnapshot<SummaryModel?> snapshot, int index) {
    return OrderSummaryCard(
      keyText: "Product Name: ",
      valueText: snapshot.data?.summaryList?[index].productName ?? "",
    );
  }
}

class OrderSummaryCard extends StatelessWidget {
  final String? keyText;
  final String? valueText;
  const OrderSummaryCard({
    Key? key,
    this.keyText,
    this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            keyText ?? "",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          Text(
            valueText ?? "",
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
