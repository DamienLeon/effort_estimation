import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_tertiary/tertiary_providers.dart';
import 'package:software_estimation/data/globals.dart';
import 'package:software_estimation/data/resources/effort_input/secondary.dart';
import 'package:software_estimation/interface/tertiary/models/secondary/attribute_radio_tile.dar.dart';
import 'package:software_estimation/interface/tertiary/models/secondary/attributes.dart';
import 'hardware_attributes.dart';

class ProductAttributesScreen extends StatelessWidget {
  static String route = 'product_attribute_screen';

  final List<List<double>> productAttributesValues = new List.generate(
    kProductAttributeValues.length,
    (index) => getAttributeValuesList(kProductAttributeValues, index),
  );

  final List<List<String>> productAttributesLabels = new List.generate(
    kProductAttributeValues.length,
    (index) => getAttributeLabelsList(kProductAttributeValues, index),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Attributes'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rate the attributes according to given scale :",
                style: kTitleStyle,
              ),
              Consumer(
                builder: (context, watch, child) {
                  final productAttribute = watch(productAttributesProvider);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: productAttributesValues.length,
                    itemBuilder: (BuildContext context, int topIndex) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: kBorderRadius15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        kProductAttributes[topIndex],
                                        style: kLabelStyle,
                                      ),
                                      ListView.builder(
                                        physics: ClampingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            productAttributesValues[topIndex]
                                                .length,
                                        itemBuilder: (BuildContext context,
                                            int bottomIndex) {
                                          return AttributeRadioTile(
                                            color: productAttribute
                                                            .attributeLabelList[
                                                        topIndex] ==
                                                    productAttributesLabels[
                                                        topIndex][bottomIndex]
                                                ? kActiveColor
                                                : kInactiveColor,
                                            icon: productAttribute
                                                            .attributeLabelList[
                                                        topIndex] ==
                                                    productAttributesLabels[
                                                        topIndex][bottomIndex]
                                                ? Icons.radio_button_checked
                                                : Icons.radio_button_unchecked,
                                            selectedFactor:
                                                productAttributesLabels[
                                                    topIndex][bottomIndex],
                                            attributeFactorLabel:
                                                productAttributesLabels[
                                                    topIndex][bottomIndex],
                                            onRadioSelected: () {
                                              context
                                                  .read(
                                                      productAttributesProvider)
                                                  .setData(
                                                      productAttributesValues[
                                                              topIndex]
                                                          [bottomIndex],
                                                      productAttributesLabels[
                                                              topIndex]
                                                          [bottomIndex],
                                                      topIndex);
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                kDivider1,
                              ],
                            ),
                          ),
                          kDivider1,
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            print(context.read(productAttributesProvider).attributeValuesList);
            Navigator.pushNamed(context, HardwareAttributesScreen.route);
          },
          child: Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
