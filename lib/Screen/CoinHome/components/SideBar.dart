import 'package:flutter/material.dart';
import 'package:flutter_gmcwallet/Screen/CoinHome/components/Mypage.dart';
import 'package:flutter_gmcwallet/Screen/HomeScreen.dart';
import 'package:flutter_gmcwallet/Screen/Login/loginScreen.dart';
import 'package:flutter_gmcwallet/repository/repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key key}) : super(key: key);

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {

  final _userRepository = UserRepository();

  String email = "";

  _SideBarState() {
    _getEmail().then((val) => setState(() {
      email = val.toString();
      if(email == 'null') {
        Get.to(LoginScreen());
      }
    }));
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          UserAccountsDrawerHeader(
            accountName: Text(email,style: TextStyle(fontSize: 16),),
            accountEmail: Text(email,style: TextStyle(fontSize: 16),),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/profile.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffd25a7c),
              Color(0xfff9cc83),
            ])),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.home_rounded,size: 28,),
              onTap: () {
                Get.to(HomeScreen());
              },
              title: Text(
                "Home",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(height: 5,),
              ListTile(
            leading: Icon(Icons.loop,size: 28,),
              onTap: () {
                
              },
              title: Text(
                "전송이력",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(height: 5,),
              ListTile(
            leading: Icon(Icons.account_circle ,size: 28,),
              onTap: () {
                Get.to(MyPage());
              },
              title: Text(
                "마이페이지",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              )),
              SizedBox(height: 200,),
              ListTile(
            leading: Icon(Icons.logout,size: 28,),
              onTap: () {
                _userRepository.deleteUser();
                Get.to(LoginScreen());
              },
              title: Text(
                "LOGOUT",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ],
      ),
    );
  }

  Future<String> _getEmail() async{
    final FlutterSecureStorage storage = FlutterSecureStorage();
    return await storage.read(key: "User");
  }

}
