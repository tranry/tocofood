import 'package:totofood/pages/FrostedGlassBox.dart';
import 'package:totofood/pages/welcome_back.dart';
import 'package:totofood/widgets/AppColor.dart';
import 'package:totofood/widgets/app_text.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images=[
    "satayfood.jpg",
    "Pindang Telor.jpg"
  ];
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (_,item){
              if(item==0)
              {return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: LoadImage(item),
                child: Container(
                  margin: const EdgeInsets.only(top:100,left: 10,right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: [
                        const AppText(text: "COTO COTO",size: 50,weight: FontWeight.bold,col: AppColor.whiteHigh,),
                        const SizedBox(height: 12,),
                        const AppText(text: "Khám Phá Hương Vị Ẩm Thực",size: 20,weight: FontWeight.bold,col: AppColor.whiteLow,),
                        const SizedBox(
                          width: 250,
                          child: AppText(text: "Chỉ mất 30 phút để thưởng thức những món ăn chất lượng nhất từ COTO - mô hình bếp đa phong cách. Dù là giao hàng tận nơi hay dùng bữa tại chỗ, COTO luôn sẵn sàng mang đến cho bạn trải nghiệm ẩm thực tuyệt vời nhất!",size: 16,col: AppColor.white,textAlign: TextAlign.left,),
                        ),
                        const SizedBox(
                            height: 20
                        ),
                        FrostedGlassBox(
                          height: 45, width: 110,opacityleft: 1,opacityright:1,
                          child:
                          Container(
                            margin: const EdgeInsets.only(bottom: 10,left: 10),
                            child: GestureDetector(
      
                              onTap: () {
                                _pageController.animateToPage(1, duration: const Duration(milliseconds: 500), curve: Curves.ease);
                              },
                                child: Row(
                                  children:[
                                    const AppText(text: "Tiếp Tục",col: Colors.black,size: 16,),
                                    const SizedBox(width: 3),
                                    Container(
                                      width: 22,
                                      height: 19,
                                      decoration: LoadImageContinue(),
                                    )
                                  ] ),),
                          ),),
                      ],
                    ),
                    Row(
                      children: [
                        NavigationView(_,item)
                      ],
                    )
                  ],
                  ),
      
                ),
              );}
              else {
      
                return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: LoadImage(item),
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.only(top:100),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.center,
                          children: [
                            WellComeBack()
      
      
                          ],
                        ),
                        Row(
                          children: [
                            NavigationView(_,item)
                          ],
                        )
                      ],
                    ),
      
                  ),
                ),
              );}
        }),
    );
  }

  Widget NavigationView(BuildContext context,int item)
  {
    return Container(
      margin: const EdgeInsets.only(left: 170,right: 20,bottom: 30),
      child: Row(

        children:List.generate(2, (indexView){
          return Container(
            margin: const EdgeInsets.only(right: 2),
            width: item==indexView?20:8,
            height: 8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: item==indexView?AppColor.green:AppColor.green.withOpacity(0.6)
            ),
          );
        })
        ,
      ),
    );
  }

 BoxDecoration LoadImage(int item) {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                "assets/images/"+images[item]
            ),
            fit: BoxFit.cover
        )
    );
 }
  BoxDecoration LoadImageContinue() {
    return const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
                "assets/images/skip-track.png"
            ),
            fit: BoxFit.cover
        )
    );
  }
}
