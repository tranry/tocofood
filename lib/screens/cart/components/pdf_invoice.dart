import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:totofood/models/CounterController.dart';
import 'package:totofood/models/Purchase.dart';
import 'package:totofood/models/TableData.dart';
import 'package:totofood/models/file_handle.dart';
import 'package:printing/printing.dart';
import 'package:get/get.dart';
class PdfInvoice {
  static Future<File> generate() async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();
    final iconImage =
        (await rootBundle.load('assets/images/logocoto.png')).buffer.asUint8List();

    final tableHeaders = [
      'Tên sản phẩm',
      'Số lượng',
      'Giá',
      'VAT',
      'Tổng',
    ];
    final tableData = <List<String>>[for (var element in purchases) [
      element.productName.tenSanPham.toString(),
      element.count.toString(),
      '${element.productName.giaBan}đ',
      '10 %',
      '${((element.count * element.productName.giaBan * 10) / 100).toString()}',
    ]];

    double totalAll = purchases.fold(0, (previousValue, element) => previousValue+element.price);
    pdf.addPage(
      pw.MultiPage(
        build: (context) {
          return [
            pw.Row(
              children: [
                pw.Image(
                  pw.MemoryImage(iconImage),
                  height: 72,
                  width: 72,
                ),
                pw.SizedBox(width: 1 * PdfPageFormat.mm),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'HÓA ĐƠN',
                      style: pw.TextStyle(
                        fontSize: 17.0,
                        fontWeight: pw.FontWeight.bold,
                        font: font
                      ),
                    ),
                    pw.Text(
                      'Thông tin chi tiết',
                      style: pw.TextStyle(
                        fontSize: 15.0,
                        color: PdfColors.grey700,font: font
                      ),
                    ),
                  ],
                ),
                pw.Spacer(),
                pw.Column(
                  mainAxisSize: pw.MainAxisSize.min,
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'admin',
                      style: pw.TextStyle(
                        fontSize: 15.5,
                        fontWeight: pw.FontWeight.bold,font: font
                      ),
                    ),
                    pw.Text(
                      'john@gmail.com',style: pw.TextStyle(
                        font: font
                    ),
                    ),
                    pw.Text(
                      DateTime.now().toString(),style: pw.TextStyle(
                       font: font
                    ),
                    ),
                  ],
                ),
              ],
            ),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Divider(),
            pw.SizedBox(height: 1 * PdfPageFormat.mm),
            pw.Text(
              'Cảm ơn quý khách đã lựa chọn sản phẩm của chúng tôi! \nChúng tôi rất trân trọng sự ủng hộ của quý khách và hy vọng rằng bạn sẽ hài lòng với sản phẩm của mình.', style: pw.TextStyle(font: font),
              textAlign: pw.TextAlign.justify,
            ),
            pw.SizedBox(height: 5 * PdfPageFormat.mm),

            ///
            /// PDF Table Create
            ///
            pw.Table.fromTextArray(
              headers: tableHeaders,
              data: tableData,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold,font: font),
              headerDecoration:
                  const pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 30.0,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.centerRight,
                2: pw.Alignment.centerRight,
                3: pw.Alignment.centerRight,
                4: pw.Alignment.centerRight,
              },cellStyle: pw.TextStyle(font: font)
            ),
            pw.Divider(),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Row(
                children: [
                  pw.Spacer(flex: 6),
                  pw.Expanded(
                    flex: 4,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Tổng tiền',
                                style: pw.TextStyle(
                                  font: font,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              '$totalAll',
                              style: pw.TextStyle(
                                font: font,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Vat 10 %',
                                style: pw.TextStyle(
                                  font: font,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              '${(totalAll*0.1).toStringAsFixed(2)}',
                              style: pw.TextStyle(font: font,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.Divider(),
                        pw.Row(
                          children: [
                            pw.Expanded(
                              child: pw.Text(
                                'Thành Tiền',
                                style: pw.TextStyle(
                                  font: font,
                                  fontSize: 14.0,
                                  fontWeight: pw.FontWeight.bold,
                                ),
                              ),
                            ),
                            pw.Text(
                              '${totalAll - totalAll*0.1}đ',
                              style: pw.TextStyle(font: font,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 2 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                        pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
                        pw.Container(height: 1, color: PdfColors.grey400),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
        footer: (context) {
          return pw.Column(
            mainAxisSize: pw.MainAxisSize.min,
            children: [
              pw.Divider(),
              pw.SizedBox(height: 2 * PdfPageFormat.mm),
              pw.Text(
                'Toco Toco',
                style: pw.TextStyle(fontWeight: pw.FontWeight.bold,font: font),
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Địa chỉ : ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold,font: font),
                  ),
                  pw.Text(
                    '96 Dinh Cong', style: pw.TextStyle(font: font)
                  ),
                ],
              ),
              pw.SizedBox(height: 1 * PdfPageFormat.mm),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Email: ',
                    style: pw.TextStyle(fontWeight: pw.FontWeight.bold,font: font),
                  ),
                  pw.Text(
                    'www@gmail.com', style: pw.TextStyle(font: font)
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return FileHandle.saveDocument(name: 'hoadon.pdf', pdf: pdf);
  }
}
