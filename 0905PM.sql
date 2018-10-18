
  --������
  --�������ʱ����Ҫָ���������е���������
  --��Oracle�У��ַ�����һ�㶼��ʹ��varchar2������ͣ�varchar2������Oracle�Լ����е�����
  --ָ���ַ����͵����ݻ�Ҫָ�����ܴ�Ŷ��ٸ��ַ�д�����£�varchar2(100)���˴���100��ָӢ���ַ��ĸ���������������˵����2
  --��һ�ֱȽ�������������������������֤�ţ�����Ψһ�ԣ�����ΪGUID��UUID����һ����32�Ǹ�Ӣ���ַ������ּ���4���������
  --��Oracle������UUID�ķ�����sys_guid()������ʹ��select sys_guid() from dual;
  --Ҫ���г�Ϊ�����У���Ҫ���еĺ������primary key�ؼ���
  --������֮���ö��Ž��зָ�
  --���еĺ������not null����ʾ����е�ֵ�ǲ���Ϊ�յģ�Ҳ���Ǳ���Ҫ��д
  select sys_guid() from dual;
  create table t_users (
    userid varchar2(32) primary key,
    username varchar2(100) not null,
    userage number(3) not null,
    usersex number(1) not null
  );
  
  --�������
  --ͨ��insert�����ʵ�֣������������Ӧ�÷���values�����Բ������
  --Ĭ����������ݵĲ���˳��Ӧ�úͽ����ǵ�˳�򱣳�һ�£���������ҲӦһ��
  --���ݲ����Ժ���Ҫ��ͨ��commit�����������ݵ��ύ��û���ύ�����ݲ��������ݿ��д洢
  --������������еĲ��������⣬�����ͨ��rollback�����һ�εĴ�����г���
  --�����Ҫָ�����ݵĲ���˳������Ҫ��values֮ǰ����˵��
  insert into t_users (username,usersex,userid,userage) values ('jim',1,sys_guid(),73);
  insert into t_users values (sys_guid(),'bill',23,1);
  insert into t_users values (sys_guid(),'tom',13,1);
  insert into t_users values (sys_guid(),'jerry',33,1);
  insert into t_users values (sys_guid(),'jack',43,1);
  insert into t_users values (sys_guid(),'rose',53,2);
  insert into t_users values (sys_guid(),'peter',63,1);
  
  commit;--�ԸղŲ�������ݽ����ύ
  rollback;--�����ղ���������еĲ���
  
  --�鿴��
  --��select�Ĳ�ѯ�����*����ȫ����ѯ
  --��ѯʱҲ����ָ���н��в�ѯ
  --�ڲ�ѯʱ�������Ҫ�����ݽ���ɸѡ����ʹ��where�ؼ���,��t_users���в����Ա���2����
  --����ж��������Ҫ���в�ѯ��Ҫ��and &&������or ||
  --�����ѯ�Ա���1�Ĳ����������40�����
  select * from t_users;
  select username,userage from t_users;
  select * from t_users where usersex = 2;
  select * from t_users where usersex = 1 and userage>40;
  select * from t_users where usersex =1 and username = 'peter';
  
  --���±�
  --�ؼ�����update
  --updateĬ��������Ǹ������ű�
  --�����Ҫ��ĳ�������ݽ��и��£�����Ҫ���where�ؼ���
  --һ������ݸ��¶��ǲο��������еģ�һ�������Լ��ǲ��ܸ��µ�
  --����漰�����и��£��ö��Ž��зָ�
  
  update t_users set userage=99;
  update t_users set userage=80 where userid='469230876C004592B196220BB859939E';
  update t_users set userage=99,usersex=3,username='�Ž���';
  
  
  --ɾ������
  --������ɾ��һ���Ϊ���֣�һ��������ɾ����һ�����߼�ɾ��
  --û��where�ؼ��֣��൱�ڽ����ű������ȫ��ɾ�������ǳ�Σ�գ�����
  --ɾ������Ҳ�ǲο�����
  delete from t_users;
  delete from t_users where userid='6475E7BE6EB54036A3945384F06C5644';
  
  --ɾ����
  --ɾ�����ǲ��ܽ��г��������ģ�����Σ�գ�����
  drop table t_users;
  
  --����һ�ŵ�¼��
  create table userlogin(
    userid varchar2(32) primary key,
    username varchar2(100) not null,
    userpwd varchar2(20) not null
  );
  
  --�����������
  insert into userlogin values(sys_guid(),'bill','123456');
  insert into userlogin values(sys_guid(),'tom','222222');
  insert into userlogin values(sys_guid(),'jerry','333333');
  insert into userlogin values(sys_guid(),'jack','666666');
  commit;
  
  --���Բ������
  select * from userlogin;
  
  --Ҫ���ж��û���¼�Ƿ�ɹ�
  --������ǵĲ�ѯ���ǹ�ע������������ʹ�þۺϺ����е�count����
  select * from userlogin where username='bill' and userpwd='123456';
  
  select count(*) from userlogin where username='bill1' and userpwd='123456';
  
