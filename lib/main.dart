import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

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
          Center(child: Text("IndexedStack 1")),
          Center(child: Text("IndexedStack 2")),
        ],
      ),
      // bottomNavigationBar는 상태관리를 하므로 Stateful에서만 사용한다.
      bottomNavigationBar: BottomNavigationBar(
        // 현재 index 알려주기 (큰 의미는 없지만, active 버튼 색을 바꿔줌)
        currentIndex: _selectedIndex,
        // 클릭한 Label 내용 표시할지 말지 선택
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        // Onclick과 같은 개념
        onTap: (value) {
          print("선택된 바텀 메뉴 $value");
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            label: "1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "2",
          ),
        ],
      ),
    );
  }
}
