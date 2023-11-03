import 'package:dm00ss/screen_size.dart';
import 'package:dm00ss/style/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    ScreenSize screenSize = Provider.of<ScreenSize>(context);

    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Container(
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            color: themeProvider.currentAppTheme.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(30.0),
              topRight: const Radius.circular(30.0),
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                padding: EdgeInsets.all(10),
                height: screenSize.screenHeight * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      newsData[index].dateTime,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Expanded(
                      child: Text(
                        newsData[index].title,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    });
  }
}

class News {
  final String title;
  final String dateTime;

  News(this.title, this.dateTime);
}

List<News> newsData = [
  News("2023年50周年表揚大會", "2023/8/4 上午 11:47:34"),
  News("如何藻到適合自己的保健食品", "2023/8/4 下午 01:35:58 "),
  News("(A)二代健保補充保費是什麼？保險費率、保費試算懶人包一次看懂", "2022/3/6 下午 05:55:46"),
  News("8大護眼食物 吃出好眼力", "2022/3/6 下午 04:29:41"),
  News("數字看天下／直銷商人數創3年新高　為什麼？", "2021/6/25 下午 05:56:52 "),
  News("YOUTUBE", "2023/8/4 上午 11:47:34"),
  News("2019全球年會", "2023/8/4 上午 11:47:34"),
  News("2019 Happy New Year", "2023/8/4 上午 11:47:34"),
  News("2018最新消息!!!!!!", "2018/11/14 下午 06:47:01"),
  News("替自己加薪！　2016直銷人數創3年新高", "2018/11/12 下午 02:36:05 "),
  News("養好血管眼睛就不老！2大類最佳護眼食物", "2023/8/4 上午 11:47:34"),
  News("增強抵抗力對抗流感！10款高維他命C天然食材", "2023/8/4 上午 11:47:34"),
  News("2018", "2023/8/4 上午 11:47:34"),
  News("葡萄糖胺的功效? 你真的吃對了嗎?!", "2023/8/4 上午 11:47:34"),
  News("膝蓋骨沒力，吃這個就對了", "2023/8/4 上午 11:47:34"),
  News("蝸牛面膜特價中!! ", "2023/8/4 上午 11:47:34"),
  News("甘草：排肝毒、抗慢性發炎，美國列一級抗癌食材！", "2023/8/4 上午 11:47:34"),
  News("臺灣力匯有限公司從事多層次傳銷，招募限制行為能力人為傳銷商", "2023/8/4 上午 11:47:34"),
  News("2023年50周年表揚大會", "2023/8/4 上午 11:47:34"),
  News("2023年50周年表揚大會", "2023/8/4 上午 11:47:34"),
  News("2023年50周年表揚大會", "2023/8/4 上午 11:47:34"),
];
