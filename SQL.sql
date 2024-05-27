-- test  test  test  test  test  test  test  test  test  test  test 


EXECUTE RefClients  @ClStat='',  @ObjKey='049715',  @LastDate='19000101'
EXECUTE WallTranStart  @ProcId='_6VV0L48EQ',  @OperCode='R33000'
EXECUTE ManagerList
EXECUTE seladdfeatures  @objcd='C'
-- EXECUTE selclrow  @clicod='049715',  @Shw=1,  @forpers='1',  @PersYes=1
EXECUTE selobjv  @ObjCode='CCCCCCC$$$$$$$$$',  @FeatCode='TNSAECJLAIEFDSGC'
EXECUTE selobjv  @ObjCode='C',  @FeatCode='9'
EXECUTE SelObjColorsFV
EXECUTE SelRelations  @WithDest=1,  @RightIgnore=1
EXECUTE SelSalChList  @FromCntr=1
EXECUTE GetDocNotes  @DocNumExt='049715',  @DocCode=254
EXECUTE IfClientBankUser  @ClCode='049715'
EXECUTE SelSignPers  @PersID='049715',  @RelID=0,  @ForCheck=0,  @PersVisible=1,  @DibName='dibinЖtЖjs'


--====================================================

EXECUTE selclrow  @clicod='049715',  @Shw=1,  @forpers='1',  @PersYes=1

--====================================================

	SELECT 
		ClnOperator = ISNULL(ClnOperator, '   '), CnnOpName = ISNULL(u1.UserName, ' '), 
		PrivateBanker = ISNULL(PrivateBanker, '   '), PBankerName = ISNULL(u2.UserName, ' '), 
		'>>>>>>>>>',
		Clients.ClCode, ClName, ClAddr, ClCity, ClCounCode, 
		Relation, BankNum=ISNULL(BankNum,'   '), ClTaxCode, MainBranch, 
		InItemInd, ClReg, ClZip, --ClPhone=ISNULL(@Phone, ' '), ClFax=ISNULL(@Fax, ' '), 
		PassInfo=REPLICATE(' ',15), ResInd, PersonInd, CompanType, 
		TarGrInd, CodedInd, ClRegDte=CONVERT(char(10), ClRegDate, 103), 
		Economy, ClMngr, UserNum=ISNULL(Clients.UserNum,'   '), RiskInd, FinInd, 
		ClDigiPass, AddrSwift = ISNULL(AddrSwift, 0), 
		ClStatus, 
		ClPaymentLimitCurr=ISNULL(ClPaymentLimitCurr, REPLICATE(' ', 100)), 
		Pseudonym = CASE 
				WHEN CodedInd ='1' AND CHARINDEX('|', Clients.DOSName) > 0 
					THEN CONVERT(char(45), RIGHT(Clients.DOSName, DATALENGTH(Clients.DOSName)-CHARINDEX('|', Clients.DOSName))) 
				ELSE REPLICATE(' ', 45) END, 
		Tstamp=CONVERT(int, Clients.Tstamp), COldUs = Clients.UserCode, BlackListStatus, 
		ML_Risk, MLR_Num = ISNULL(o.ValOrder, 0), MLR_Name = ISNULL(o.ValName, ' '), 
		RAgency = ISNULL(RAgency, ' '), RValuation = ISNULL(RValuation, ' '), RValDate, RGeneral, 
		ML_RNotes = ISNULL(ML_RNotes, ' '), DelStatusDate = CONVERT(char(10), DelStatusDate, 103), 
		ClnOperator = ISNULL(ClnOperator, '   '), CnnOpName = ISNULL(u1.UserName, ' '), 
		PrivateBanker = ISNULL(PrivateBanker, '   '), PBankerName = ISNULL(u2.UserName, ' '), 
		ServiceLevel, InterPersCode, SaleChannelType, SaleChannelName, 
		MainActCoun = ISNULL(MainActCoun, '  '), OldMainActCoun = ISNULL(MainActCoun, '  '), 
		BusinessRelCoun = ISNULL(BusinessRelCoun, '  '), 
		InGoodGroup, GoodGroup = ISNULL(GoodGroup, ' '), ShellCompany, PEPInd, ML_RiskGrp, 
		CLstUpd=Clients.LastUpdate, --Pstamp = @TsTmp, POldUs = @POldUs, PLstUpd = @PLstUpd,
		LEI_Code = ISNULL(Clients.LEI_Code, REPLICATE(' ', 20)), 
		LEI_Dte = ISNULL(CONVERT(char(10), Clients.LEI_Dte, 103), REPLICATE(' ',10)), /*, RemoteIdent */ 
		[KPVCode], ISNULL((select UserName from Users u3 where u3.UserNum = Clients.[KPVCode]),' ') as [KPVName],
		[KAVPCode], ISNULL((select UserName from Users u4 where u4.UserNum = Clients.[KAVPCode]),' ') as [KAVPName],
		[FARFVPCode], ISNULL((select UserName from Users u5 where u5.UserNum = Clients.[FARFVPCode]),' ') as [FARFVPName]
	FROM Clients 
		LEFT JOIN ObjFeaVals o ON o.ObjCode = 'C' AND o.FeatCode = 'J' AND o.ValCode = Clients.ML_Risk 
		LEFT JOIN Users u1 ON u1.UserNum = Clients.ClnOperator 
		LEFT JOIN Users u2 ON u2.UserNum = Clients.PrivateBanker 
	WHERE Clients.ClCode='049715'

	-------------------------------

	select ClnOperator as 'Operatora Cods', PrivateBanker as 'KAV Cods', *
	from Clients WHERE Clients.ClCode='049715'

insert into [WallDevRac].[dbo].[Users] ( [UserNum]
      ,[Authority]
      ,[UserName]
      ,[Login]
      ,[UserPassw]
      ,[PasswDate]
      ,[UserMenu]
      ,[UserAddr]
      ,[PassInfo]
      ,[ClCode]
      ,[PersID]
      ,[UserReg]
      ,[UserPhone]
      ,[ProfType]
      ,[NBinCharge]
      ,[OperPerm]
      ,[CashRegNum]
      ,[AuthKey]
      ,[PlaceOpDate]
      ,[PlaceStatus]
      ,[CloseStat]
      ,[InPicture]
      ,[Picture]
      ,[ReutersDealerCode]
      ,[Status]
      ,[UsRegDate]
      ,[DOSName]
      ,[UserCode]
      ,[LangNum]
      ,[OfficeMail])
SELECT '694' [UserNum]
      ,'Y' [Authority]
      ,'Rezņika Alla' [UserName]
      ,'BANK\allarez' as [Login]
      ,[UserPassw]
      ,[PasswDate]
      ,'ADMN' [UserMenu]
      ,'UserAddr 694' [UserAddr]
      ,'PassInfo 694' [PassInfo]
      ,null [ClCode]
      ,[PersID]
      ,[UserReg]
      ,[UserPhone]
      ,[ProfType]
      ,[NBinCharge]
      ,[OperPerm]
      ,[CashRegNum]
      ,[AuthKey]
      ,[PlaceOpDate]
      ,[PlaceStatus]
      ,[CloseStat]
      ,[InPicture]
      ,[Picture]
      ,[ReutersDealerCode]
      ,[Status]
      ,[UsRegDate]
      ,[DOSName]
      ,[UserCode]
      ,[LangNum]
      ,[OfficeMail]
  FROM [WallDevRac].[dbo].[Users]
  	where [Login] in ('BANK\jelenab')


	select UserNum, * from Users --where UserNum in ('618','567')
	where [Login] in ('BANK\ainarss','BANK\jelenab','BANK\allarez')
-- User 567	BANK\ivetap (KAV)
-- User 618	BANK\jevgenijam	()
-- User		BANK\janabeb (Operator)
-- User 023	BANK\jelenab (KAVP)
-- User 463	BANK\ainarss (KPV)
-- User 694 BANK\allarez (FARFVP)
	---------------------------------




-- ainarss	Siugalis Ainārs	
-- jelenab	Kočetkova Jeļena	
-- allarez	Rezņika Alla

SELECT	[Login] as [KAV Code], --varchar(32)
		[PB] as [KAV Name], --varchar(64)
		[LoginO] as [Operator Code], --varchar(32)
		[ClMngr] as [Operator Name], --varchar(64)
		'' as [KAUP 2],
		'>>>',
		[LoginS] as [KPVCode], --varchar(32)
		[Assist] as [KPVName], --varchar(64)
		[LoginA] as [KAVPCode], --varchar(32)
		[Analyst] as [KAVPName], --varchar(64)
		[LoginM] as [FARFVPCode], --varchar(32)
		[PBM] as [FARFVPName], --varchar(64)
		'>>>', *
  FROM [WallDevRac].[dbo].[CBBR_CCRM]


  alter table [dbo].[ClientsApx] add [KPVCode] varchar(32) null, [KAVPCode] varchar(32) null, [FARFVPCode] varchar(32) null


  --======================================================
  -- 5 p.
  --======================================================

EXECUTE RefCreContr  @OneTab=2,  @ObjKey='049715', @ContrKey='0003',  @Class='C',  @LastDate='19000101'

 

declare @OneTab int =2,  @ObjKey varchar(6)='049715', @ContrKey varchar(4)='0003',  @Class varchar(1)='C',  @LastDate datetime ='19000101', @Item char(1) ='A'
DECLARE @CurBranch tinyint, @ForRwCn int, @ClntLoad char(1)
SELECT @CurBranch=1, @ForRwCn = 1



      SELECT XCreContr.ClCode, XCreContr.ContrNum, 
            XCreContr.AccStatus, Persons.PersName, 
            XCreContr.AccName,
            XCreContr.CurrAbbr,
            XCreContr.CurrType, 
            XCreContr.ContExtNum, XCreContr.ContrTerm, 
            XCreContr.PurpType, XCreContr.CreditPurpose, XCreContr.DepoType,
            CONVERT(char(10), CrCondit.CurPercDat, 103), 
            CONVERT(char(10), XCreContr.StartDate, 103),
            CONVERT(char(10), CrCondit.ObligDate, 103),
            CONVERT(char(10), XCreContr.EndDate, 103), 
            CONVERT(char(10), CrCondit.RelCrDate, 103), 
            CrCondit.ReliableCr,XCreContr.AssetClass, CrCondit.AssetQlty, CrCondit.Amount, CrCondit.Rate, CrCondit.LimRate,
            CrCondit.GroupRisk, CrCondit.ResAmount, CrCondit.ResPrAm, 
            CrCondit.SumAm-CrCondit.RtnSumAm, XCreContr.ContrType,CredPledgeInd, 
            CrCondit.RecPrInd,CrCondit.RecPnInd,CrCondit.CredLineInd, 
            XCreContr.Manager, GroupName, --!!!
            CrCondit.RoundCred, CONVERT(int,XCreContr.Tstamp), 
            XCreContr.UserCode, 'A', 
            CONVERT(char(8),XCreContr.LastUpdate,2)+' '+ 
                CONVERT(char(5),XCreContr.LastUpdate,8), 
            CASE WHEN XCreContr.Alert !='' THEN '+' ELSE ' ' END,XCreContr.Alert,CrCondit.ConsentInd,
            CrCondit.SumAm, 0, 
            0, 0, 0, 0, 0,
            CrCondit.Manual,CrCondit.ManualPaym,CrCondit.PayCommIndAcc,
            Scheduled = '1',Overdraft = 0,MultiCurr = 0,OverAcc = '',                
            '',   
            GETDATE(),CONVERT(char(10), CrCondit.DateGet, 103),CONVERT(char(10),LetterWarningDate, 103),            
            CONVERT(char(10),ClsdAccs.CloseDate, 103),
            CONVERT(char(10), CrCondit.LongDate, 103),          
            '', 
            pb.PersID,pb.PersName,XCreContr.CnBrother
			, CRSI.QualityRate
			, CASE WHEN CrCondit.FloatInd <> '0' THEN CrCondit.MinRate ELSE null END
			, CASE WHEN CrCondit.FloatInd <> '0' THEN CrCondit.MaxRate ELSE null END
			, CASE WHEN CrCondit.FloatInd <> '0' THEN CrCondit.FixedRate ELSE CrCondit.Rate END
			, CASE WHEN CrCondit.FloatInd <> '0' THEN CrCondit.Rate - CrCondit.FixedRate ELSE null END
			, CASE WHEN CrCondit.FloatInd <> '0' THEN 0 ELSE 1 END -- MinRateIsNull
			, CASE WHEN CrCondit.FloatInd <> '0' THEN 0 ELSE 1 END -- MaxRateIsNull
			, CASE WHEN CrCondit.FloatInd <> '0' THEN 0 ELSE 0 END -- FixedRateIsNull
			, CASE WHEN CrCondit.FloatInd <> '0' THEN 0 ELSE 1 END -- FloatRateIsNull

        FROM XCreContr
        join CrCondit on CrCondit.ClCode = XCreContr.ClCode 
                            AND CrCondit.ContrNum = XCreContr.ContrNum 
                            AND CrCondit.Actual='1' 
        join Persons on Persons.PersID = XCreContr.ClCode
        LEFT JOIN Persons pb ON XCreContr.ClBrother=pb.PersID 
        join ManagerGroups on ManagerGroups.GroupCode = XCreContr.Manager 
        left join ClsdAccs on 'CA' + XCreContr.ClCode + XCreContr.ContrNum = ClsdAccs.BankAcc
	LEFT JOIN Contracts FC ON FC.ClCode = XCreContr.ClCode AND FC.ContrNum = XCreContr.ContrNum
	LEFT JOIN CrSupervisoryInfo CRSI ON CRSI.ClCode = FC.ClCode AND CRSI.ContrNum = COALESCE(NULLif(FC.CnFather,''), FC.ContrNum) AND CRSI.OverContr = 0 AND CRSI.Actual = '1'
	LEFT JOIN ObjFeaVals QR ON QR.ObjCode = 'K' AND QR.FeatCode = 'n' AND QR.ValCode = CRSI.QualityRate -- значение QualityRate берём у свойства n (Klienta saistību vērtības samaz.novērt. metod -
     WHERE XCreContr.ClCode=@ObjKey  
            AND XCreContr.ContrNum=@ContrKey 
            AND XCreContr.ContrType NOT IN ('V','X') 
            AND EXISTS( SELECT * FROM AccState (NOLOCK) 
                WHERE  AccState.Branch=@CurBranch 
                    AND AccState.BankAcc='C'+@Item+XCreContr.ClCode+ 
                        XCreContr.ContrNum) 


select * from XCreContr where [ClCode] = '049715'

--=======================================================
-- 6p
--======================================================
EXECUTE RefCreContr  @OneTab=2,  @ObjKey='049715',					@Class='C',  @LastDate='19000101'

---------------------------------------------------------
-- 7p
---------------------------------------------------------

EXECUTE FiskalOverdraft  @Type=1,  @ManualProf=0,  @EndDay='20230101'

--------------------------------
-- 8 p
--------------------------------

EXECUTE SelPledRep @AccStatus=''

---------------------------------
-- 9
------------------------------
select * from [dbo].[ClientsApx]
select * from [dbo].[Clients]

EXECUTE SelInsureRep  @OnDate='20240509',  @RegPoliceTerm=1,  @FromDate='20240425',  @ToDate='20240425',  @RegRestr=0 



