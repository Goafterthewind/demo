select * from student;

select count(*) from student 
where (s_name = '�ָ���' or s_gender ='Ů')and (s_duty ='��֯ίԱ');

--�����С�����ʾ�������޸�Ԫ���ݽṹ
select s.s_name ,'�й�' ���� from student s;

--ͨ����ѯ����һ�ű�
create table boy as select * from student s where s.s_gender = '��';

select * from boy;
select * from girl;
drop table girl;
delete from student;
--ͨ����ѯ����һ���±�ֻ�б�ṹû�����ݣ�
create table girl as select * from student s where 1=2;
--��girl���������������
--ע�⣺���ȱ���Ҫ�Ƚ�����Ȼ��������
-----------------------------------------------------------
--�ַ�����ƴ��ʹ��˫����||
select '������'|| s_name||'�Ա�'||s_gender ������Ϣ from student;
-----------------------------------------------------------
/*
--�ۺϺ���
--1/count
--2/sum
--3/avg
--4/max
--5/min
*/
----------------
--�������ĳɼ���100��120֮���
select count(*) from student s where s.s_chinese>=100 and s.s_chinese<=120;
--���sum
--ʹ��sum����ʱ����Ҫָ����͵�����һ��
select sum(s.s_chinese) from student s where s.s_classname like '����081';
--avg��ƽ��ֵ
--ʹ��avg����ʱ����Ҫָ����ƽ��ֵ������һ��
select avg(s.s_chinese) ƽ��ֵ from student s where s.s_classname like '����081';
--max�����ֵ--����Ҫָ���������һ��
select max(s.s_chinese) from student s where s.s_classname like '����081';
--min����Сֵ--����Ҫָ���������һ��
select min(s.s_chinese) from student s where s.s_classname like '����081';
-----------ģ����ѯ
--�������ŵ�---%��ʾ���ⳤ�ȵ��ַ���_��ʾ�����һ���ַ�
select * from student where s_name like '��_';
--��ֵ�ж�  is null
select * from student s where s.s_duty is null;
--�ǿգ����ұ�����ְ��ģ�  is not null
select * from student s where s.s_duty is not null;

--���������Ǻ���������
select * from student s where (s.s_nation = '����' or s.s_nation = '����');

--ʹ�ùؼ���in��ѯĳ����Χ�е�����
select * from student s where s.s_nation in('����','����');

--��ѯstudent���в���������߲��Ǻ������Ϣ
select * from student s where s.s_nation not in('����','����');

--ɾ������������߲��Ǻ������Ϣ
--delete from student s where s.s_nation not in('����','����');

--ͨ��ʹ�ùؼ���distinctȥ���ظ���¼
select distinct s_duty from student where s_duty is not null;

--�еı���
/*
*/
select s_name "�� ��" from student;
select s_name "student name" from student;


-------------------------------------------------------------------
--����һ��32λ��GUID����
--dual�����κ����ã�ֻ��Ϊ�����Oracle���﷨������
select sys_guid() from dual;
--��ȡ��ǰ������ʱ��
--Oracle �е�Ĭ��ʱ���ʽ��06 -8�� -18��
select sysdate frome from dual;

--to_date()���������ַ�������Ԥ�����ʽת��Ϊ����
--to_date()�����ĵ�һ��������һ�����ڵ��ַ������ڶ���������Ҫ����ת���ĸ�ʽyyyy-mm-dd

--ʱ��2006��֮����ְ����ʦ
select * 
from teacher t
where t.t_entertime> to_date('2006-12-31','yyyy-mm-dd');

--������ְʱ������/�������ʦ��Ϣ
select min(t.t_entertime) from teacher t;
select max(t.t_entertime),min(t.t_entertime) from teacher t;

--��ְʱ��Ϊ2000���������ְ�Ľ�ʦ��Ϣ
--to_char(x,y)
--��һ������x��ʾ��һ���������͵��л��߱���
--�ڶ�������y��ʾ�����������͵Ĳ�����ʽ����ģ��

select * from teacher t 
where to_char(t.t_entertime,'yyyy-mm-dd') like '20__-04%';

----jjjjiiiiaaaannnngggghhhhuuuuzzzzaaaaiiiijjjjiiiiaaaannnn----
----------------------------------------------------------------
--�����ѯ group by
select s.s_classname 
from student s
group by s.s_classname;
--������ÿ���������ƽ����
--�ڷ�����������ʹ��order by ����Ĭ������asc��,�����ǣ�desc��
--��ʹ��whereɸѡ
--���������в�ѯ������ʹ��having���д���having���Ҫ����order byǰ��
select s.s_classname,avg(s.s_chinese),count(*)
from student s
where s.s_political = '������Ա'
group by s.s_classname
having count��*��>28
order by count(*)desc;
--�ڲ�ѯ�п���ʹ���Ѿ���ѯ��������е������Ž��з��ʣ������뱻�鴦���еĸ�����ͬ
--��where�����ʹ���е�����ֵ�ǲ���ȷ��
-----------------------------------------------------------------------
--��˾Ա���ʼ��б��ʼ���Ϣ�����ظ���ɾ���ظ���Ϣ�����������С��
-----------------------------------------------------------------------
------���ú������࣬����
----�ַ�������
--1.sys_guid()����guid����
--2.initcap������������ĸ��д
select initcap('hello')from dual;
--3.lower��������д���Сд
select lower('HELLO')from dual;
--4.upper������Сд��ɴ�д
select upper('hello')from dual;
--5.ltrim()ɾ���ַ������Ŀո�
select ltrim('|  hel  lo  |')from dual;
--ltrim()��һ�����ã�ɾ������ָ���ַ�
select ltrim('xyzasdgui123','xyz')from dual;
--6.rtrim()ɾ���ַ����Ҳ�Ŀո�
select rtrim('|  hel  lo  |')from dual;
--rtrim()��һ�����ã�ɾ���Ҳ��ָ���ַ�
select rtrim('xyzasdgui123xyz','xyz')from dual;
--7.trim()ɾ���ַ����������ߵĿո�
select trim('|  hel  lo  |')from dual;
--trim()��һ�����ã�ɾ���������ߵ�ָ���ַ���ָ���ַ�ֻ����һ���ַ���
select trim('x'from'xyzasdgui123xyz')from dual;

--8.translate()�ڵ�һ��������ԭ�ַ��������ҵ��ڶ��������������ַ������������滻�ɵ������������滻�ַ�����
select translate('jackma','ja','b')from dual;

--9.replace()�ڵ�һ��������ԭ�ַ��������ҵ��ڶ��������������ַ������������滻�ɵ������������滻�ַ�����
select replace('jackma','ja','b')from dual;

--10.instr()���صڶ��������ڵ�һ�������е�λ�ã�����ֵ��1��ʼ�����û�ҵ�����0
--����������x�Ǵ��ĸ�λ�ÿ�ʼ�����ĸ�����y�ǳ��ֵĵڼ���
select instr ('woeraf','w',x,y)from dual;
--11.substr()�ӵ�һ�������н�ȡ�ַ������ڶ�����������ʼλ�ã�������������Ҫ��ȡ�ĸ���
select substr ('woerafw',1,2)from dual;
--12.concat()�����ַ���
select concat ('woeraf',' w')from dual;
--13.chr()��ASCII��ת��Ϊ�ַ�
select chr (65)from dual;
--14.ascii()���ַ�ת��ΪASCII��
select ascii ('A')from dual;
--15.lpad()���ַ�������������ָ���ַ���û��ָ���ַ�ʱ���ո�
--���ĸ����ֵڶ��������͵�һ�������Ĳ����
select lpad ('tech',7,'A')from dual;
--16.rpad()���ַ����ұ��������ָ���ַ���û��ָ���ַ�ʱ���ո�
--���ĸ����ֵڶ��������͵�һ�������Ĳ����
select rpad ('tech',7,'A')from dual;
--17.length()����ֵ���ַ��ĳ���
select length('���')from dual;
--18.lengthb()����ֵ���ַ����ĳ��ȣ������b��ʾbyte(����ݼ������ͬ�в��죬)
select lengthb('���')from dual;
--19.to_char()
select to_char(87)from dual;
select to_char(sysdate,'yyyy-mm-dd hh:Mi:ss')from dual;

--��ѧ����
--1.abs()����ֵ
select abs(-12)from dual;
--2.ceil()ȡ���ڲ�������С����
select ceil(4.26)from dual;
--3.floor()ȡС�ڲ������������
select floor(4.76)from dual;
--4.power()����1�Ĳ���2�η�������ʹ���������ݣ�
select power(4,2)from dual;
--5.mod()ȡ����
select mod(4,2)from dual;
--6.round()�������룬�ڶ���������С��������µ�λ���������ָ��С��λĬ��ȡ��
select round(4.45,1)from dual;
--7.trunc()��ȡ�������ǽ�λ����
select trunc(4.45,1)from dual;
--trunc()��������һ�����ã���ȡ���ڣ���ȡ��Ŀ��ʱ�������ʱ��
select trunc(sysdate,'hh')from dual;
--8.sqrt()������
select sqrt(16)from dual;
--9.sign����ȡ�����ֵķ��š�����0�ķ���1��С��0����-1������0����0
select sign(1034),sign(-1),sign(0)from dual;
--10.to_number���ַ�ת��������
select to_number('67','99.99')from dual;

--���ں���
--1.sysdate ��ʾ��ǰϵͳʱ��
select sysdate from dual;
--2.extract()��ȡ�ض���ʱ�䲿��
select extract(year from date'2017-05-4')year from dual;
select extract(month from date'2017-05-4')month from dual;
--3.next_day()����ָ��ʱ�����һ�����ڼ���
select next_day(sysdate,'������')from dual;
--last_day() ����ָ���µ����һ��
select last_day(sysdate)from dual;
--�����ǿ������ӷ�����ģ�����һ�����֣���ʾ�¸��µĵڼ���
select last_day(sysdate)+2 from dual;
--5.add_months()��ָ���·ݽ������㣬���ݵڶ��������������ž�����ǰ��������ƶ�������
select add_months(sysdate,-4)from dual;
--6.months_between(x,y)������������֮��������,
--�������1���ڲ���2����������������򷵻ظ������
select months_between(sysdate,to_date('2016-09-07','yyyy-mm-dd'))from dual;
--7.��������������֮�����������磺����߿����м���
select '�߿��Ѿ���ȥ��'||concat(to_char(abs(trunc((to_date
('2018-06-07','yyyy-mm-dd')-sysdate)))),'��')from dual;

--��������
--1.nvl()������if�жϣ�ѡ�е�һ�����������ֶΣ����Ϊ����ӵڶ�������������ԭ�����
select * from student;
select nvl(s_duty,'muyou')from student;
--2.nvl2���������һ���������ǿգ���������������ǿյľ����������
select nvl2(s_duty,s_duty,'muyou')from student;
--3.nullif�����Ƚ��������ʽ������������ʽ��ͬ�ͷ���null�����ʽ��ͬ���ص�һ�����ʽ
select nullif(s_duty,null)from student;
--4.decode���������һ���������ڲ�����ʱ�����ص�������������ͬʱ���ص��ĸ�����
select decode(s.s_gender,'Ů','����','�ͺ�')from student s;
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------
--����ѯ��ԭ���ǵѿ�������������ˣ���
--��������ѿ�����
--��Ȼ���ӣ��������Ϊ��ֵ����
select t.t_name from teacher t,title t1 where t.t_titleid=t1.title_id;

-----exists��ѯ,,(�Ƿ����)
select * from student where exists(select * from course where c_name like '�������γ����');

--Oracle�����
/*
Oracle��������в���ʹ��������ܣ�����ҵ����
*/

--��Χ����
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
--��������
select * from sales partition (p3);
--������洢����������
alter table sales add partition p4 values less than(Maxalue);
*/


--hash����������hash�㷨�����ȵĽ��з���
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

--�б����
/*
create table personCtiy(
       pid varchar2(32),
       pname varchar2(100),
       pcity varchar2(100)
)
partition by list(pcity)(
          partition ���Ϲ� values('����','�Ϻ�','����'),
         partition �� values('���','�ӱ�'),
         partition ���� values('����')
);

--��������

--��ѯ
select * from personCtiy partiton(���Ϲ�);
*/

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--�û�Ȩ��
----profile�ļ����û���Ҫ�ļ��������û�ʱ���û��ָ��profile��
--��ʹ��Oracle��Ĭ�ϵĸ�Ҫ�ļ������û���Ĭ���ļ���default
--������Ҫ�ļ�
create profile pro1
limit
failed_login_attempts 2--�������ε�½ʧ��
password_lock_time 2;--�����˺�����
--�޸�profile�ļ�
alter profile Pro1 
limit
password_life_time 10--ָ����������Чʱ��Ϊ10��
password_grace_time 1;--�������Ч����������������������1��


--����һ���û�yaȻ��ָ������Ϊya,���ƶ��û���Ҫ�ļ�ΪPro1
create user ya identified by ya profile pro1;

--1���ȴ���һ���û�����ʱ��Ĭ�ϸ�Ҫ�ļ�
create user yaa identified by yaa;
--2��Ȼ���ٸı䵱ǰ�û��ĸ�Ҫ�ļ�
alter user yaa profile por1

--�������״̬
--ʹ��system��¼
alter user ya account unlock;

-------------------------------------session
--------------�����½��û�Ȩ��
------1��ϵͳȨ�ޣ���¼������
--�����¼Ȩ��
grant create session to ya;
--�����û������Ȩ��
grant create table to ya;


------2������Ȩ�ޣ��������û������ı���в���
--��Ȩʹ�ÿռ�
grant unlimited tablespace to ya;
--�����û���ĳһ�ű������ʹ��Ȩ��
grant all on system.title to ya;
--�����û�����������Ȩ��
grant creatte any table to ya;
------��ɫ--role
create role role1;--������ɫ
grant create session,create table,create any table to role1;--��ɫ��Ȩ

create user lll identified by lll;

grant role1 to lll;--����ɫȨ�޸����û�lll
grant resource to lll;--�൱��unlimited tablespace
------


------------------------
---
--ͨ��show user���е�ǰ�û��Ĳ鿴




