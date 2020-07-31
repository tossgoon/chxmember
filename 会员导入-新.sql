declare @year int;
declare @month int;
declare @tbname varchar(50);
--定义表变量
IF OBJECT_ID('tempdb..#tb_kh') IS NOT NULL
BEGIN
 DROP TABLE #tb_kh
END
Create Table #tb_kh
(
    khbm VARCHAR(50),
    khmc VARCHAR(50),
    cbj DECIMAL(18,2),
    zje DECIMAL(18,2),
    lr DECIMAL(18,2)
);
set @year=2016;
set @month=1;
WHILE @year<2021
BEGIN
   Set @month=1
   while @month<13
       begin
		if @month<10
			begin
				set @tbname='H'+convert(varchar(50),@year) +'0' +convert(varchar(50),@month)+'sale_xsd_jb_fd'
			end
		else
			begin
				set @tbname='H'+convert(varchar(50),@year)+convert(varchar(50),@month)+'sale_xsd_jb_fd'
			end
			if Exists(select top 1 * from sysObjects where Id=OBJECT_ID(@tbname) and xtype='U')
			begin

			--在临时表中插入数据
				delete from #tb_kh;
				exec ('insert into #tb_kh(khbm,cbj,zje,lr) select khbm,sum(cbje),sum(zje),sum(zje)-sum(cbje) from '+ @tbname
				+' where khbm is not null and khbm <>'''' group by khbm')
			--插入明细数据
				insert into y707.dbo.chx_member_detail(CardID,MonthDate,Cost,Total,Profit)
				Select khbm,convert(datetime,convert(varchar(50),@year)+'-'+  convert(varchar(50),@month) +'-01'),cbj,zje,lr
				From #tb_kh;
			--1.判断是否存在会员，首先进行更新
				Update y707.dbo.chx_member Set Sale_Sum=Sale_Sum+tkh.zje,Profit_Sum=Profit_Sum+tkh.lr,
				LastSaleDate=convert(datetime,convert(varchar(50),@year)+'-'+convert(varchar(50),@month)+'-01')
				From #tb_kh tkh
				Where y707.dbo.chx_member.CardID=tkh.khbm
				And Exists(Select 1 From y707.dbo.chx_member cm Where cm.CardID=tkh.khbm);
			--2.判断是否存在会员，没有则插入
				insert into y707.dbo.chx_member(CardID,Sale_Sum,Profit_Sum,LastSaleDate,MemName)
				Select khbm,zje,lr,convert(datetime,convert(varchar(50),@year)+'-'+convert(varchar(50),@month)+'-01'),''
 				From #tb_kh tkh
				Where Not Exists(Select 1 From y707.dbo.chx_member cm Where cm.CardID=tkh.khbm);
			end		
		set @month=@month+1
     end 
     set @year=@year+1
END
IF OBJECT_ID('tempdb..#tb_kh') IS NOT NULL
BEGIN
 DROP TABLE #tb_kh
END
