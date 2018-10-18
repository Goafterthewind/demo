
  --创建表
  --创建表的时候，需要指明列名和列的数据类型
  --在Oracle中，字符类型一般都是使用varchar2这个类型，varchar2类型是Oracle自己独有的类型
  --指明字符类型的数据还要指明他能存放多少个字符写法如下：varchar2(100)，此处的100是指英文字符的个数，对于中文来说除以2
  --有一种比较特殊的主键（主键是像是身份证号，具有唯一性），称为GUID或UUID，他一般由32是个英文字符或数字加上4个减号组成
  --在Oracle中生成UUID的方法是sys_guid()方法，使用select sys_guid() from dual;
  --要是列称为主键列，需要在列的后面添加primary key关键字
  --列与列之间用逗号进行分割
  --在列的后面添加not null，表示这个列的值是不能为空的，也就是必须要填写
  select sys_guid() from dual;
  create table t_users (
    userid varchar2(32) primary key,
    username varchar2(100) not null,
    userage number(3) not null,
    usersex number(1) not null
  );
  
  --添加数据
  --通过insert语句来实现，所插入的数据应该放在values后面的圆括号中
  --默认情况下数据的插入顺序应该和建表是的顺序保持一致，数据类型也应一致
  --数据插入以后需要对通过commit操作进行数据的提交，没有提交的数据不会在数据库中存储
  --如果发现所进行的操作有问题，则可以通过rollback对最后一次的错误进行撤销
  --如果需要指定数据的插入顺序，则需要在values之前定义说明
  insert into t_users (username,usersex,userid,userage) values ('jim',1,sys_guid(),73);
  insert into t_users values (sys_guid(),'bill',23,1);
  insert into t_users values (sys_guid(),'tom',13,1);
  insert into t_users values (sys_guid(),'jerry',33,1);
  insert into t_users values (sys_guid(),'jack',43,1);
  insert into t_users values (sys_guid(),'rose',53,2);
  insert into t_users values (sys_guid(),'peter',63,1);
  
  commit;--对刚才插入的数据进行提交
  rollback;--撤销刚才最后所进行的操作
  
  --查看表
  --在select的查询语句中*表是全部查询
  --查询时也可以指定列进行查询
  --在查询时，如果需要对数据进行筛选可以使用where关键字,在t_users表中查找性别是2的人
  --如果有多个条件需要进行查询需要是and &&或者是or ||
  --如果查询性别是1的并且年龄大于40岁的人
  select * from t_users;
  select username,userage from t_users;
  select * from t_users where usersex = 2;
  select * from t_users where usersex = 1 and userage>40;
  select * from t_users where usersex =1 and username = 'peter';
  
  --更新表
  --关键字是update
  --update默认情况下是更新整张表
  --如果需要对某几行数据进行更新，则需要添加where关键字
  --一般对数据更新都是参考主键进行的，一般主键自己是不能更新的
  --如果涉及到多列更新，用逗号进行分割
  
  update t_users set userage=99;
  update t_users set userage=80 where userid='469230876C004592B196220BB859939E';
  update t_users set userage=99,usersex=3,username='张建军';
  
  
  --删除数据
  --对数据删除一般分为两种，一种是物理删除，一种是逻辑删除
  --没有where关键字，相当于将整张表的数据全部删除掉，非常危险！！！
  --删除数据也是参考主键
  delete from t_users;
  delete from t_users where userid='6475E7BE6EB54036A3945384F06C5644';
  
  --删除表
  --删除表是不能进行撤销操作的，极度危险！！！
  drop table t_users;
  
  --创建一张登录表
  create table userlogin(
    userid varchar2(32) primary key,
    username varchar2(100) not null,
    userpwd varchar2(20) not null
  );
  
  --插入测试数据
  insert into userlogin values(sys_guid(),'bill','123456');
  insert into userlogin values(sys_guid(),'tom','222222');
  insert into userlogin values(sys_guid(),'jerry','333333');
  insert into userlogin values(sys_guid(),'jack','666666');
  commit;
  
  --测试操作结果
  select * from userlogin;
  
  --要求判断用户登录是否成功
  --如果我们的查询仅是关注行数，可以是使用聚合函数中的count函数
  select * from userlogin where username='bill' and userpwd='123456';
  
  select count(*) from userlogin where username='bill1' and userpwd='123456';
  
