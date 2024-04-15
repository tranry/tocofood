import 'package:flutter/material.dart';
import 'package:totofood/models/Purchase.dart';
import 'package:totofood/models/file_handle.dart';
import 'package:totofood/screens/cart/components/cart_card.dart';
import 'package:totofood/screens/cart/components/pdf_invoice.dart';
import 'package:totofood/screens/home/home_screen.dart';
import 'package:totofood/widgets/AppColor.dart';
import 'package:totofood/widgets/buttons.dart';
import 'package:totofood/widgets/large_buttons.dart';
import 'package:get/get.dart';

class PaymentPage extends StatelessWidget {
  static String routeName="/payment";
  PaymentPage({ Key? key ,required this.ds}) : super(key: key);
  List<Purchase> ds;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    double total = ds.fold(0, (previousValue, element) => previousValue + element.price);

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 80,left: 20,right:20),
        height: h,
        width: w,
        child: Column(
          children:[
            Container(
              width: double.maxFinite,
              height: h*0.14,
              decoration: BoxDecoration(
                image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage("assets/images/success.png")
                ))
            
            )
          ,
          Text(
            "Mua Thành Công!",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColor.mainColor,
            ),
          ),
          SizedBox(height:4),
          Text(
            "Thanh toán hoàn tất cho ${ds.length} sản phẩm",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColor.idColor,
            ),
          ),
          SizedBox(height: h*0.045),
          Container(
            height:160,
            width:350,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              border: Border.all(
                width:2,
                color: Colors.grey.withOpacity(0.5)
              )
            ),
            child:MediaQuery.removePadding(
              removeTop: true,
              context:context,
              child: ListView.builder(
                itemCount: ds.length,
                itemBuilder:(_,index){
                  return  Container(
                child: Column(
                  children: [
                    Row(
                      children:[
                        Container(
                          margin:const EdgeInsets.only(top:15,left: 20,bottom:10),
                          width: 50,
                          height:50,
                          child: Image.network(
                            'https://capcut.avashope.com/image/${ds[index].productName.idAnh.fileAnh}',
                            fit: BoxFit.cover,
                          ),
                          
                        )
                      ,
                      SizedBox(width:10)
                      ,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${ds[index].productName.tenSanPham}',
                            style:const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.mainColor,
                            ),
                          ),
                          SizedBox(height:10),
                          Text(
                            'Số lượng : ''${ds[index].count}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColor.idColor,
                            ),
                          ),
                        ],
                      ),
                      ]
                    )
                  ,
                  Divider(thickness:2,color:Colors.grey.withOpacity(0.5)),
                  
                  ],
                ),
              );
                      
                },
            
              ),
            )
            )
          ,
          SizedBox(height:15),
          Column(
            children: [
              Text(
              "Tổng Tiền",
              style: TextStyle(
                fontSize: 20,
                
                color: AppColor.idColor,
              ),
            ),
            SizedBox(height:10),
            Text(
              "$total",
              style: TextStyle(
                fontSize: 30,
                color: AppColor.mainColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            ] 
          )
          ,
          SizedBox(height: h * 0.06),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButtons(icon: Icons.share_sharp,onTap: (){},text: "Chia sẻ"),
              SizedBox(width: h*0.04),
              AppButtons(icon: Icons.print_outlined, onTap: ()  async {
                  // generate pdf file
                  final pdfFile = await PdfInvoice.generate();

                  // opening the pdf file
                  FileHandle.openFile(pdfFile);
              }, text: "Xuất hóa đơn"),
            ]
          )
          ,
          SizedBox(height: h * 0.02),
          AppLargeButtons(text: "Trở Lại",backgroundColor:Colors.white,textColor: AppColor.mainColor,
           onTap: () {
              Get.to(() => HomeScreen());
            })
          ]
        ),
      ),
    );
  }
}