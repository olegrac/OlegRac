-- RNC-097771/11551
-- HSsGLYWEe6CtQBQVoARpA
exec [dbo].[RevHBPayment] @MIR = 'RNC-097771/11551', @DeleteIfCompleted = 1--, @DebugInd='ON'

EXECUTE SetProcessInfo  @Info='NoRtUserCode', @TaskId = 3, @PrevInfo = null 

SELECT top 1000000 [MIR], DocNumIn, DocCode, DocState, RepNum, 	convert(int,Tstamp), Origin, [InProcess], [BlackListStatus], '>>>', *
FROM OutDocLogFull
where ((DocState = '1' and [RepNum] != 0)
		or DocState in ('b','9'))
and [InProcess] = 0
and [BlackListStatus] != '1'
and MIR = 'ORTestv4'
and [MIR] != ''




SELECT * FROM OutDocLogFull where MIR = 'ORTestv4'
SELECT * FROM OutDocLog where [DocNumIn] = '2113769'

--=======================================================
declare @RetStat int = 0,
		@MIR varchar(30) = 'Integra-6137753',
		@DocID varchar(30) = null,
		@UserCode int, 
		@DocCode tinyint, @DocNumIn int, @DocState char(1), @RepNum int, @tstamp int, @origin char(1),
		@KolKont char(1)

SELECT @DocID = ISNULL(@DocID, @MIR)

SELECT @UserCode = dbo.LoginToUC()

			EXECUTE @RetStat = OutOtkat
			@mir = @MIR,
			@KolKont = 'b',
			@StornoDel = 'd',
			@origin = 3,
	--		@baltstamp = @tstamp,
			@UserCode = @UserCode,
			@fromSQL = 'Y',
			@DebugInd = 'ON'

--====================================

select * from CashDocLog

select distinct DocState from OutDocLogFull
select distinct DocState from OutDocLog

select * from AutoActivity 
select * from OutDocLogApx where MIR = 'HSsGLYWEe6CtQBQVoARpA'


EXECUTE outpled  @StatussStr='100000000000',  @DocCodeStr='100000',  @Nenosk='%',  @nodcode=NULL,  @manager=NULL,  @manuser=NULL,  
@Komis31='%',  @ConvAmount=0,  @UserCode='0',  @SkNVeid=NULL,  @CurrAbbr='%',  @BegDay='20240212',  @EndDay='20240213',  @AccClass='%',  @AccItem='%',  @ClCode='%',  
@ContrNum='%',  @AccNum='%',  @CorBankNum='%',  @CorContr='%',  @BalAcc=NULL,  @TRN='%',  @DocNumE='%',  @AllPl='ALL',  @MTn99Only=0,  @NotesOnly=0,  @Confidentiality='1'

[BlackListStatus] - [BlackListStatusName]
[ClntLimStatus] - [ClntLimStatusName]
[AccBlockStatus] - [AccBlockStatusName]
[OrdCustDataStatus] - [OrdCustDataStatusName]
[PBAcceptStatus] - [PBAcceptStatusName]
[AmountLimStatus] - [AmountLimStatusName]



--==========================================


EXECUTE ippLoad2 @sdoccode=11, @snumin=3449532
EXECUTE ippVerLoad @sdoccode=11, @snumin=3449532

--===================================================
EXECUTE SelOutDocHist  @DocCode=17,  @DocNumIn=2108467
EXECUTE SelOutDocHist  @DocCode=11,  @DocNumIn=3451765

SELECT o.Login, o.UpdDateTime, o.FieldName, o.NewValue, o.OldValue,
	o.WallTranId, o.ProcessType, ' ', o.FieldName
	--COALESCE(u.UserName, a.UserName, o.Login),
	--ISNULL(WallTranLog.OperCode,' ')
FROM OutDocLogHist o
	--LEFT JOIN WallTranLog ON WallTranLog.TranLogId = o.WallTranId
	--LEFT JOIN Users u ON u.Login = o.Login AND u.UsRegDate <= o.UpdDateTime
	--LEFT JOIN UsersArc a ON a.Login = o.Login
WHERE o.DocCode = 17
	AND o.DocNumIn = 2108467


	--======================================================

	exec [dbo].[InsHBPayment] @MIR ='ORTestv4', @Amount='5.55', @CurrAbbr='EUR',@AccNumM='LV73CBBR1218768400020'


	EXECUTE OutDocProcessing @usercode=20, @InternalPaymentsOnly=0

	--==================================


EXECUTE GetMovAcc1  @Class='A',  @Item='A',  @Client='091111',  @ContrNum='0001',  @BankNum='',  @BankContr='',  @Currency='EUR',  @CurrCheckOnly='1'
EXECUTE selaccst  @DocNumIn=2113769,  @DocCode=17,  @accdeb='A_0876840002',  @GetCred=NULL
EXECUTE InterPay  @BenInfo='',  @HoldDate='20240517',  @ContrNumM='0002',  @ClCodeM='087684',  @AccClassM='A',  @AccItemM='A',  @AccNumM='',  @AccClassA='A',  @AccItemA='A',  @ClCodeA='091111',  @ContrNumA='0001',  @AccNumAA='',  @NameA='Client 091111',  @AddrA='ClCity091111, Addresses091111',  @AccNumA='LV62 CBBR 1129 1111 0001 0',  @BankNumA='001',  @BankNameA='BluOr Bank AS',  @BankAddrA='RŲga',  @DocState='9',  @CurrTax1='EUR',  @SummaOv=0.00,  @SummaOvT=0.00,  @OverContrNum='',  @OverContrNumT='',  @ConvAm=0.0000,  @ConvTrAm=0.0000,  @ConvTaxAm=0.00,  @ConvTrTAm=0.00,  @ConvAbbr='',  @YesLog=0,  @YesProv=0,  @DocState3='1',  @Origin='4',  @SenderType='0',  @DocNumI=2113769,  @GlobDealContr='',  @GlobDeal='',  @CorContr='',  @CorBankNum='',  @CBankCodeA=1,  @BankCodeA='CBBRLV22XXX',  @AccNumA2='',  @RealRvRate=0.00000000,  @RvUnit=0.0000,  @RealExRate=0.00000000,  @ExUnit=0.0000,  @RealRvTRate=1.00000000,  @RvTUnit=1.0000,  @RealExTRate=1.00000000,  @ExTUnit=1.0000,  @AddClCodeM='',  @AddClName='BluOr Bank',  @AddExtAcc='LV73CBBR1218768400020',  @AddClAddr='HouseNo087684 - 41',  @AddRegistr='320185-87684',  @AddClTaxC='',  @DateOfPay=NULL,  @CutOffTime=NULL,  @baltstamp=1668136951,  @Quotation=1,  @TQuotation=1,  @CounCodePol='LV',  @CounCodeSend='LV',  @EuroSrcCurr='',  @EuroSrcAmount=0.00,  @Tax1CodeSys='977',  @Tax1AmountSys=0.00,  @Tax1CurrSys='EUR',  @WallInfo='',  @OperPlace='1',  @NotaBene='',  @ServiceCode='',  @PVNAmount=0.00,  @PVNRate=0.00,  @RetCode=0,  @Tax1AmountBlor=0.00,  @Tax1BlorInTaxCurr=0.00,  @SdOpLogId=0,  @ContDeal='',  @FastProcessing=0,  @BranchM=1,  @BranchA=1,  @DocNumClnt='OR TEST v5',  @DocNumE='0200442',  @DateClnt='20240517',  @DocDate='20240517',  @DocCode=17,  @Amount=5.5500,  @Currency='EUR',  @UserCode=693,  @Tax1=0.00,  @Tax2=0.00,  @CurrAcc='EUR',  @CommDelay=0,  @OutDocCode=17,  @VidPlat='1',  @RegistrP='9000091111',  @ClTaxCoPol='4000091111',  @OperCode=0
EXECUTE ExecCheckPaym  @DocCode=17,  @DocNumI=2113769


exec [dbo].[InsHBPayment] @MIR ='ORTestv6', @Amount='6.66', @CurrAbbr='EUR',@AccNumM='LV73CBBR1218768400020'



--==================================================================
-- ###############################################################
--==================================================================

exec [dbo].[RevHBPayment] @MIR = 'RNC-097771/11551', @DeleteIfCompleted = 1--, @DebugInd='ON'

-- формирование платежки из ИБ
exec [dbo].[InsHBPayment] @MIR ='OR Testv 13', @Amount='13.13', @CurrAbbr='EUR',@AccNumM='LV73CBBR1218768400020'

exec [dbo].[InsHBPayment] @MIR ='OR Testv 14', @Amount='14.14', @CurrAbbr='USD',@AccNumM='698745123'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 15', @Amount='15.15', @CurrAbbr='EUR',@AccNumM='CH1137040044053201311'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 16', @Amount='16.16', @CurrAbbr='USD',@AccNumM='153253687'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 17', @Amount='17.17', @CurrAbbr='JPY',@AccNumM='7467263942'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 18', @Amount='18.18', @CurrAbbr='SGD',@AccNumM='8001234567'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 19', @Amount='19.19', @CurrAbbr='HKD',@AccNumM='02487428736'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 20', @Amount='20.20', @CurrAbbr='GBP',@AccNumM='GB26MIDL40051512345674'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 21', @Amount='21.21', @CurrAbbr='NZD',@AccNumM='3890162346288881'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 22', @Amount='22.22', @CurrAbbr='CAD',@AccNumM='40702810038210100536'
exec [dbo].[InsHBPayment] @MIR ='OR Testv 23', @Amount='23.23', @CurrAbbr='AUD',@AccNumM='34563465645361112222'



-- журнал платежей
SELECT top 100 [MIR], DocNumIn, DocCode, DocState, DocState1, RepNum, 	convert(int,Tstamp), Origin, [InProcess], [BlackListStatus], '>>>', *
FROM OutDocLogFull
where [DocDate] > '2023-05-20'
and DocState = '1'
and [Creator] in ('693')



--where ((DocState = '1' and [RepNum] != 0)
--		or DocState in ('b','9'))
--and [InProcess] = 0
--and [BlackListStatus] != '1'
--and MIR = 'HSsGLYWEe6CtQBQVoARpA'
--and [MIR] != ''

-- обработка платежей
exec [dbo].[OutDocProcessing] @InternalPaymentsOnly=1


--DocNumIn
1330065
1330066
2113771
2113772

--MIR
OR Testv 9
OR Testv 10

--удаление платежей
exec [CBBR_RevHBPayment] @DocID = 'OR Testv 13', @DeleteIfCompleted = 1--	@FromSQL = 'Y'


-- синхронизация с ИБ
exec [dbo].[GetHBState]

--test test test test test test test test test test 
--test test test test test test test test test test 
--test test test test test test test test test test 