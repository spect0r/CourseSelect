# CourseSelect [![Build Status](https://travis-ci.org/PENGZhaoqing/CourseSelect.svg?branch=master)](https://travis-ci.org/PENGZhaoqing/CourseSelect)

### [中文教程1](http://blog.csdn.net/ppp8300885/article/details/52594839) [中文教程2](http://blog.csdn.net/ppp8300885/article/details/52601560)


这个样本系统是基于国科大研究生课程 (高级软件工程) 开发的项目,目的是帮助入门者学习RoR (Ruby on Rails) 

适合新学者的入手的第一个项目 ([演示Demo戳这里](https://courseselect.herokuapp.com/ ))，入门者可以在这个样本系统上增加更多的功能:

* 处理选课冲突、控制选课人数
* 统计选课学分，学位课等
* 增加选课的开放、关闭功能
* 自定义管理员后台
* 基于OAuth的授权登陆
* Excel格式的数据导入
* 绑定用户邮箱（实现注册激活，忘记密码等）
* 站内查找检索 （课程按分类查找，过滤等）

### 目前功能：

* 多角色登陆（学生，老师，管理员）
* 学生动态选课，退课
* 老师动态增加，删除课程
* 老师对课程下的学生添加、修改成绩（通过平时成绩与考试成绩的权重给出最终成绩）
* 全部课程学分统计
* 全部课程类型分类
* 学生上课时间统计
* 学生课表生成、导出
* 支持查看课程详细信息，包括但不限于课程人数、课程地点、上课时间、考试类型等
* 权限控制：老师和学生只能看到自己相关课程信息

### 截图

<img src="/lib/screenshot1.png" width="700">  

<img src="/lib/screenshot2.png" width="700">

<img src="/lib/screenshot3.png" width="700">   

<img src="/lib/screenshot4.png" width="700">

<img src="/lib/screenshot5.png" width="700">

<img src="/lib/screenshot6.png" width="700">

## 说明

目前使用的库和数据库：

* 使用[Bootstrap](http://getbootstrap.com/)作为前端库
* 使用[Rails_admin Gem](https://github.com/sferik/rails_admin)作为后台管理
* 使用[Postgresql](http://postgresapp.com/)作为数据库

使用前需要安装Bundler，Gem，Ruby，Rails等依赖环境。

请根据本地系统下载安装[postgresql](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup)数据库，并运行`psql -h localhost`检查安装情况。


## 安装

在终端（MacOS或Linux）中执行以下代码

```
$ git clone https://github.com/spect0r/CourseSelect
$ cd CourseSelect
$ bundle install
$ rake db:create:all
$ rake db:migrate
$ rake db:seed
$ rails s 
```

在浏览器中输入`localhost:3000`访问主页

##使用

1.学生登陆：

账号：`student1@test.com`

密码：`password`

2.老师登陆：

账号：`teacher1@test.com`

密码：`password`


3.管理员登陆：

账号：`admin@test.com`

密码：`password`

账号中数字都可以替换成2,3...等等


## Heroku云部署

项目可直接在Heroku上免费部署

1.fork此项目到自己Github账号下

2.创建Heroku账号以及Heroku app

3.将Heroku app与自己Github下的fork的项目进行连接

4.下载配置[Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line)命令行工具

5.运行`heroku login`在终端登陆，检查与heroku app的远程连接情况`git config --list | grep heroku`，若未检查到相应的app，请看[这里](http://stackoverflow.com/questions/5129598/how-to-link-a-folder-with-an-existing-heroku-app)

6.运行部署，详情[请戳这里](https://devcenter.heroku.com/articles/getting-started-with-rails4#rails-asset-pipeline)


## 测试

本项目包含了部分的测试（integration/fixture/model test），测试文件位于/test目录下。运行测试：

```
PENG-MacBook-Pro:IMS_sample PENG-mac$ rake test
Run options: --seed 15794

# Running:
.........

Finished in 1.202169s, 7.4865 runs/s, 16.6366 assertions/s.

9 runs, 20 assertions, 0 failures, 0 errors, 0 skips
```


## How to Contribute

先fork此项目，在分支修改后，pull request到主分支

提问请到issues里创建，欢迎contributor！

如果觉得好，给项目点颗星吧～

## 小组说明

1）获取源码分支
首先登录github网站fork https://github.com/spect0r/CourseSelect.git。
本地git clone https://github.com/自己的用户名/CourseSelect.git，或者直接C9以此建立工程。

2）本地编辑，push代码到自己的fork分支
git add --all
git commit -m "application for.."
git push origin master

3）分支同步
(1).组员push request之前，需要先从组代码pull最新的代码并合并测试通过：
常用几条命令： 
    git remote add upstream https://github.com/spect0r/CourseSelect.git  
    git remote -v    (查看是否添加成功)
    git checkout -b source    (新建一个分支,名称任意)    
    git pull upstream master    (分支与组内源同步)
    git checkout master    (回到master分支)
    git merge source    (合并source到master分支，merge只解决文件内容合并，自动合并冲突部分手动修改，逻辑冲突部分测试后发现)
    git add *    (若有手动修改，需要添加到工作区)
    git commit -m "merge for.."    (若有手动修改，生成新的节点)
    git push origin master    (提交到github)
(2).发起pull request，在github上网页操作。
(3).组长merge组员的贡献到origin/master。

4）回退操作
git reset --hard HEAD    (恢复到最近一次提交)
git checkout -- file    (或者丢弃单个文件修改就是)
git clean -dxf    (则会丢弃所以没有add的修改，保持工作区的清净)

