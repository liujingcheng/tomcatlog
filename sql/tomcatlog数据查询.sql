--����10��
select * from [APIItemLog].[dbo].[TomcatAccess]
where Duration>10;

--��ĳ��ʱ��ε�����
select * from  dbo.TomcatAccess 
where 1=1
--and RequestTime>'2016-06-03 14:46:47.000' and RequestTime<'2016-06-03 14:48:47.000'
--and RequestUrl like '%update%'
order by RequestTime

delete from  dbo.TomcatAccess 
where RequestUrl = 'localhost_access_log_ApiProduction.2016-06-03.txt';

select distinct [FileName] from dbo.TomcatAccess;

--��url/����ʱ��/����ʱ�� ����
SELECT RequestUrl,Duration,RequestTime FROM [APIItemLog].[dbo].[TomcatAccess]
GROUP BY RequestUrl,Duration,RequestTime
having Duration>10 AND RequestTime>'2017-08-01' ORDER BY Duration desc;