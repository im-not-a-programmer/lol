import 'dart:async';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _usePassword = true;
  FocusNode _nameFocus,_pwFocus;
  bool _isWaitingVerificationCode = false;
  int _time = 60;

  @override
  void initState() {
    super.initState();
    _nameFocus = FocusNode();
    _pwFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildBackButton(),
                  _buildHintText(),
                  SizedBox(
                    height: size.height / 24,
                  ),
                  _buildTextField("请输入账号",_nameFocus),
//                  _buildTextField("请输入密码"),
                  _usePassword
                      ? _buildTextField("请输入密码",_pwFocus)
                      : _buildVerificationTextField(context),
                  SizedBox(
                    height: size.height / 16,
                  ),
                  _buildLoginButton(context),
                  _buildHintRow(
                    _usePassword ? '使用短信验证码登陆' : '使用密码登陆',
                  ),
                ],
              ),
              _buildOtherLoginWay(),
            ],
          ),
        ),
      ),
    );
  }

  //顶部叉叉按钮
  Widget _buildBackButton() {
    return GestureDetector(
      onTap: _onBackButtonTap,
      child: Container(
        height: 90,
        alignment: Alignment.centerLeft,
        child: Icon(
          Icons.close,
          size: 44,
          color: Colors.grey,
        ),
      ),
    );
  }

  //顶部提示文字
  Widget _buildHintText() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        '请输入账号密码',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //输入框
  Widget _buildTextField(String labelText,FocusNode node) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
      child: TextField(
        focusNode: node,
        decoration: InputDecoration(
//            hintText: hintText,
            labelText: labelText,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey.withOpacity(0.8),
            )),
      ),
    );
  }

  Widget _buildVerificationTextField(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
              width: size.width / 2,
              child: TextField(
                  textInputAction: TextInputAction.next,
                  onSubmitted: (input){
                    _nameFocus.unfocus();
                    FocusScope.of(context).requestFocus(_pwFocus);
                  },
                  focusNode: _pwFocus,
                  decoration: InputDecoration(
                      labelText: "请输入验证码",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.withOpacity(0.8),
                      )))),
          _buildVerificationButton()
        ],
      ),
    );
  }

  //验证按钮
  Widget _buildVerificationButton(){
    return OutlineButton(
      onPressed: _getVerificationCode,
      borderSide: BorderSide(color: Colors.black),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: _isWaitingVerificationCode?Text('$_time S'):Text('获取验证码'),
    );
  }

  //登陆按钮
  Widget _buildLoginButton(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        width: size.width,
        height: size.width / 9,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 2),
          child: GestureDetector(
            onTap: _onLoginButtonTap,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).buttonColor,
                  borderRadius: BorderRadius.circular(8)),
              alignment: Alignment.center,
              child: Text(
                '登陆',
                style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
  Widget _buildHintRow(String switchLogin) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: _usePassword
                  ? () => _onPhoneButtonTap()
                  : () => _onPasswordButtonTap(),
              child: Text(switchLogin)),
          GestureDetector(
            onTap: ()=>_onForgetButtonTap(),
              child: Text(
            '忘记密码',
            style: TextStyle(color: Colors.grey),
          )),
        ],
      ),
    );
  }

  Widget _buildOtherLoginWay() {
    final color = Colors.grey;
    final hintText = Row(
      children: <Widget>[
        Expanded(
            child: Divider(
          color: color,
        )),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Text(
            '其他登陆方式',
            style: TextStyle(color: color),
          ),
        ),
        Expanded(
            child: Divider(
          color: color,
        )),
      ],
    );

    final loginAccessButtonRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildAccessButton('assets/login/login_weixin@3.png', '微信', _onMaipoButtonTap),
        _buildAccessButton('assets/login/login_qq@3.png', 'QQ', _onQQButtonTap),
        _buildAccessButton('assets/login/login_weibo@3.png', '微博', _onMaipoButtonTap)
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: <Widget>[
          hintText,
          loginAccessButtonRow,
        ],
      ),
    );
  }

  Widget _buildAccessButton(String asset, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12),
            child: SizedBox(
                height: 48,
                width: 48,
                child: Image.asset(
                  asset,
                  fit: BoxFit.contain,
                )),
          ),
          Text(
            title,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  _waitingVerification(){
    final initTime = 60;

    _isWaitingVerificationCode = true;
    Timer.periodic(Duration(seconds: 1), (timer){
      if(_time == 0){
        _isWaitingVerificationCode = false;
        _time = initTime;
        timer.cancel();
        setState(() {});
      }
      _time--;
      setState(() {});
    });
  }

  //当用户点击返回按钮
  _onBackButtonTap(){
    Navigator.of(context).pop();
    print('back button tapped');
  }

  //当用户点击登陆按钮
  _onLoginButtonTap(){
    print('login button tapped');
  }

  //当用户点击：使用密码登陆
  _onPasswordButtonTap() {
    setState(() {
      _pwFocus.unfocus();
      _nameFocus.unfocus();
      _usePassword = true;
    });
  }

  //当用户点击：使用短信验证码登陆
  _onPhoneButtonTap() {
    setState(() {
      _pwFocus.unfocus();
      _nameFocus.unfocus();
      _usePassword = false;
    });
  }

  //当用户点击忘记密码
  _onForgetButtonTap(){
    print('forget button tapped');
  }

  //当用户点击：获取验证码按钮
  _getVerificationCode(){
    if(!_isWaitingVerificationCode) _waitingVerification();
  }

  //当用户点击微信按钮
  _onWechatButtonTap(){
    print('wechat button tapped');
  }

  //当用户点击qq按钮
  _onQQButtonTap(){
    print('qq button tapped');
  }

  //当用户点击微博按钮
  _onMaipoButtonTap(){
    print('maipo button tapped');
  }
}
