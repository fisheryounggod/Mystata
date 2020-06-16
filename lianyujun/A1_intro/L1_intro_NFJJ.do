


* 《上市公司资本结构动态调整机制研究》一文的模型初始值估计程序，
* 《南方经济》修改稿 2006.09.12
*  参见 dycs_NFJJ_1_temp  以前的结果，这里做了进一步的处理

*-note-*
*  该程序是在dycs_dealdata.do基础上的修改，将公司数目小于10家的行业门类进行了合并
*  Then [dycs060104.ado] will be used to estimate the nonlinear model            


clear
set memory 30m
set matsize 3000
cd D:\stata9\ado\personal\dycs\NFJJ
adopath +  D:\stata9\ado\personal\dycs
cap log close
log using dycs_NFJJ_dealdata,replace text
use "D:\stata9\ado\personal\dycs\NFJJ\dy_database.dta",clear


*============================ Part 1 ：样本初步筛选 ===================================

* 1.1 选择本研究中将要使用的指标
#delimit ;
keep code  name   year           sic_men   
     pyear byear  bothab         st_b  st_o     
     merge_basic  merge_mkv      merge_share
     stock        depreciate     
     debt_total   flowd_total    longd_total
     flowa_total  asset_total    fixa_total
     right_total  main_income    netprof
     fullshr      trdshr         ntrdshr   
     stateshr     stateownshr    statelpshr
     avyopr       avybpr         avypr_all
     avy_fmkv     avy_tmkv  
     main_income salecost busicost mangcost;
order code name year flowa fixa flowd asset debt 
      right main  net stock dep 
      *shr avy*      
      sic pyear both st* merge*      ;
#delimit cr
tsset code year


* 1.2 保留仅发行A股的公司、ST-PT 类公司、金融类公司
drop if bothab==1
drop if st_b != .
drop if sic_men == 9   /* 对应行业门类代码为 J */


** calculate HHI Index  衡量行业竞争程度
* method 1
preserve
keep if year > 1997
forvalues t = 1998(1)2003{
    egen sic_ssum_`t' = sum(main_income) , by(sic_men) 
    replace sic_ssum_`t' = 0 if year != `t'
    egen hhi_`t' = sum((main_income/sic_ssum_`t')^2) , by(sic_men)
    replace hhi_`t' = 0 if year != `t'
}
keep code year sic_men sic_ss* hhi*
gen hhiyr = hhi_1998 + hhi_1999 + hhi_2000 + hhi_2001 + hhi_2002 + hhi_2003
keep sic_men year hhiyr
duplicates drop 
egen hhi = mean(hhiyr) , by(sic_men)
keep sic_men hhi 
duplicates drop 
rename hhi hhi_yr
sort sic_men
save hhi_yr_temp.dta, replace
//mkmat sic_men hhi , matrix(HHI_yr)
//mat list HHI_yr
restore


preserve
*method 2
keep if year > 1997
egen sic_ssum = sum(main_income), by(sic_men)
egen hhi = sum((main_income/sic_ssum)^2), by(sic_men)
keep sic_men hhi 
duplicates drop 
rename hhi hhi_all
sort sic_men
save hhi_all_temp, replace
//mkmat sic_men hhi , matrix(HHI_all)
//mat list HHI_all
restore


* 1.3 仅保留1998年1月1日以前上市的公司
keep if pyear<1998        /* pyear 表示上市时间 */
drop if year<1998


*============================ Part 2 ：指标定义和进一步筛选 ===================================
* 2.1 计算财务比率
tsset code year 
gen tl     = debt_total/asset_total      /*total leverage*/
gen tl_lag = L.tl
gen sl     = flowd_total/asset_total      /*short-run leverage*/
gen ll     = longd_total/asset_total      /*long-run leverage*/
gen fr     = flowa_total/flowd_total     /*current ratio*/
gen size   = ln(asset_total)        
gen ndts   = depreciate/asset_total
gen tang   = (fixa+stock)/asset_total
gen npr    = netprof/main_income       /*净利润率*/ 
gen tshr   = trdshr/fullshr
gen sshr   = stateownshr/fullshr
gen tagr   = D.asset_total / L.asset_total

* 计算Tobin's Q
gen napshr = right_total/fullshr     /*每股净资产*/
gen shrmkv = avyopr*trdshr + napshr*ntrdshr
gen mkv    = shrmkv + debt_total
gen mkv2   = avy_tmkv+ debt_total
gen tobin  = mkv/asset_total
gen tobin2 = mkv2/asset_total
gen mtl    = debt_total/mkv                /*市场负债率*/
gen mtl_lag= L.mtl

gen slr = sl/tl               
gen llr = ll/tl

* 2.2 剔除奇异值
drop if tagr > 1 & tagr != .
drop if (tl>1 | tl<=0) | (napshr<0) | (abs(npr)>1)
local varlist tl sl ll  fr size ndts tang npr tshr tobin
foreach var of varlist `varlist'{
   drop if `var' == .
}


* 2.3 处理为平行面板数据
xtbalance , range(1998 2003)   /* Written by Arlion */

* 2.4 定义 age，序别化变量
_pctile byear , n(3)
gen age = byear > r(r2)
replace age = 3 if byear <= r(r1)
replace age = 2 if age == 0

* 2.5 给新变量加标签
label var  tl      "账面总负债率"
label var  sl      "短期负债率"
label var  tl      "长期负债率"
label var  mtl     "市场总负债率"
label var  fr      "流动比率"
label var  size    "公司规模" 
label var  ndts    "非负债类税盾"
label var  tang    "资产结构"
label var  npr     "净利润率"
label var  tshr    "流通股比例"
label var  sshr    "国家控股比例"
label var  age     "公司成熟度, 1 young 2 med 3 old"
label var  napshr  "每股净资产"
label var  shrmkv  "股票市场价值"
label var  mkv     "公司市场价值"
label var  tobin   "Tobin's Q 表示公司成长性"
label var  slr     短期负债占总负债的比例
label var  llr     长期负债占总负债的比例

* 2.6 产生年度虚拟变量
 forvalues i = 1999(1)2003{
       gen y`i' = 0
       replace y`i' = 1 if year == `i'
 }


* 2.7 产生行业虚拟变量，按行业门类，以综合类为基准
tab sic_men if year == 2003       /*表 2 中的部分内容*/

* 2.7.1 方法1：合并公司数目少于 10 家的行业门类
* step1：合并公司数目小于10家的行业到相应的行业中，A B L E
* C+B;  J+E;  M+A; D+L; 其余不变：G; F;  H;  D;  最终剩余8个行业门类
gen sicmen = sic_men
replace sic_men = 3  if (sic_men==3 | sic_men==2)    /*C+B*/
replace sic_men = 10 if (sic_men==5 | sic_men==10)   /*E+J*/
replace sic_men = 11 if (sic_men==11| sic_men==12)   /*K+L*/
replace sic_men = 13 if (sic_men==13| sic_men==1)    /*A+M*/

qui tab sic_men , gen(sic)
drop sic8

label define sic_mm_lab                  ///
  3  "制采" 4  "能源" 6  "交运" 7  "信息" ///
  8  "批零" 10 "建房" 11 "社服" 13 "农综"   
label value  sic_men sic_mm_lab


/*
* 2.7.2 方法2：仅保留 C D F G H J M 七个行业门类
* 采用这种方法需要调用 dycs_NFJJ_7sic.ado
keep if sic_men == 3 | sic_men== 4 | sic_men== 6  | ///
        sic_men == 7 | sic_men== 8 | sic_men== 10 | sic_men==13
qui tab sic_men , gen(sic)
drop sic7
*/

 
* 2.8 重新排列变量的顺序
#delimit ;
order code name year tl sl ll tl_lag mtl mtl_lag fr size ndts tang npr 
      tshr sshr age tobin y1* y2* sic* 
      main_income salecost mangcost  
      flowa fixa flowd asset debt right main  net stock dep 
      *shr avy* sic_men pyear both st* merge*      ;
keep code name year tl sl ll tl_lag mtl mtl_lag fr size ndts tang npr 
      tshr sshr age tobin y1* y2* sic* 
      main_income salecost mangcost  
      flowa fixa flowd asset debt right main  net stock dep 
      *shr avy* sic_men pyear both st* merge*      ;
#delimit cr


* 2.9 基本统计量 (表 1)
 tabstat  tl fr-tobin,stat(mean sd min max) columns(s) format(%4.2f)
* 分行业统计主要指标
 tabstat tl sl size tang fr npr, sta(mean) by(sic_men) 
 //tabstat tl sl size tang fr npr, sta(mean) by(sic_mm)



*============================ Part 3 ：估计静态模型并获得初始值 ===================================

* 3.1 估计静态模型作为对比
qui xtreg tl fr-tshr age tobin y1999-y2003 sic1-sic7, re
est store m_static


//xtreg tl tl_lag fr-tshr age tobin y1999-y2003 sic3-sic11,re
//xtabond tl tl_lag fr-tshr age tobin y1999-y2003 sic3-sic11,lags(2) 

* 3.2 产生初始值
local tl "tl"
qui reg `tl' fr-tshr age tobin y2000-y2003 sic1-sic7        /*step1:regress static model */
est store m0_static
    predict tl_hat                        /*to generate optimal leverage level*/
    gen diff_star=tl_hat-tl_lag
    gen diff_lag=`tl'-tl_lag
    generate distance=abs(tl_hat-tl_lag)  /*to generate the distance variable*/
    gen alpha=diff_lag/diff_star          /*to get the coeficients of eq1,i.e. the value of alphas*/
qui reg alpha tobin distance size  y2000-y2003 sic1-sic7
est store alpha
est table m0_static alpha, stats(r2 r2_a N dr_m) b(%6.4f) star(0.01 0.05 0.1)
est table m0_static alpha

*  该步完成后运行 dycs_060103.ado, 估计非线性模型。
** 此步得到的初始值应作为参数写入dycs_060103.ado非线性估计程序中，需要手动操作


*============================ Part 4 ：估计准静态模型 (肖作平,2004) ==============================
cap drop tl_star_xiao
gen tl_star_xiao = 0 
cap program drop _all
cd D:\stata9\ado\personal\dycs
drop if tl_lag==.
run dycs_xiao04.ado
nl dycs_xiao04 tl
est store m_xiao04
global rss_xiao = e(rss)



*============================ Part 5 ：估计动态模型 (本文) ==============================
* 5.1 产生两个代理变量用于非线性估计
cap drop alpha  
gen tl_star = 0
gen alpha = 0

* 5.2 估计非线性模型
drop if tl_lag==.
cap program drop _all
//run dycs_060103.ado
//nl  dycs_060103 tl

run dycs_NFJJ_final.ado
nl dycs_NFJJ_final tl
est store m_dynamic
global rss_dycs = e(rss)
      
predict res, res


*============================ Part 6 ：输出结果 ==============================
 
* 6.2 假设检验

* 6.2.1 正态分布假设检验 
//sum res, d
//sktest res                  /* Skewness and kurtosis test for normality */
* 该结果是在文章中汇报的结果
tabstat res if year == 2003, stat(mean sd min p25 med p75 max sk k) format(%6.4f)
sktest  res if year == 2003
*swilk  res                 /* Shapiro-Wilk and Shapiro-Francia tests for normality */

* 6.2.2 一阶序列相关检验
qui tsset code year
xtserial res                /*Woodridge test for first-order serial correlation of Panel data*/

* 6.2.3 检验调整系数是否为常数  参见Greene(2000,pp.439, Eq(10-29))
local n   = _N
local n_K = `n' - 35
local F   = (($rss_xiao - $rss_dycs)/14) / ($rss_dycs/`n_K')
dis "F(14,`n_K') = " in y `F'



* 6.3  统计回归结果
* 静态模型
est tab m_static, stats(r2_o r2_w r2_b chi2) b(%6.4f) star(0.01 0.05 0.1)
est tab m_static, b(%6.4f) se(%6.4f)
* 准动态模型（肖作平，2004）
//est tab m_xiao04, stats(r2 r2_a F) b(%6.4f) star(0.01 0.05 0.1)
//est tab m_xiao04, b(%6.4f) se(%6.4f)
* 动态模型（本文）
//est tab m_dynamic, stats(r2 r2_a F) b(%6.4f) star(0.01 0.05 0.1)
//est tab m_dynamic, b(%6.4f) se(%6.4f)
* 合并xiao04和动态型输出结果
est tab m_xiao04 m_dynamic, stats(r2 r2_a F) b(%6.4f) star(0.01 0.05 0.1)
est tab m_xiao04 m_dynamic, b(%6.4f) se(%6.4f)

* 6.4 统计调整速度和最优比率
count if tl_star<0
count if tl_star>1
replace tl_star = 0.01 if tl_star<0
replace tl_star = 0.99 if tl_star>1
count if alpha<0
count if alpha>1

gen opratio =  tl_star/tl

* 将公司按规模分成5类，产生变量 size_id 用以标示
centile size, centile(20(20)100)
gen size_id = 0
replace size_id = 1 if size<=r(c_1)
replace size_id = 2 if size>r(c_1)&size<=r(c_2)
replace size_id = 3 if size>r(c_2)&size<=r(c_3)
replace size_id = 4 if size>r(c_3)&size<=r(c_4)
replace size_id = 5 if size>r(c_4)&size<=r(c_5)

tabstat alpha opratio, stat(mean med) format(%6.3f) by(year)
tabstat alpha opratio, stat(mean med) format(%6.3f) by(sic_men)
tabstat alpha opratio, stat(mean med) format(%6.3f) by(size_id)


* 6.5 从债务期限结构和竞争强度角度解释调整速度的行业差异
* 估算样本内行业竞争强度
preserve
*method 3
egen sic_ssum = sum(main_income), by(sic_men)
egen hhi = sum((main_income/sic_ssum)^2), by(sic_men)
keep sic_men hhi 
duplicates drop 
rename hhi hhi_samp
sort sic_men
save hhi_samp_temp, replace
//mkmat sic_men hhi , matrix(HHI_samp)
//mat list HHI_samp
restore

//mat list HHI_all 
//mat list HHI_yr
//mat list HHI_samp

cd D:\stata9\ado\personal\dycs\NFJJ
sort sic_men
merge sic_men using hhi_yr_temp.dta
drop _merge*
sort sic_men
merge sic_men using hhi_all_temp.dta
drop _merge*
sort sic_men
merge sic_men using hhi_samp_temp.dta
drop _merge*
drop if tl == .

* 统计分析

tabstat tl  sl ll npr hhi_all hhi_yr, stat(mean) by(sic_men) format(%6.3f)
tabstat alpha opratio tl llr tang npr hhi_all hhi_yr hhi_samp, stat(mean) by(sic_men) format(%6.3f)


* 6.6 行业、规模和年度差异检验

*  K-W test by   sic_men and size  [see help kwallis]
local rvars  alpha opratio
local gvars sic_men size_id 
foreach Rvar of local rvars{
  foreach Gvar of local gvars{
        mat kw_men = J(4,5,0)
      forvalues i=1999(1)2003{
        qui kwallis `Rvar' if year == `i',by(`Gvar')
        local df = r(df)
        local chi2 = r(chi2)
        local pvalue = chi2tail(`df',`chi2')
             mat kw_men[1,`i'-1998] = `i'
             mat kw_men[2,`i'-1998] = r(chi2)
             mat kw_men[3,`i'-1998] = r(df)      
             mat kw_men[4,`i'-1998] = `pvalue'
      }
  dis _n in g "The K-W test for " in y "`Rvar'" in g " by " in w "`Gvar':" 
  mat list kw_men
  }
}

* K-W test by year
kwallis alpha , by(year)

*============================= Over ==================================

