import 'dart:typed_data';

import 'package:apidemo/product_model.dart';
import 'package:flutter/material.dart' as mat;
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';

Future<Uint8List> makePdf(ProductModel product) async {
  final pdf = Document();
  final imageLogo = MemoryImage(
      (await NetworkAssetBundle(Uri.parse("${product.image.toString()}"))
              .load(""))
          .buffer
          .asUint8List());
  pdf.addPage(
    Page(
      build: (context) {
        return Column(children: [
          Container(height: 50),
          Table(
            border: TableBorder.all(color: PdfColors.black),
            children: [
              TableRow(
                children: [
                  Padding(
                    child: Text(
                      'INVOICE ',
                      style: Theme.of(context).header4,
                      textAlign: TextAlign.center,
                    ),
                    padding: EdgeInsets.all(20),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Expanded(
                    child: PaddedText(product.id.toString()),
                    flex: 2,
                  ),
                  Expanded(
                    child:Image(imageLogo),
                    flex: 1,
                  )
                ],
              ),  TableRow(
                children: [
                  Expanded(
                    child: PaddedText(product.title.toString()),
                    flex: 2,
                  ),
                  Expanded(
                    child: PaddedText('\$${product.price}'),
                    flex: 1,
                  )
                ],
              ),
              TableRow(
                children: [
                  Expanded(
                    child: PaddedText(product.description.toString()),
                    flex: 2,
                  ),
                ],
              ),
              TableRow(
                children: [
                  Expanded(
                    child: PaddedText(product.category.toString()),
                    flex: 2,
                  ),
                  Expanded(
                    child: PaddedText('\$${product.price}'),
                    flex: 1,
                  )
                ],
              ),
              TableRow(
                children: [
                  Expanded(
                    child: PaddedText(product.rating!.count.toString()),
                    flex: 2,
                  ),
                  Expanded(
                    child: PaddedText(product.rating!.rate.toString()),
                    flex: 1,
                  )
                ],
              ),
            ],
          ),
        ]);
      },
    ),
  );
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
