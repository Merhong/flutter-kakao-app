import 'package:flutter/material.dart';
import 'package:flutter_kakao_app/screens/chat_screen.dart';
import 'package:flutter_kakao_app/screens/friend_screen.dart';
import 'package:flutter_kakao_app/screens/more_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 상태
  int _selectedIndex = 0; // IndexedStack에서 쓰이는 인덱스 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // BottomNavigationBar와 함께 쓰인다!!!
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          FriendScreen(),
          ChatScreen(),
          MoreScreen(),
        ],
      ),
      // bottomNavigationBar는 상태관리를 하므로 Stateful에서만 사용한다.
      bottomNavigationBar: BottomNavigationBar(
        // 현재 index 알려주기 (큰 의미는 없지만, active 버튼 색을 바꿔줌)
        currentIndex: _selectedIndex,
        // 클릭한 Label 내용 표시할지 말지 선택
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        // Onclick과 같은 개념
        onTap: (index) {
          print("선택된 바텀 메뉴 $index");
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user),
            label: "1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment),
            label: "2",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            label: "2",
          ),
        ],
      ),
    );
  }
}
