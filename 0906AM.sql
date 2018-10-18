--0906AM

select * from userlogin;
--修改数据库表的表结构
alter table userlogin modify username varchar2(500);

create table weather(
  wid varchar2(32) primary key,
  stn varchar2(10) not null,
  wban varchar2(10) not null,
  YEARMODA varchar2(20) not null
);
insert into weather values (sys_guid(),)
select * from weather;
delete from weather;
select * from student;
commit;

--用户提出(用户名 || 邮箱 || 手机) && (密码)登录
--drop table userlogin

create table userlogin(
  username varchar2(500) not null,
  useremail varchar2(300) not null,
  userphone varchar2(11) not null,
  usperpwd varchar2(30) not null
);

select * from userlogin where 
(username='' or useremail='' or userphone='') and (userpwd='123456');

--查询
--1.表的别名,在表名的后面添加一个其他的名称，称为表的别名，这个名称是临时的

select s.s_name,s.s_gender,s.s_nation from student s;
--列的别名
select s.s_name 姓名  from student s;
--如果列的别名有空格需要添加双引号然后添加一个as的关键字
select s_name as "student name"  from student;

select * from student s;
--列可以进行求和运算
select s.s_chinese+s.s_math+s.s_foreign 总成绩 from student s;

--常量列，仅显示，不会修改元数据结构
select s.s_name,'中国' 国籍 from student s;

select * from student s where s.s_gender='女';
--通过查询创建一张表
create table boy as select * from student s where s.s_gender='男';
--drop table girl;
select * from girl;
--创建一个新的表结构，没有数据
create table girl as select * from student s where 1=2;

--向girl表中批量插入数据
--注意：首先表需要先建立，然后才能批量添加
insert into girl select * from student s where s.s_gender='女';
commit;
--对于没有创建的表，是不能进行批量添加的
insert into demo_1 select * from student

--Oralce中字符串的拼接使用||，双竖线
select * from student s
select '姓名：' || s.s_name || '，性别：' || s.s_gender 个人信息 from student s;

--聚合函数
--1.count:统计行数
--2.sum求和
--3.avg：求平均值
--4.max：最大值
--5.min：最小值

select * from student
--count
--1.表中一共有多少行
select count(*) from student;

--2.表中一共有多少男生
select '男生人数:' || count(*) 统计 from student s where s.s_gender='男';

--3.表中语文成绩在100到120分之间的人数有多少
select count(*) from student s where s.s_chinese >=100 and s.s_chinese <=120;
select count(*) from student s where s.s_chinese between 100 and 120;
--注意:>= and <=和between and这两种写法也同样适用于日期类型，
--并且>= and <=执行效率比between and 要高，推荐是用>= and <=

--4.表中姓张的同学的人数
--通过模糊查找,%表示任意长度的字符，_表示任意的一个字符
select * from student s where s.s_name like '张%';
select * from student s where s.s_name like '张_';

--sum:求和,使用sum函数时，必须要指明对那列求和
--1.表中工商081班级的语文成绩的总分是多少
select sum(s.s_chinese) from student s where s.s_classname = '工商081';

--avg:求平均值,必须要指明对那列求平均
--1.表中工商081班的语文成绩的平均值是多少
select avg(s.s_chinese) from student s where s.s_classname = '工商081';

--max：求最大值,必须要指明对那列求最大值
--1.表中工商081班的语文成绩的最高分
select max(s.s_chinese) from student s where s.s_classname = '工商081';

--min：求最小值,必须要指明对那列求最小值
--1.表中工商081班的语文成绩的最低分
select min(s.s_chinese) from student s where s.s_classname = '工商081';

--空值判断
--使用is null表示数据为空
select * from student s where s.s_duty is null;

--查找student表中有职务的数据
--使用is not null来表示数据非空
select * from student s where s.s_duty is not null;

--查找民族是汉族和满族的学生信息
select * from student s where s.s_nation='汉族' or s.s_nation='满族'

--使用in关键字来查询某一个范围中的数据
select * from student s where s.s_nation in('汉族','满族');

--查询student表中，不是满族或者不是汉族的学生信息
select * from student s where s.s_nation not in ('汉族','满族');

--写语句删除语句，删除一批数据
delete from student s where s.s_id in ('0807010202' , '0807010203' ,'0807010206');
rollback;


--通过是用distinct关键字，去掉重复记录
select distinct s_duty from student s where s.s_duty is not null;

--获取当前系统时间
--dual表，没有任何作用，仅是为了配合Oracle的语法
--select * from dual;返回值是一个x
--sys_guid()用于生成32位的GUID编码
select sys_guid() from dual;
--sysdate用于获取当前服务器时间
select sysdate from dual;
--Oracle中的默认时间是日-月-年并且年仅有后两位比如：06-9月 -18

select * from teacher;
--查找2006年以后入职的教室数据
--to_date,将字符串按照预定义格式，转换为日期
--to_date第一个参数，是一个日期的字符串
--第二个参数，是要进行转换的格式
select * from teacher t where t.t_entertime >= to_date('2006-12-31','yyyy-mm-dd');

--查找入职时间最早的老师信息
select min(t.t_entertime) from teacher t;

--入职时间最晚的老师的信息
select max(t.t_entertime) from teacher t;

--查找教师表中入职时间为2000年以后的，4月入职的教师信息
--to_char(x,y)
--第一个参数x表示：一个日期类型的列或者变量
--第二个参数y表示：对日期类型进行格式化输出的模板
select * from teacher t where to_char(t.t_entertime,'yyyy-mm-dd') like '200_-04%';

--分组 group by
--1.如果是用分组，会对表中的数据进行合并同类项，在查询时，不能使用*和非分组列
--统计每个班级中语文的平均分
select * from student;
--先执行where语句，作用是对原始表进行一次数据的筛选
--筛选以后，对数据进行分组
--分组后求各班级的人数
--在分组以后进行排序使用order by 语句，这里面默认的排序是升序排序（asc）
--如果是倒序或者降序排序使用desc进行处理
--如果分组以后还有查询条件使用having进行处理，having语句在放在order by前面
--单表的SQL语句书写的要求：select 列 from 表名 where ,group by,having,order by
select s.s_classname,count(*) from student s 
where s.s_political='共青团员'
group by s.s_classname
having count(*) >28
order by 1 asc;
--在查询中可以使用已经查询出结果的列的索引号进行访问，总数与被查出的列的个数相同
--在where语句中是列的索引值是不正确的
select s.s_id,s.s_name,s.s_gender from student s where 3='女'

















