import 'package:flutter/material.dart';

void main() => runApp(RedNoteApp());

class PostDetailPage extends StatefulWidget {
  final Map<String, dynamic> post;

  PostDetailPage({required this.post});

  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  bool isFollowing = false;

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        titleSpacing: 16,
        title: Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/avatar 1.png'),
            ),
            SizedBox(width: 8),
            Text(widget.post['user'], style: TextStyle(fontSize: 16)),
            Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isFollowing = !isFollowing;
                });
              },
              child: Container(
                height: 28,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: isFollowing ? Colors.grey.shade300 : Colors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    isFollowing ? 'Following' : 'Follow',
                    style: TextStyle(
                      color: isFollowing ? Colors.black : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            IconButton(
              icon: Icon(Icons.ios_share, size: 20), // iOS-style share icon
              onPressed: () {
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post['image'] != null)
              Image.asset(
                post['image'],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(post['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  Text(
                    post['content'] ?? '',
                    style: TextStyle(fontSize: 14, height: 1.6),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.edit, color: Colors.grey.shade600, size: 20),
                    hintText: 'Comment',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
            SizedBox(width: 12),
            Row(
              children: [
                Icon(Icons.favorite_border, size: 20, color: Colors.black),
                SizedBox(width: 4),
                Text('${post['likes']}', style: TextStyle(fontSize: 14)),
                SizedBox(width: 16),
                Icon(Icons.star_border, size: 20, color: Colors.black),
                SizedBox(width: 4),
                Text('422', style: TextStyle(fontSize: 14)),
                SizedBox(width: 16),
                Icon(Icons.chat_bubble_outline, size: 20, color: Colors.black),
                SizedBox(width: 4),
                Text('677', style: TextStyle(fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RedNoteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RedNoteHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RedNoteHome extends StatefulWidget {
  @override
  _RedNoteHomeState createState() => _RedNoteHomeState();
}

class _RedNoteHomeState extends State<RedNoteHome> with SingleTickerProviderStateMixin {
  int selectedTopTab = 1; // 0 = Follow, 1 = Explore, 2 = Nearby

  final List<Map<String, dynamic>> posts = [
  {
    'title': '治愈系卡通壁纸',
    'user': '莱米',
    'likes': 205,
    'image': 'assets/picture 1.png',
    'content': '今日份哆啦A梦壁纸来啦💙\n\n哆啦A梦是我小时候最喜欢的卡通啦～\n每次看到都会觉得超级治愈🥹🥹\n赶紧换上做手机壁纸吧📱✨\n\n#今日壁纸分享   #哆啦a梦   #哆啦A梦壁纸\n#寻找哆啦A梦   #可爱卡通壁纸\n#生活中的小碎片   #想分享点什么\n#用小红书记录点滴生活   #一些片刻   #清清日常库存',
  },
  {
    'title': '🇲🇾CHAGEE🆕低咖啡因奶茶！🥤🍃',
    'user': '拉拉熊本熊',
    'likes': 81,
    'image': 'assets/picture 2.png',
    'content': '🫵今天刚上新品，我朋友一拉我就冲去试了！！\n👀❓一个完全不能接受Genmai🍵的人，居然觉得这次可以！！因为这次Houjicha（焙茶）的味道更突出，茶香超级浓郁！！🤤而且两个味道融合得很自然，整体喝起来很清新舒服～🍃',
  },
  {
    'title': '🇲🇾｜Chagee新周边又来了！',
    'user': '嘎嘎可爱',
    'likes': 249,
    'image': 'assets/picture 3.png',
    'content': 'Master🆓限量专属保温杯🥰、\n(我收到的是黑金款，白金的是我另外入的😆）\n除了保温杯以外还有🆓一杯奶茶🥤 \n不得不说杯子质感还蛮好derrr😍😍 \n重点‼尊嘟好好看😚😚',
  },
  {
    'title': '🐾【每日一狗】博美：小身材大魅力，萌化你的心',
    'user': '包猪婆',
    'likes': 520,
    'image': 'assets/picture 4.png',
    'content': '#小狗味扑面而来   #有些小狗一看就知道非常乖   #这是我的小狗   #治愈系小狗   #可爱小狗   #小狗眼睛会一直亮晶晶   #小狗也可以很可爱   #狗狗笑起来有多治愈   #小狗治愈一切   #谁能拒绝贴脸小狗   #小狗   #博美   #城市小狗漫游',
  },
  {
    'title': '这个脆皮泡芙可以封神了',
    'user': 'Mark',
    'likes': 174,
    'image': 'assets/picture 5.png',
    'content': '大家一定要尝试我们家的酥皮泡芙 真的很好吃 我没有骗人！我们坚持使用最好的原料 内馅也都会给的满满的 咬下去一口爆浆 真的完全没在省！',
  },
  {
    'title': '我勒个豆，这家面包店重新刷新了我的认知！！！',
    'user': 'Moon',
    'likes': 387,
    'image': 'assets/picture 6.png',
    'content': '他们是一间隐藏在Johor Jaya 的宝藏蛋糕店 我已经连续好几年的生日都回购他家的蛋糕 🤩 主要真的是泰好吃了😭 我自己本身是不喜欢吃蛋糕的人 因为觉得蛋糕是一个很甜又很腻的东西 但是他们的蛋糕主打就是一个不太甜 刚刚好 还不腻的那种😍 而且现在真的是很多店的蛋糕外形好看但内陷 🙅‍♀好吃的 这间蛋糕店你们根本完全不用在担心 给的每一张图片基本上都可以还原 不存在买家秀和卖家秀的差别蛤哈哈哈哈🤣',
  },
  {
    'title': '在洛阳！！一定要来吃的面包店！！！',
    'user': '夏夏子',
    'likes': 260,
    'image': 'assets/picture 7.png',
    'content': '这家店面包控是一定要冲的😭 0踩雷的[害羞R] 闭眼入都好吃😋\n✅ 火爆全新山的瑞士卷🍰 4种口味任选 口感绵密不甜腻！🤤 使用代卡下单 体验感up⬆\n✅ 高颜值面包墙🍞 像在逛面包展览[哇R]\n✅ 价格很合理💰品质却完全不输连锁店的🥯\n✅ 面包种类超多 贝果🥯 牛角🥐 天天吃不腻😌',
  },
  {
    'title': 'DIMOO梦里梦外',
    'user': '可怕的不讲理',
    'likes': 2211,
    'image': 'assets/picture 8.png',
    'content': '首次端盒的快乐我也拥有啦✌\n想要的大小隐藏一个没中，不过还好没有雷，每一个都好可爱啊啊啊！！突然Get了月夜航海家，是因为SR的缘故吗[偷笑R][偷笑R]',
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  // Add drawer or menu action here
                },
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () => setState(() => selectedTopTab = 0),
                child: Text(
                  "Follow",
                  style: TextStyle(
                    color: selectedTopTab == 0 ? Colors.red : Colors.white,
                    fontWeight: selectedTopTab == 0 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => selectedTopTab = 1),
                child: Text(
                  "Explore",
                  style: TextStyle(
                    color: selectedTopTab == 1 ? Colors.red : Colors.white,
                    fontWeight: selectedTopTab == 1 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() => selectedTopTab = 2),
                child: Text(
                  "Nearby",
                  style: TextStyle(
                    color: selectedTopTab == 2 ? Colors.red : Colors.white,
                    fontWeight: selectedTopTab == 2 ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
              Spacer(),
              Icon(Icons.search, color: Colors.white),
            ],
          ),
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final post = posts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetailPage(post: post),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: post['image'] != null
                          ? Image.asset(post['image'], fit: BoxFit.cover)
                          : Container(color: Colors.grey.shade400),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(post['title'], maxLines: 2, overflow: TextOverflow.ellipsis),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(post['user'], style: TextStyle(color: Colors.grey, fontSize: 12)),
                      Row(
                        children: [
                          Icon(Icons.favorite_border, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(post['likes'].toString(), style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );

        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.trending_up), label: "Trending"),
          BottomNavigationBarItem(icon: Icon(Icons.add_box_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Me"),
        ],
      ),
    );
  }
}