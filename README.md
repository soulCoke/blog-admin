### blog-admin 后台配置
- [后台模板](https://gitee.com/y_project/RuoYi-fast)
- [前台地址](https://github.com/soulCoke/blog-index)
- 初始化
```
git clone http://
```
- 导入数据库
```
导入 数据库文件 在sql目录下 blog.sql。直接执行sql ，我的mysql 版本是 5.7
```
- 修改配置文件
```
ruoyi:
  # 网络域名
  domain: http://localhost

还有数据库配置文件 自己修改一下
```
##### 参数配置
- blog_banner

字段 | 值 | 解释
---|---|---
type | headnav | 首页
type | link | 友链
type | donate | 捐赠赞数
type | zhifubao | 支付宝二维码
type | weixin | 微信二维码
type | about | 关于
type | message | 留言

##### 说明
- 所有的api 都在 
```
com.ruoyi.project.blog.apis.*
```


