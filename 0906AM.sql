--0906AM

select * from userlogin;
--�޸����ݿ��ı�ṹ
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

--�û����(�û��� || ���� || �ֻ�) && (����)��¼
--drop table userlogin

create table userlogin(
  username varchar2(500) not null,
  useremail varchar2(300) not null,
  userphone varchar2(11) not null,
  usperpwd varchar2(30) not null
);

select * from userlogin where 
(username='' or useremail='' or userphone='') and (userpwd='123456');

--��ѯ
--1.��ı���,�ڱ����ĺ������һ�����������ƣ���Ϊ��ı����������������ʱ��

select s.s_name,s.s_gender,s.s_nation from student s;
--�еı���
select s.s_name ����  from student s;
--����еı����пո���Ҫ���˫����Ȼ�����һ��as�Ĺؼ���
select s_name as "student name"  from student;

select * from student s;
--�п��Խ����������
select s.s_chinese+s.s_math+s.s_foreign �ܳɼ� from student s;

--�����У�����ʾ�������޸�Ԫ���ݽṹ
select s.s_name,'�й�' ���� from student s;

select * from student s where s.s_gender='Ů';
--ͨ����ѯ����һ�ű�
create table boy as select * from student s where s.s_gender='��';
--drop table girl;
select * from girl;
--����һ���µı�ṹ��û������
create table girl as select * from student s where 1=2;

--��girl����������������
--ע�⣺���ȱ���Ҫ�Ƚ�����Ȼ������������
insert into girl select * from student s where s.s_gender='Ů';
commit;
--����û�д����ı��ǲ��ܽ���������ӵ�
insert into demo_1 select * from student

--Oralce���ַ�����ƴ��ʹ��||��˫����
select * from student s
select '������' || s.s_name || '���Ա�' || s.s_gender ������Ϣ from student s;

--�ۺϺ���
--1.count:ͳ������
--2.sum���
--3.avg����ƽ��ֵ
--4.max�����ֵ
--5.min����Сֵ

select * from student
--count
--1.����һ���ж�����
select count(*) from student;

--2.����һ���ж�������
select '��������:' || count(*) ͳ�� from student s where s.s_gender='��';

--3.�������ĳɼ���100��120��֮��������ж���
select count(*) from student s where s.s_chinese >=100 and s.s_chinese <=120;
select count(*) from student s where s.s_chinese between 100 and 120;
--ע��:>= and <=��between and������д��Ҳͬ���������������ͣ�
--����>= and <=ִ��Ч�ʱ�between and Ҫ�ߣ��Ƽ�����>= and <=

--4.�������ŵ�ͬѧ������
--ͨ��ģ������,%��ʾ���ⳤ�ȵ��ַ���_��ʾ�����һ���ַ�
select * from student s where s.s_name like '��%';
select * from student s where s.s_name like '��_';

--sum:���,ʹ��sum����ʱ������Ҫָ�����������
--1.���й���081�༶�����ĳɼ����ܷ��Ƕ���
select sum(s.s_chinese) from student s where s.s_classname = '����081';

--avg:��ƽ��ֵ,����Ҫָ����������ƽ��
--1.���й���081������ĳɼ���ƽ��ֵ�Ƕ���
select avg(s.s_chinese) from student s where s.s_classname = '����081';

--max�������ֵ,����Ҫָ�������������ֵ
--1.���й���081������ĳɼ�����߷�
select max(s.s_chinese) from student s where s.s_classname = '����081';

--min������Сֵ,����Ҫָ������������Сֵ
--1.���й���081������ĳɼ�����ͷ�
select min(s.s_chinese) from student s where s.s_classname = '����081';

--��ֵ�ж�
--ʹ��is null��ʾ����Ϊ��
select * from student s where s.s_duty is null;

--����student������ְ�������
--ʹ��is not null����ʾ���ݷǿ�
select * from student s where s.s_duty is not null;

--���������Ǻ���������ѧ����Ϣ
select * from student s where s.s_nation='����' or s.s_nation='����'

--ʹ��in�ؼ�������ѯĳһ����Χ�е�����
select * from student s where s.s_nation in('����','����');

--��ѯstudent���У�����������߲��Ǻ����ѧ����Ϣ
select * from student s where s.s_nation not in ('����','����');

--д���ɾ����䣬ɾ��һ������
delete from student s where s.s_id in ('0807010202' , '0807010203' ,'0807010206');
rollback;


--ͨ������distinct�ؼ��֣�ȥ���ظ���¼
select distinct s_duty from student s where s.s_duty is not null;

--��ȡ��ǰϵͳʱ��
--dual��û���κ����ã�����Ϊ�����Oracle���﷨
--select * from dual;����ֵ��һ��x
--sys_guid()��������32λ��GUID����
select sys_guid() from dual;
--sysdate���ڻ�ȡ��ǰ������ʱ��
select sysdate from dual;
--Oracle�е�Ĭ��ʱ������-��-�겢������к���λ���磺06-9�� -18

select * from teacher;
--����2006���Ժ���ְ�Ľ�������
--to_date,���ַ�������Ԥ�����ʽ��ת��Ϊ����
--to_date��һ����������һ�����ڵ��ַ���
--�ڶ�����������Ҫ����ת���ĸ�ʽ
select * from teacher t where t.t_entertime >= to_date('2006-12-31','yyyy-mm-dd');

--������ְʱ���������ʦ��Ϣ
select min(t.t_entertime) from teacher t;

--��ְʱ���������ʦ����Ϣ
select max(t.t_entertime) from teacher t;

--���ҽ�ʦ������ְʱ��Ϊ2000���Ժ�ģ�4����ְ�Ľ�ʦ��Ϣ
--to_char(x,y)
--��һ������x��ʾ��һ���������͵��л��߱���
--�ڶ�������y��ʾ�����������ͽ��и�ʽ�������ģ��
select * from teacher t where to_char(t.t_entertime,'yyyy-mm-dd') like '200_-04%';

--���� group by
--1.������÷��飬��Ա��е����ݽ��кϲ�ͬ����ڲ�ѯʱ������ʹ��*�ͷǷ�����
--ͳ��ÿ���༶�����ĵ�ƽ����
select * from student;
--��ִ��where��䣬�����Ƕ�ԭʼ�����һ�����ݵ�ɸѡ
--ɸѡ�Ժ󣬶����ݽ��з���
--���������༶������
--�ڷ����Ժ��������ʹ��order by ��䣬������Ĭ�ϵ���������������asc��
--����ǵ�����߽�������ʹ��desc���д���
--��������Ժ��в�ѯ����ʹ��having���д���having����ڷ���order byǰ��
--�����SQL�����д��Ҫ��select �� from ���� where ,group by,having,order by
select s.s_classname,count(*) from student s 
where s.s_political='������Ա'
group by s.s_classname
having count(*) >28
order by 1 asc;
--�ڲ�ѯ�п���ʹ���Ѿ���ѯ��������е������Ž��з��ʣ������뱻������еĸ�����ͬ
--��where��������е�����ֵ�ǲ���ȷ��
select s.s_id,s.s_name,s.s_gender from student s where 3='Ů'

















