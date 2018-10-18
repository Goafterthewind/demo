select * from student;

select count(*) from student 
where (s_name = '林富丽' or s_gender ='女')and (s_duty ='组织委员');

--常量列。仅显示。不会修改元数据结构
select s.s_name ,'中国' 国籍 from student s;

--通过查询创建一张表
create table boy as select * from student s where s.s_gender = '男';

select * from boy;
select * from girl;
drop table girl;
delete from student;
--通过查询创建一个新表。只有表结构没有数据；
create table girl as select * from student s where 1=2;
--向girl表中批量添加数据
--注意：首先表需要先建立，然后才能添加
-----------------------------------------------------------
--字符串的拼接使用双竖线||
select '姓名；'|| s_name||'性别：'||s_gender 个人信息 from student;
-----------------------------------------------------------
/*
--聚合函数
--1/count
--2/sum
--3/avg
--4/max
--5/min
*/
----------------
--表中语文成绩在100到120之间的
select count(*) from student s where s.s_chinese>=100 and s.s_chinese<=120;
--求和sum
--使用sum函数时必须要指明求和的是哪一列
select sum(s.s_chinese) from student s where s.s_classname like '工商081';
--avg求平均值
--使用avg函数时必须要指明求平均值的是哪一列
select avg(s.s_chinese) 平均值 from student s where s.s_classname like '工商081';
--max求最大值--必须要指明求的是哪一列
select max(s.s_chinese) from student s where s.s_classname like '工商081';
--min求最小值--必须要指明求的是哪一列
select min(s.s_chinese) from student s where s.s_classname like '工商081';
-----------模糊查询
--查找姓张的---%表示任意长度的字符，_表示任意的一个字符
select * from student where s_name like '张_';
--空值判断  is null
select * from student s where s.s_duty is null;
--非空（查找表中有职务的）  is not null
select * from student s where s.s_duty is not null;

--查找民族是汉族和满族的
select * from student s where (s.s_nation = '汉族' or s.s_nation = '满族');

--使用关键字in查询某个范围中的数据
select * from student s where s.s_nation in('汉族','满族');

--查询student表中不是满族或者不是汉族的信息
select * from student s where s.s_nation not in('汉族','满族');

--删除不是满族或者不是汉族的信息
--delete from student s where s.s_nation not in('汉族','满族');

--通过使用关键字distinct去掉重复记录
select distinct s_duty from student where s_duty is not null;

--列的别名
/*
*/
select s_name "姓 名" from student;
select s_name "student name" from student;


-------------------------------------------------------------------
--生成一个32位的GUID编码
--dual表无任何作用，只是为了配合Oracle的语法而存在
select sys_guid() from dual;
--获取当前服务器时间
--Oracle 中的默认时间格式：06 -8月 -18年
select sysdate frome from dual;

--to_date()函数，将字符串按照预定义格式转换为日期
--to_date()函数的第一个参数是一个日期的字符串，第二个参数是要进行转换的格式yyyy-mm-dd

--时间2006年之后入职的老师
select * 
from teacher t
where t.t_entertime> to_date('2006-12-31','yyyy-mm-dd');

--查找入职时间最早/最晚的老师信息
select min(t.t_entertime) from teacher t;
select max(t.t_entertime),min(t.t_entertime) from teacher t;

--入职时间为2000年后，四月入职的教师信息
--to_char(x,y)
--第一个参数x表示：一个日期类型的列或者变量
--第二个参数y表示；对日期类型的参数格式化的模板

select * from teacher t 
where to_char(t.t_entertime,'yyyy-mm-dd') like '20__-04%';

----jjjjiiiiaaaannnngggghhhhuuuuzzzzaaaaiiiijjjjiiiiaaaannnn----
----------------------------------------------------------------
--分组查询 group by
select s.s_classname 
from student s
group by s.s_classname;
--求分组后每个班的语文平均分
--在分组后进行排序，使用order by 排序，默认升序（asc）,降序是（desc）
--先使用where筛选
--如果分组后还有查询条件，使用having进行处理，having语句要放在order by前面
select s.s_classname,avg(s.s_chinese),count(*)
from student s
where s.s_political = '共青团员'
group by s.s_classname
having count（*）>28
order by count(*)desc;
--在查询中可以使用已经查询出结果的列的索引号进行访问，总数与被查处的列的个数相同
--在where语句中使用列的索引值是不正确的
-----------------------------------------------------------------------
--公司员工邮件列表，邮件信息存在重复，删除重复信息，保留编号最小的
-----------------------------------------------------------------------
------内置函数（多，背）
----字符串函数
--1.sys_guid()生成guid编码
--2.initcap（）单词首字母大写
select initcap('hello')from dual;
--3.lower（）将大写变成小写
select lower('HELLO')from dual;
--4.upper（）将小写变成大写
select upper('hello')from dual;
--5.ltrim()删除字符串左侧的空格
select ltrim('|  hel  lo  |')from dual;
--ltrim()另一个作用，删除左侧的指定字符
select ltrim('xyzasdgui123','xyz')from dual;
--6.rtrim()删除字符串右侧的空格
select rtrim('|  hel  lo  |')from dual;
--rtrim()另一个作用，删除右侧的指定字符
select rtrim('xyzasdgui123xyz','xyz')from dual;
--7.trim()删除字符串左右两边的空格
select trim('|  hel  lo  |')from dual;
--trim()另一个作用，删除左右两边的指定字符（指定字符只能有一个字符）
select trim('x'from'xyzasdgui123xyz')from dual;

--8.translate()在第一个参数（原字符串）中找到第二个参数（查找字符串）并将它替换成第三个参数（替换字符串）
select translate('jackma','ja','b')from dual;

--9.replace()在第一个参数（原字符串）中找到第二个参数（查找字符串）并将它替换成第三个参数（替换字符串）
select replace('jackma','ja','b')from dual;

--10.instr()返回第二个参数在第一个参数中的位置，索引值从1开始，如果没找到返回0
--第三个参数x是从哪个位置开始，第四个参数y是出现的第几次
select instr ('woeraf','w',x,y)from dual;
--11.substr()从第一个参数中截取字符串，第二个参数是起始位置，第三个参数是要截取的个数
select substr ('woerafw',1,2)from dual;
--12.concat()连接字符串
select concat ('woeraf',' w')from dual;
--13.chr()将ASCII码转变为字符
select chr (65)from dual;
--14.ascii()将字符转变为ASCII码
select ascii ('A')from dual;
--15.lpad()在字符串左边填充特殊指定字符。没有指定字符时填充空格，
--填充的个数又第二个参数和第一个参数的差决定
select lpad ('tech',7,'A')from dual;
--16.rpad()在字符串右边填充特殊指定字符。没有指定字符时填充空格，
--填充的个数又第二个参数和第一个参数的差决定
select rpad ('tech',7,'A')from dual;
--17.length()返回值是字符的长度
select length('你好')from dual;
--18.lengthb()返回值是字符串的长度，这里的b表示byte(会根据计算机不同有差异，)
select lengthb('你好')from dual;
--19.to_char()
select to_char(87)from dual;
select to_char(sysdate,'yyyy-mm-dd hh:Mi:ss')from dual;

--数学函数
--1.abs()绝对值
select abs(-12)from dual;
--2.ceil()取大于参数的最小整数
select ceil(4.26)from dual;
--3.floor()取小于参数的最大整数
select floor(4.76)from dual;
--4.power()参数1的参数2次方（可以使浮点型数据）
select power(4,2)from dual;
--5.mod()取余数
select mod(4,2)from dual;
--6.round()四舍五入，第二个参数是小数点后留下的位数，如果不指定小数位默认取整
select round(4.45,1)from dual;
--7.trunc()截取。不考虑进位问题
select trunc(4.45,1)from dual;
--trunc()函数的另一个作用，截取日期，截取到目标时间的最早时刻
select trunc(sysdate,'hh')from dual;
--8.sqrt()开根号
select sqrt(16)from dual;
--9.sign（）取得数字的符号。大于0的返回1，小于0返回-1，等于0返回0
select sign(1034),sign(-1),sign(0)from dual;
--10.to_number将字符转换成数字
select to_number('67','99.99')from dual;

--日期函数
--1.sysdate 显示当前系统时间
select sysdate from dual;
--2.extract()截取特定的时间部分
select extract(year from date'2017-05-4')year from dual;
select extract(month from date'2017-05-4')month from dual;
--3.next_day()返回指定时间的下一个星期几；
select next_day(sysdate,'星期三')from dual;
--last_day() 返回指定月的最后一天
select last_day(sysdate)from dual;
--日期是可以做加法运算的，加上一个数字，表示下个月的第几天
select last_day(sysdate)+2 from dual;
--5.add_months()对指定月份进行运算，根据第二个参数的正负号决定向前或者向后移动几个月
select add_months(sysdate,-4)from dual;
--6.months_between(x,y)计算两个参数之间相差几个月,
--如果参数1大于参数2返回正数结果，否则返回负数结果
select months_between(sysdate,to_date('2016-09-07','yyyy-mm-dd'))from dual;
--7.计算日期与日期之间的天数差。例如：距离高考还有几天
select '高考已经过去了'||concat(to_char(abs(trunc((to_date
('2018-06-07','yyyy-mm-dd')-sysdate)))),'天')from dual;

--其他函数
--1.nvl()类似于if判断；选中第一个参数所在字段，如果为空添加第二个参数，否则原样输出
select * from student;
select nvl(s_duty,'muyou')from student;
--2.nvl2（）如果第一个参数不是空，就输出参数二，是空的就输出参数三
select nvl2(s_duty,s_duty,'muyou')from student;
--3.nullif用来比较两个表达式，如果两个表达式相同就返回null，表达式不同返回第一个表达式
select nullif(s_duty,null)from student;
--4.decode（）如果第一个参数等于参数二时，返回第三个参数，不同时返回第四个参数
select decode(s.s_gender,'女','软妹','猛汉')from student s;
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
--多表查询（原理是笛卡尔积（交叉相乘））
--如何消除笛卡尔积
--自然连接，可以理解为等值链接
select t.t_name from teacher t,title t1 where t.t_titleid=t1.title_id;

-----exists查询,,(是否存在)
select * from student where exists(select * from course where c_name like '面向对象课程设计');

--Oracle表分区
/*
Oracle的体验版中不能使用这个功能，在企业版中
*/

--范围分区
/*create table sales(
       pid varchar2(32);
       num number(88,2)
)
partition by range(num)(
          partition p1 values less than (1000)
          partition p2 values less than (2000)
          partition p3 values less than (3000)
);
insert into sales values(num(),3000);
--分区查找
select * from sales partition (p3);
--变更最大存储分区的数据
alter table sales add partition p4 values less than(Maxalue);
*/


--hash分区，根据hash算法，均匀的进行分区
/*
create table emp(
       id varchar2(32),
       name varchar2(100)
)
partition by hash(name)(
          partition p1 ,
          partition p2
);

*/

--列表分区
/*
create table personCtiy(
       pid varchar2(32),
       pname varchar2(100),
       pcity varchar2(100)
)
partition by list(pcity)(
          partition 北上广 values('北京','上海','广州'),
         partition 津冀 values('天津','河北'),
         partition 深圳 values('深圳')
);

--插入数据

--查询
select * from personCtiy partiton(北上广);
*/

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--用户权限
----profile文件，用户概要文件，创建用户时如果没有指定profile，
--则使用Oracle，默认的概要文件赋给用户，默认文件：default
--创建概要文件
create profile pro1
limit
failed_login_attempts 2--连续两次登陆失败
password_lock_time 2;--锁定账号两天
--修改profile文件
alter profile Pro1 
limit
password_life_time 10--指定密码的最长有效时间为10天
password_grace_time 1;--到了最长有效期如果不更改密码最多延期1天


--创建一个用户ya然后指定密码为ya,并制定用户概要文件为Pro1
create user ya identified by ya profile pro1;

--1、先创建一个用户，此时是默认概要文件
create user yaa identified by yaa;
--2、然后再改变当前用户的概要文件
alter user yaa profile por1

--解除锁定状态
--使用system登录
alter user ya account unlock;

-------------------------------------session
--------------赋予新建用户权限
------1·系统权限：登录·建表
--赋予登录权限
grant create session to ya;
--赋予用户建表的权限
grant create table to ya;


------2·对象权限：对其他用户建立的表进行操作
--授权使用空间
grant unlimited tablespace to ya;
--赋予用户对某一张表的所有使用权限
grant all on system.title to ya;
--赋予用户创建任意表的权限
grant creatte any table to ya;
------角色--role
create role role1;--创建角色
grant create session,create table,create any table to role1;--角色授权

create user lll identified by lll;

grant role1 to lll;--将角色权限赋给用户lll
grant resource to lll;--相当于unlimited tablespace
------


------------------------
---
--通过show user进行当前用户的查看




