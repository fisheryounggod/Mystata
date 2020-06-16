**************************************************************
  **********************   时间序列模型  **********************
**************************************************************

*-* 一、定义时间序列 *-*

format t %td
tsteat t

tsset t, daily

tsset t, format(%td)

use mondays,clear
tsset date, daily delta(7)
/* 或者*/ 
tsset date, daily delta(7 days)

*-* 二、填充、拓展时间区间 *-*

tsappend,add(12)
tsappend, last(2001m1) tsfmt(tm)
tsfill

*-* 三、相关图 *-*

corrgram 
ac
pac

use  phillips,clear
corrgram D.inf, lags(15) 

use air2,clear
corrgram air,lags(20)
ac air,lags(20)
ac DS12.air,lags(20)
pac DS12.air,lags(20) srv

gen x1= invnorm(uniform())
gen x2= invnorm(uniform())
gen t = _n
tsset t
xcorr x1 x2, lags(20)

*-* 四、白噪声检验 *-*

use china,clear
wntestq consp  // Q统计量
wntestb consp // Bartlett

*------* 五、谱密度图 *--------*
pergram cons, generate(spec) 
cumsp cons, generate(cuspec) 

*------* 六、ARIMA模型 *--------*

arima lngdp, arima(2,1,0)
// 或者
arima D.lngdp, ar(1/2)
// 预测
tsappend, add(4)
predict lny_f 

*------* SARIMA *--------*
use air2,clear
arima lnrcons, arima(0,1,1) sarima(0,1,1,12)

*------* 七、ARCH 族模型 *--------*

arch D.lngdp, arch(1/1) garch(1/2)
predict ln_yt, y
predictnl yf=exp(xb())

*------* 单位根检验 *--------*

dfuller rgdp, lags(5) trend regress //ADF
pperron rgdp, lags(5) trend regress // PP
dfgls cons, maxlag(8)        // DF_GLS 


*------* VAR 模型 *--------*
// AR模型的多元扩展，用以反映一个系统中多个变量之间的动态影响。格兰杰因果检验、脉冲响应、方差分解都是VAR模型中重要的分析工具。

use lutkepohl2,clear

// （1）估计VAR模型
var dln_inv dln_inc dln_consump
est store VAR1
// (2)根据信息准则确定VAR模型的最优滞后阶数，并根据结果重新估计。
varsoc dln_inc dln_consump, maxlag(4)
var dl*,lags(1/2)
estimate store VAR2
// （3）考察VAR模型的平稳性
varstable, estimates(VAR2) graph dlabel
// （4）检验VAR模型残差的正态分布特征和自相关特征
varnorm, jbera estimates(VAR2)
// （5）对收入、投资、消费进行Granger因果检验
vargranger,estimates(VAR2)
// （6）绘制消费对收入的正脉冲响应图，以及收入的预测误差方差分解
irf create results1, order(dln_inc dln_inv dln_consump)
irf graph oirf, impulse(dln_inc) response(dln_consump)
irf graph fevd, impulse(dln_inc) response(dln_consump dln_inv) lstep(2) 
// （7）比较两种不同的排序下Cholesky 分解的正交脉冲响应图
var dln_inv dln_inc dln_consump if qtr<=tq(1978q4), lags(1/2) dfk
irf create order1, step(10) set(myirf1,replace)
irf create oeder2, step(10) order(dln_inc, dln_inv dln_consump)
irf ograph (order1 dln_inc dln_consump oirf) (order2 dln_inc dln_consump oirf)
// （8）比较收入变量的方差分解和正交分解表
irf table sfevd fevf, impulse(dln_inc) noci std
webuse lutkepoh12
var dln_inv dln_inc dln_consump
irf set results4
irf create ordera, step(8)
irf create orderb, order(dln_inv dln_inc dln_consump) step(8)
irf ctable (ordera dln_inc dln_consump oirf fevd) (orderb dln_inc dln_consump oirf fevd), noci stderror
// （9）根据VAR 模型的估计结果进行预测
fcast compute f_,step(8)
fcast compute f_, estimates(var1) step(8) synamic(tq(1978q1))

// SVAR 结构向量自回归
matrix A=(1,0,0\.,1,0\.,.,1)
matrix B=(.,0,0\0,.,0\0,0,.)
svar dln_inv dln_inc dln_consump if qtr<=tq(1978q4), aeq(A) beq(B)

// Johansen 协整检验
use balance2,clear
vecrank y i c, lags(5) ic levela

// VEC  向量误差修正模型：VAR+协整关系
use lutkepohl2,clear
vec inc consump, alpha 
**其余步骤和VAR相同

// 练习:balance2
	// 对消费投资收入进行如下分析：
	// 对收入建立恰当的ARIMA模型
	// 对消费投资收入的增长率建立恰当的VAR模型
	// 检验消费投资收入是否存在协整关系
	// 如果存在协整关系，建立VEC模型
use balance2,clear

tsset t
dfuller y, lags(5) trend regress //ADF
dfuller i, lags(5) trend regress //ADF
dfuller c, lags(5) trend regress //ADF

arima y, ar(1/2)
vecrank y i c, lags(5) ic levela
vec y i c, alpha 

// 	对我国上证指数建立恰当的ARCH模型 szzs
use szzs,clear
gen date=_n
tsset da
gen lnpsh=log(psh)
arch D.lnpsh, arch(1/1) garch(1/2)





