import 'package:flutter/material.dart';

class Login {
  final String labelText;
  final String hintText;
  final Icon icon;
  final Function validator;

  Login({
    this.labelText,
    this.hintText,
    this.icon,
    this.validator,
  });
}

List loginConfigList = [
  Login(
      labelText: "用户名",
      hintText: "用户名或邮箱",
      icon: Icon(Icons.person),
      validator: (v) {
        return v.trim().length > 0 ? null : "用户名不能为空";
      }),
  Login(
      labelText: "密码",
      hintText: "您的登录密码",
      icon: Icon(Icons.lock),
      validator: (v) {
        return v.trim().length > 5 ? null : "密码不能少于6位";
      }),
];
