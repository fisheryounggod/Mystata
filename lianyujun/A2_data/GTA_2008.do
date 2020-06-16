

*---------------------------
*- 中国上市公司研究数据库
*---------------------------

*- 数据来源：CCER，GTA
*- 制 作 者：连玉君
*- 最后更新：2009.08.30

*- 请参阅《中国上市公司研究数据库》说明书（pdf文档）


   cd D:\DATA\CCER\2008_new

   use D:\DATA\GTA\CSMAR_FS.dta, clear
   
   gen year = real(substr(accp, 1, 4))
   drop accper
   rename stkcd id
   order id year
   tsset id year   

   merge id using "D:\DATA\GTA\CSMAR_data\CG_Co.dta"
   drop _merge    // 公司基本信息
   tsset id year
   
   merge id year using "D:\DATA\GTA\CSMAR_data\CG_Ybasic.dta" 
   drop _merge    // 治理综合信息
   tsset id year

   merge id year using "D:\DATA\GTA\CSMAR_data\CG_Capchg.dta"
   drop _merge    // 股本结构
   drop nshrttl
   rename a003101000 nshrttl
   tsset id year

 
*====================  Part II ======================       
*             == 合并治理机制数据 ==========
*====================================================
*  GTA_2008_CG

*- 公司基本信息: CG_Co
   *use D:\DATA\GTA\CSMAR_data\CG_Co.dta, clear

    label var	stktype	"股票类型"
    label var	crcd		"A/B/H股交叉码"
    label var	nindcd	"行业代码B(CSRC2001)"
    label var	indnme	"行业名称A(CSRC1999)"
    label var	indcd		"行业代码A(CSRC1999)"
    label var	regcap	"注册资本"

*- 治理综合信息文件: CG_Ybasic
   *use D:\DATA\GTA\CSMAR_data\CG_Ybasic.dta, clear
    label var	y0301b	"股本结构是否变化(1-不变, 2-变)"
    label var	y0401b	"股东总数"
    label var	y0501b	"前十大股东是否存在关联"
    label var	y0601b	"员工人数"
    label var	y0701b	"离退休职工人数"
    label var	y0801b	"董事长名称"
    label var	y0901b	"总经理名称"
    label var	y1001b	"董事长与总经理兼任情况"
    label var	y1101a	"董事人数"
    label var	y1101b	"其中-独立董事人数"
    label var	y1201a	"监事总规模"
    label var	y1301b	"高管人数"
    label var	y1401b	"年薪披露方式"
    label var	y1501a	"董事、监事及高管报酬总额"
    label var	y1501b	"其中-董事、监事及高管津贴总额"
    label var	y1501c	"董事、监事及高管前三名薪酬总额"
    label var	y1501d	"董事前三名薪酬总额"
    label var	y1501e	"高管前三名薪酬总额"
    label var	y1601a	"未领取薪酬的董事、监事及高管人数"
    label var	y1601b	"其中-未领取薪酬董事人数"
    label var	y1601c	"其中-未领取薪酬监事人数"
    label var	y1701a	"委员会设立总数"
    label var	y1701b	"其中-四委设立个数"
    label var	y1701c	"其中-其他委员会设立个数"
    label var	y1801b	"独立董事与上市公司工作地点一致性统计"  
  

*- 股本结构信息：CG_Capchg
   *use D:\DATA\GTA\CSMAR_data\CG_Capchg.dta, clear
    label var	id		"证券代码"
    label var	year		"会计年度"
    label var	nshrttl	"总股数"
    label var	nshrnn	"未流通股份"
    label var	nshrstt	"其中-国有股股数"
    label var	nshrlpd	"其中-境内发起人法人股股数"
    label var	nshrlpf	"其中-境外发起人法人股股数"
    label var	nshrlpn	"其中-募集法人股股数"
    label var	nshremp	"其中-内部职工股股数"
    label var	nshrmf	"其中-基金配售股数"
    label var	nshrrot	"其中-转配股股数"
    label var	nshrprf	"其中-优先股股数"
    label var	nshrunl	"其中-流通配送股尚未流通股数"
    label var	nshrsms	"其中-高级管理人员持股数"
    label var	nshrglea	"其中-一般法人配售数"
    label var	nshrsina	"其中-战略投资者配售数"
    label var	nshrlpo	"其中-其他发起人股股数"
    label var	nshrn		"已流通股份"
    label var	nshra		"其中-A股流通股数"
    label var	nshrb		"其中-B股流通股数"
    label var	nshrh		"其中-H股流通股数"
    label var	nshroft	"其中-其它境外流通股"


preserve
   *= 股权结构 (数据来源:CCER)
   forvalues i = 1/4{
     insheet using CG_ccer_2008_0`i'.txt, clear
     qui tsset id year
     save CG_ccer_2008_0`i'.dta, replace
   }
   use CG_ccer_2008_01.dta, clear
   qui tsset id year
   forvalues i = 2/4{
     merge id using CG_ccer_2008_0`i'.dta
     qui tsset id year
     drop _merge
   } 
   save gc_2008, replace  
  *= 与 2000 年以前的数据合并
    use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
    local v1 "rcontrol cr5index cr10index zindex herf5index herf10index"
    local n1 "d21 d22 d23 d24 d25 d26"
    local v2 "skhdr1 skhdr2 skhdr3 skhdr4 skhdr5"
    local n2 "d27 d28 d29 d30 d31"
    local v3 "skhdr6 skhdr7 skhdr8 skhdr9 skhdr10"
    local n3 "d32 d33 d34 d35 d36"
  *= 重命名变量
    renvars `v1' `v2' `v3' \ `n1' `n2' `n3'
    keep id year `n1' `n2' `n3' 
    keep if year<2000
    save CCER_1999_gc, replace 
  *= 与2000-2007数据合并 
    use D:\DATA\CCER\2007_new\gc_2007.dta, clear
    append using gc_2008.dta 
  *= 与2000年以前的数据合并
    append using CCER_1999_gc.dta
  *= 保存公司治理数据  
     tsset id year    
     save gc_1990_2008, replace
  *========================
restore
   merge id year using gc_1990_2008
   drop _merge    // 合并公司治理信息
   tsset id year
  
  
preserve
   *= 增加股本信息
    * 2006年以前的信息
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year totalshr ntshr tshr ashr bshr hshr mv_total mv_atshr
       tsset id year
    * 增加 2007-2008 资料
       append using ccer_cap_2007_2008.dta
       tsset id year
       save ccer_cap_1990_2008, replace   
restore
    merge id year using ccer_cap_1990_2008
    drop _merge   // 合并 股本结构和市值 指标
    tsset id year  
    
      
preserve  
*= 增加Tobin's Q指标
   use "D:\DATA\CCER\2007_new\ccer_data_2007.dta", clear
   keep id year a16
   tsset id year
   merge id year using ccer_tobin_9408.dta
   drop _merge
   tsset id year
   order id year
   save ccer_tobin_1994_2008, replace
restore
    merge id year using ccer_tobin_1994_2008
    drop _merge  // 合并Tobin's Q指标 
    tsset id year


preserve      
    *= 增加 sigma 系数指标
    * 2006年以前的信息
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year  sigma
       tsset id year
   * 增加 2007-2008 资料 
       append using ccer_sigma_2007_2008.dta
       tsset id year
       save ccer_sigma_1990_2008, replace 
restore
    merge id year using ccer_sigma_1990_2008
    drop _merge   // 合并 sigma 指标
    tsset id year
  
  
preserve      
    *= 增加 rr (考虑分红的收益率)指标
    * 2006年以前的信息
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year rr
       tsset id year
   * 增加 2007-2008 资料 
       append using ccer_rr_2007_2008.dta
       tsset id year
       save ccer_rr_1990_2008, replace 
restore
    merge id year using ccer_rr_1990_2008
    drop _merge   // 合并 rr 指标
    tsset id year  


preserve  
    *= 增加最终控制人信息 2008年   
    * 1999 年资料
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year finalcontrol
       keep if year<2000
    * 2000-2007 资料
      append using "D:\DATA\CCER\2007_new\ccer_data_2007.dta",  ///
              keep(id year finalcontrol)
    * 2008 资料
      append using ccer_final_2008.dta  
      replace finalcontrol = 6 if final<0
      tsset id year
      save ccer_final_1999_2008, replace
restore
    merge id year using ccer_final_1999_2008
    drop _merge
    tsset id year  


preserve
    * ST/PT 信息  目前只保留了st信息，其他的资料需要的时候再整理吧
    * 2005以前
      use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
      keep id v370st-v379st
      keep if v370st!=""
     duplicates drop
     gen styear = real(substr(v370st,1,4))
     gen ptyear = real(substr(v375st,1,4))
     gen exyear = real(substr(v378st,1,4))     
     label var styear "ST时间"
     label var ptyear "PT时间"
     label var exyear "下市时间"
     keep id styear
     sort id 
     merge id using st_2004_2008.dta
     drop _merge
     duplicates drop
     sort id
     save ccer_stpt, replace
restore
    merge id using ccer_stpt
    drop _merge
    tsset id year
     
preserve
   * 现金分红信息，仅保留 e04 指标，其他的需要时可提取
   clear
   insheet using dividend_1992_2008.txt, clear
   label var	pubdate	"公告日期"
   label var	id		"股票代码"
   label var	e01		"登记日期"
   label var	e02		"除息日期"
   label var	e03		"支付日期"
   label var	e04		"每股现金分红"
   label var	e05		"币种"
   label var	e06		"分配年度"
   label var	e07		"是否含税"
   label var	e08		"分红类型"
   label var	e09		"备注"
   label define adiv_type 0 "年度分红" 1 "中报分红" 2 "季度分红" 9 "其它(如股改分红)"
   label value e08 adiv_type
   label define adiv_tax 0 "不含税" 1 "含税"
   label value e07 adiv_tax
   gen year = int(e03/10000)
   bysort id year: egen div_cash = total(e04)
   keep id year div_cash
   duplicates drop id year, force
   label var div_cash "每股现金分红_CCER"
   tsset id year
   save div_1992_2008, replace
restore
   merge id year using div_1992_2008
   drop _merge
   tsset id year


preserve   // 分红_2008_GTA
    insheet using GTA_Div_2008.csv, clear
     label var	stkcd	    "证券代码"
     label var	stknme     "证券简称"
     label var	finyear    "财政年度"
     label var	disye	     "分配期标识"
     label var	ppdadt     "预案公告日期"
     label var	ppcont     "预案内容"
     label var	schedu     "方案实施进度"
     label var	odate	     "股东大会召开日期"
     label var	pdadt	     "股东大会公告发布日期"
     label var	ammopub    "股东大会公告刊物"
     label var	ddadt	     "实施方案公告日期"
     label var	annopub    "分配方案公告刊物"
     label var	annocont   "实施方案内容"
     label var	perspt     "送股比"
     label var	pertran    "转增比"
     label var	btperdiv   "派息比税前"
     label var	atperdiv   "派息比税后"
     label var	numsptr    "送转数量"
     label var	numdiv     "派息数"
     label var	regdt	     "股权登记日"
     label var	lastchgdt  "最后交易日"
     label var	exdistdt   "除权除息日"
     label var	paydt	     "红股转增股上市日"
     label var	divdt	     "派息日"
     label var	trfojb     "分配对象"
     label var	price1     "股权登记日收盘价"
     label var	price2     "除权除息日收盘价"
   save GTA_DIV_2008, replace          // 以备后用
     use GTA_DIV_2008, clear
     local vv "ddadt btperdiv"
     keep stkcd `vv'
     drop if btp==.
     rename stkcd id
     gen year = real(substr(ddadt,1,4))
     bysort id year: egen div_cash_GTA = total(btperdiv)
     label var div_cash_GTA "每股现金分红_税前_GTA"     
     keep id year div_cash_GTA
     duplicates drop id year, force
     tsset id year
     save div_2008_GTA_temp, replace
restore
   merge id year using div_2008_GTA_temp
   drop _merge
   tsset id year
   
   
preserve
 * 增发
   * 变量标签
     use zengfa_vlist_temp.dta, clear
     mata
     a = st_sdata(. , .)
     b = a'
     b
     end
     * 贴入Excel文档进行处理
     insheet using zengfa_1998_2008.txt, clear
	label var	z01	"公告日期"
	label var	id	"股票代码"
	label var	z02	"增发公告日"
	label var	z03	"增发发行开始时间"
	label var	z04	"增发发行结束时间"
	label var	z05	"增发股权登记日"
	label var	z06	"增发新股上市日"
	label var	z07	"增发发行对象"
	label var	z08	"增发老股东是否有优先认购权"
	label var	z09	"增发新股发行方式"
	label var	z10	"增发控股股东态度"
	label var	z11	"增发预计募集资金总额"
	label var	z12	"增发实际募集资金总额"
	label var	z13	"增发发行费用合计"
	label var	z14	"增发发行价格"
	label var	z15	"增发发行前每股净资产"
	label var	z16	"增发发行后每股净资产"
	label var	z17	"增发预计发行股票数量"
	label var	z18	"增发实际发行股票数量"
	label var	z19	"增发主承销商"
	label var	z20	"增发主承销商承销股数"
	label var	z21	"增发主承销商承销比例"
	label var	z22	"增发承销方式"
	save zengfa_2008.dta, replace  // 以备后用
	keep z01 id z11 z12 z17 z18 
	gen year = int(z01/10000)
	local j = 1
	foreach v of varlist z11 z12 z17 z18{
	  replace `v'=0 if `v'==-95
	  bysort id year: egen zf0`j++' = total(`v') 
	}
	drop z01 z11 z12 z17 z18
	label var	zf01	"增发预计募集资金总额"
	label var	zf02	"增发实际募集资金总额"	
	label var	zf03	"增发预计发行股票数量"
	label var	zf04	"增发实际发行股票数量"  
	duplicates drop  
	gen zf_yes = 1
	label var zf_yes "1=增发,0=无增发"  
	tsset id year
	save zengfa_2008_simple, replace 
restore  
      merge id year using zengfa_2008_simple
      drop _merge
      replace zf_yes=0 if zf_yes==.
      tsset id year 
              
 
preserve
  * 配股
    * 变量标签
     use peigu_vlist_temp.dta, clear
     mata
     a = st_sdata(. , .)
     b = a'
     b
     end
     * 贴入Excel文档进行处理
     insheet using peigu_1993_2008.txt, clear     
     	label var	p01	"公告日期"
	label var	id	"股票代码"
	label var	p02	"配股公告日"
	label var	p03	"配股缴款开始时间"
	label var	p04	"配股缴款结束时间"
	label var	p05	"配股股权登记日"
	label var	p06	"配股除权日"
	label var	p07	"配股新股上市日"
	label var	p08	"配股预计发行股票数量"
	label var	p09	"配股实际发行股票数量"
	label var	p10	"配股控股股东态度"
	label var	p11	"配股预计募集资金总额"
	label var	p12	"配股实际募集资金总额"
	label var	p13	"配股发行费用合计"
	label var	p14	"配股实际每股发行费用"
	label var	p15	"配股发行前每股净资产"
	label var	p16	"配股发行后每股净资产"
	label var	p17	"配股发行价格"
	label var	p18	"配股主承销商"
	label var	p19	"配股主承销商承销股数"
	label var	p20	"配股主承销商承销比例"
	label var	p21	"配股承销方式"
     save peigu_2008.dta, replace  // 以备后用
	keep p01 id p08 p09 p11 p12 p13 p14
	gen year = int(p01/10000)
	duplicates drop id year, force
	gen pg_yes = 1
	label var pg_yes "1=配股,0=无配股"  
	tsset id year
	save peigu_2008_simple, replace 
restore 
      merge id year using peigu_2008_simple
      drop _merge
      replace pg_yes=0 if pg_yes==.
      tsset id year 
            
                                    
*= 增加公司上市时间和所在地信息
    merge id using ccer_province_2008.dta
    drop _merge
    tsset id year
    label var byear    "成立时间"
    label var pyear    "上市时间"
    label var province "所在省份"
      



*-增加变量标签

*== 负债表 ==

    label var  id			"证券代码"
    label var  year		"会计期间"
    label var  typrep		"报表类型"
    label var  a001101000	"货币资金"
    label var  a0d1101101	"其中:客户资金存款"
    label var  a0d1102000	"结算备付金"
    label var  a0d1102101	"其中:客户备付金"
    label var  a0b1103000	"现金及存放中央银行款项"
    label var  a0b1104000	"存放同业款项"
    label var  a0b1105000	"贵金属"
    label var  a0f1106000	"拆出资金净额"
    label var  a001107000	"交易性金融资产"
    label var  a0f1108000	"衍生金融资产"
    label var  a001109000	"短期投资净额"
    label var  a001110000	"应收票据净额"
    label var  a001111000	"应收账款净额"
    label var  a001112000	"预付款项净额"
    label var  a0i1113000	"应收保费净额"
    label var  a0i1114000	"应收分保账款净额"
    label var  a0i1115000	"应收代位追偿款净额"
    label var  a0i1116000	"应收分保合同准备金净额"
    label var  a0i1116101	"其中:应收分保未到期责任准备金净额"
    label var  a0i1116201	"其中:应收分保未决赔款准备金净额"
    label var  a0i1116301	"其中:应收分保寿险责任准备金净额"
    label var  a0i1116401	"其中:应收分保长期健康险责任准备金净额"
    label var  a001119000	"应收利息净额"
    label var  a001120000	"应收股利净额"
    label var  a001121000	"其他应收款净额"
    label var  a0f1122000	"买入返售金融资产净额"
    label var  a001123000	"存货净额"
    label var  a001124000	"一年内到期的非流动资产"
    label var  a0d1126000	"存出保证金"
    label var  a001125000	"其他流动资产"
    label var  a001100000	"流动资产合计"
    label var  a0i1224000	"保户质押贷款净额"
    label var  a0i1225000	"定期存款"
    label var  a0b1201000	"发放贷款及垫款净额"
    label var  a001202000	"可供出售金融资产净额"
    label var  a001203000	"持有至到期投资净额"
    label var  a001204000	"长期应收款净额"
    label var  a001205000	"长期股权投资净额"
    label var  a001206000	"长期债权投资净额"
    label var  a001207000	"长期投资净额"
    label var  a0i1209000	"存出资本保证金"
    label var  a0i1210000	"独立账户资产"
    label var  a001211000	"投资性房地产净额"
    label var  a001212000	"固定资产净额"
    label var  a001213000	"在建工程净额"
    label var  a001214000	"工程物资"
    label var  a001215000	"固定资产清理"
    label var  a001216000	"生产性生物资产净额"
    label var  a001217000	"油气资产净额"
    label var  a001218000	"无形资产净额"
    label var  a0d1218101	"其中:交易席位费"
    label var  a001219000	"开发支出"
    label var  a001220000	"商誉净额"
    label var  a001221000	"长期待摊费用"
    label var  a001222000	"递延所得税资产"
    label var  a001223000	"其他非流动资产"
    label var  a001200000	"非流动资产合计"
    label var  a0f1300000	"其他资产"
    label var  a001000000	"资产总计"
    label var  a002101000	"短期借款"
    label var  a0d2101101	"其中:质押借款"
    label var  a0b2102000	"向中央银行借款"
    label var  a0b2103000	"吸收存款及同业存放"
    label var  a0b2103101	"其中:同业及其他金融机构存放款项"
    label var  a0b2103201	"其中:吸收存款"
    label var  a0f2104000	"拆入资金"
    label var  a002105000	"交易性金融负债"
    label var  a0f2106000	"衍生金融负债"
    label var  a002107000	"应付票据"
    label var  a002108000	"应付账款"
    label var  a002109000	"预收款项"
    label var  a0f2110000	"卖出回购金融资产款"
    label var  a0i2111000	"应付手续费及佣金"
    label var  a002112000	"应付职工薪酬"
    label var  a002113000	"应交税费"
    label var  a002114000	"应付利息"
    label var  a002115000	"应付股利"
    label var  a0i2116000	"应付赔付款"
    label var  a0i2117000	"应付保单红利"
    label var  a0i2118000	"保户储金及投资款"
    label var  a0i2119000	"保险合同准备金"
    label var  a0i2119101	"其中:未到期责任准备金"
    label var  a0i2119201	"其中:未决赔款准备金"
    label var  a0i2119301	"其中:寿险责任准备金"
    label var  a0i2119401	"其中:长期健康险责任准备金"
    label var  a002120000	"其他应付款"
    label var  a0i2121000	"应付分保账款"
    label var  a0d2122000	"代理买卖证券款"
    label var  a0d2123000	"代理承销证券款"
    label var  a0i2124000	"预收保费"
    label var  a002125000	"一年内到期的非流动负债"
    label var  a002126000	"其他流动负债"
    label var  a002100000	"流动负债合计"
    label var  a002201000	"长期借款"
    label var  a0d2202000	"独立账户负债"
    label var  a002203000	"应付债券"
    label var  a002204000	"长期应付款"
    label var  a002205000	"专项应付款"
    label var  a002206000	"长期负债合计"
    label var  a002207000	"预计负债"
    label var  a002208000	"递延所得税负债"
    label var  a002209000	"其他非流动负债"
    label var  a002200000	"非流动负债合计"
    label var  a0f2300000	"其他负债"
    label var  a002000000	"负债合计"
    label var  a003102000	"资本公积"
    label var  a003102101	"其中:库存股"
    label var  a003103000	"盈余公积"
    label var  a0f3104000	"一般风险准备"
    label var  a003105000	"未分配利润"
    label var  a003106000	"外币报表折算差额"
    label var  a003107000	"未确认的投资损失"
    label var  a003100000	"归属于母公司所有者权益合计"
    label var  a003200000	"少数股东权益"
    label var  a003000000	"所有者权益合计"
    label var  a004000000	"负债与所有者权益总计"


*== 利润表 ==

    label var  b001100000	"营业总收入"
    label var  b001101000	"营业收入"
    label var  bbd1102000	"利息净收入"
    label var  bbd1102101	"利息收入"
    label var  bbd1102203	"利息支出"
    label var  b0i1103000	"已赚保费"
    label var  b0i1103101	"保险业务收入"
    label var  b0i1103111	"其中:分保费收入"
    label var  b0i1103203	"减:分出保费"
    label var  b0i1103303	"减:提取未到期责任准备金"
    label var  b0d1104000	"手续费及佣金净收入"
    label var  b0d1104101	"其中:代理买卖证券业务净收入"
    label var  b0d1104201	"其中:证券承销业务净收入"
    label var  b0d1104301	"其中:受托客户资产管理业务净收入"
    label var  b0d1104401	"手续费及佣金收入"
    label var  b0d1104501	"手续费及佣金支出"
    label var  b0f1105000	"其他业务收入"
    label var  b001200000	"营业总成本"
    label var  b001201000	"营业成本"
    label var  b0i1202000	"退保金"
    label var  b0i1203000	"赔付支出净额"
    label var  b0i1203101	"赔付支出"
    label var  b0i1203203	"减:摊回赔付支出"
    label var  b0i1204000	"提取保险责任准备金净额"
    label var  b0i1204101	"提取保险责任准备金"
    label var  b0i1204203	"减:摊回保险责任准备金"
    label var  b0i1205000	"保单红利支出"
    label var  b0i1206000	"分保费用"
    label var  b001207000	"营业税金及附加"
    label var  b0f1208000	"业务及管理费"
    label var  b0i1208103	"减:摊回分保费用"
    label var  b001209000	"销售费用"
    label var  b001210000	"管理费用"
    label var  b001211000	"财务费用"
    label var  b001212000	"资产减值损失"
    label var  b0f1213000	"其他业务成本"
    label var  b001301000	"公允价值变动收益"
    label var  b001302000	"投资收益
    label var  b001302101	"其中:对联营企业和合营企业的投资收益"
    label var  b001303000	"汇兑收益"
    label var  b001304000	"其他业务利润"
    label var  b001300000	"营业利润"
    label var  b001400000	"营业外收入"
    label var  b001500000	"营业外支出"
    label var  b001500101	"其中:非流动资产处置净损益"
    label var  b001000000	"利润总额"
    label var  b002100000	"所得税费用"
    label var  b002200000	"未确认的投资损失"
    label var  b002300000	"影响净利润的其他项目"
    label var  b002000000	"净利润"
    label var  b002000101	"归属于母公司所有者的净利润"
    label var  b002000201	"少数股东损益"
    label var  b003000000	"基本每股收益"
    label var  b004000000	"稀释每股收益"


* == 现金流量表(直接法) ==

    label var  c001001000	"销售商品、提供劳务收到的现金"
    label var  c0b1002000	"客户存款和同业存放款项净增加额"
    label var  c0b1003000	"向中央银行借款净增加额"
    label var  c0b1004000	"向其他金融机构拆入资金净增加额"
    label var  c0i1005000	"收到原保险合同保费取得的现金"
    label var  c0i1006000	"收到再保险业务现金净额"
    label var  c0i1007000	"保户储金及投资款净增加额"
    label var  c0d1008000	"处置交易性金融资产净增加额"
    label var  c0f1009000	"收取利息、手续费及佣金的现金"
    label var  c0d1010000	"拆入资金净增加额"
    label var  c0d1011000	"回购业务资金净增加额"
    label var  c001012000	"收到的税费返还"
    label var  c001013000	"收到的其他与经营活动有关的现金"
    label var  c001014000	"购买商品、接受劳务支付的现金"
    label var  c0b1015000	"客户贷款及垫款净增加额"
    label var  c0b1016000	"存放中央银行和同业款项净增加额"
    label var  c0i1017000	"支付原保险合同赔付款项的现金"
    label var  c0f1018000	"支付利息、手续费及佣金的现金"
    label var  c0i1019000	"支付保单红利的现金"
    label var  c001020000	"支付给职工以及为职工支付的现金"
    label var  c001021000	"支付的各项税费"
    label var  c001022000	"支付其他与经营活动有关的现金"
    label var  c001000000	"经营活动产生的现金流量净额"
    label var  c002001000	"收回投资收到的现金"
    label var  c002002000	"取得投资收益收到的现金"
    label var  c002003000	"处置固定资产、无形资产和其他长期资产收回的现金净额"
    label var  c002004000	"处置子公司及其他营业单位收到的现金净额"
    label var  c002005000	"收到的其他与投资活动有关的现金"
    label var  c002006000	"购建固定资产、无形资产和其他长期资产支付的现金"
    label var  c002007000	"投资支付的现金"
    label var  c0i2008000	"质押贷款净增加额"
    label var  c002009000	"取得子公司及其他营业单位支付的现金净额"
    label var  c002010000	"支付其他与投资活动有关的现金"
    label var  c002000000	"投资活动产生的现金流量净额"
    label var  c003008000	"吸收投资收到的现金"
    label var  c003001000	"吸收权益性投资收到的现金"
    label var  c003001101	"其中:子公司吸收少数股东投资收到的现金"
    label var  c003003000	"发行债券收到的现金"
    label var  c003002000	"取得借款收到的现金"
    label var  c003004000	"收到其他与筹资活动有关的现金"
    label var  c003005000	"偿还债务支付的现金"
    label var  c003006000	"分配股利、利润或偿付利息支付的现金"
    label var  c003006101	"其中:子公司支付给少数股东的股利、利润"
    label var  c003007000	"支付其他与筹资活动有关的现金"
    label var  c003000000	"筹资活动产生的现金流量净额"
    label var  c004000000	"汇率变动对现金及现金等价物的影响"
    label var  c007000000	"其他对现金的影响"
    label var  c005000000	"现金及现金等价物净增加额"
    label var  c005001000	"期初现金及现金等价物余额"
    label var  c006000000	"期末现金及现金等价物余额"


* == 现金流量表(间接法) ==

    label var  d000101000	"净利润"
    label var  d000117000	"未确认的投资损失"
    label var  d000102000	"资产减值准备"
    label var  d000103000	"固定资产折旧、油气资产折耗、生产性生物资产折旧"
    label var  d000104000	"无形资产摊销"
    label var  d000105000	"长期待摊费用摊销"
    label var  d000106000	"处置固定资产、无形资产和其他长期资产的损失(收益以减号填列）"
    label var  d000107000	"固定资产报废损失(收益以减号填列)"
    label var  d000108000	"公允价值变动损失(收益以减号填列)"
    label var  d000109000	"财务费用(收益以减号填列)"
    label var  d000110000	"投资损失(收益以减号填列)"
    label var  d000111000	"递延所得税资产减少(增加以减号填列)"
    label var  d000112000	"递延所得税负债增加(减少以减号填列)"
    label var  d000113000	"存货的减少(增加以减号填列)"
    label var  d000114000	"经营性应收项目的减少(增加以减号填列)"
    label var  d000115000	"经营性应付项目的增加(减少以减号填列)"
    label var  d000116000	"其他"
    label var  d000100000	"经营活动产生的现金流量净额"
    label var  d000201000	"债务转为资本"
    label var  d000202000	"一年内到期的可转换公司债券"
    label var  d000203000	"融资租赁固定资产"
    label var  d000204000	"现金的期末余额"
    label var  d000205000	"现金的期初余额"
    label var  d000206000	"现金等价物的期末余额"
    label var  d000207000	"现金等价物的期初余额"
    label var  d000200000	"现金及现金等价物净增加额"
   
     
             
*== 最终处理

    compress
    
  *= 处理缺漏值   
      mvdecode _all, mv(-95 -97 -99)  
       
    replace nshrn=tshr if nshrn==.  // 国泰安的nshrn比较准确，反映了股改
                                    // 但缺少1999年以前的资料，股采用CCER数据更新之
    drop totalshr tshr    
    rename province pp
    encode pp, gen(province) label(province_lab)
    drop pp
    
    * 分红数据  
    *  比对CCER和GTA数据后，发现仅有639/7727项不一致,故合并之
      replace div_cash = div_cash_GTA if div_cash==.
      drop div_cash_GTA
      gen div_yes = (div_cash!=.)
      label var div_yes "1=分配红利,0=否"
    
     label define final_lab 0 "国有" 1 "民营" 2 "外资" ///
           3 "集体" 4 "社会团体" 5 "职工持股会" 6 "其他"
     label value finalcontrol final_lab
     label value d21 final_lab  // d21与finalcontrol的定义相同
     
     label define y0501b_lab 1 "无关联" 2 "有关联" 3 "不确定"
     label value y0501b y0501b_lab
     
     replace y1001b=0 if y1001b==2
     label define y1001b_lab 1 "兼任" 0 "非兼任"
     label value y1001b y1001b_lab
     
     label define y1401b_lab 1 "准确披露" 2 "按区间披露" 3 "准确+区间" 4 "其它"
     label value y1401b y1401b_lab
     
     replace y1801b=0 if y1801b==2
     label define y1801b_lab 1 "一致" 0 "不一致" 2 "无法确定"
     label value y1801b y1801b_lab
     
     label drop heyi
     label define heyi_lab 1 "两职合一" 2 "副董事长,董事兼任总经"  3 "两职完全分离" 11 "其它"
     label value d07 heyi_lab
     
     * 行业代码
       * 2001行业分类指引
       gen sicmen_str = substr(nindcd,1,1)
       encode sicmen_str, gen(sicmen) label(sicmen_lab)
       gen sicda_str = substr(nindcd,1,3)
       encode sicda_str, gen(sicda) label(sicda_lab)
       label var sicmen_str "行业门类代码(文字)"
       label var sicmen     "行业门类代码"
       label var sicda_str  "行业大类代码(文字)"
       label var sicda      "行业大类代码"
       drop nindcd
       * 1999行业分类指引
         encode indnme, gen(sic99) label(sic99_lab)
         rename indnme sic99_str
         drop indcd
     
     
     drop if typrep == ""

     order  id year typrep stktype crcd sic* div* ///
            pyear byear styear province   /// 
            regcap  finalcontrol rr sigma ///
            ntshr ashr bshr hshr mv_total mv_atshr ///
            a* b* c* d* n* y*
     tsset id year
    
    
    save _GTA2008.dta, replace
    save D:\stata10\ado\personal\data\_GTA2008.dta, replace





