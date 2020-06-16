
// 模型检验和修正 


// 做图
// 1.解释变量对成分残差图
cprplot 
acprplot 
// 2. 增加变量图：数据异常值检测
avplot
avplots
// 3. 杠杆率（映射矩阵的对角元素）对残差平方的散点图
lvr2rplot
// 4. 拟合值对残差图的散点图：考察经典假设
rvfplot
// 5. 解释变量对残差图的散点图
rvpplot

//预测
predict lny_f,xb //lny 的线性预测拟合值
predict luy_pse, stdp //lny的预测标准差。考虑估计量的不确定性
predict luy_fse, stdf //lny的预测标准差。考虑估计量和误差项的不确定性
predictnl y_f=exp(xb()), se(y_fse) ci(y_f1 y_fu) //y的预测和95%置信区间
//计算lnk lnl 均取各自均值时，lny 和y 的预测值、标准差、置信区间
adjust lnk lnl, se ci
adjust lnk lnl, stdf ci
adjust lnk lnl, exp ci

//计算lnk lnl 均取定值时，lny 和y 的预测值、标准差、置信区间

adjust lnk=10 lnl=8, se ci level(99)
adjust lnk=10 lnl=8, stdf ci level(99)
adjust lnk=10 lnl=8, exp ci level(99)

//计算lnk=10， lnl取各自观测值值时，lny 和y 的预测值、标准差、置信区间

adjust lnk=10, se ci level(99)
adjust lnk=10, stdf ci level(99)
adjust lnk=10, exp ci level(99)


// 非线性最小二乘
use usmacro,clear
nl (realcons={alpja}+{beta}*realgdp^{gamma=1}), nolog

// 广义最小二乘
	// 加权最小二乘：解决异方差 vwls
	// 广义差分法：解决自相关 prais
******************加权最小二乘：解决异方差************************
use heter,clear
quietly reg y x
predict u,resid
predict yf,xb
gen lnu2=ln(u^2)
gen yf2=yf^2
quietly regress lnu2 yf yf2 
predictnl u2f = exp(xb())
gen sd=sqrt(u2f)


vwls y x, sd(sd) //利用vwls 进行加权估计
// or 通过regress 的weight 选项实现，结果相同
gen invvar=1/u2f
reg y x [iweight=invvar]

********************广义差分法：解决自相关***********************

use cnmacro,clear
prais rgdp rinvest, rhotype(regress)
//高阶自相关，分三步修正
	// 估计自相关系数
	// 计算广义差分变量
	// 利用广义差分变量进行ols回归
use phillips,clear
quietly regress D.inf unem
predict res, resid
quietly regress res L(2).res, noconstant
matrix mat=e(b)
gen y=D.inf -el(mat,1,1)*L2D.inf
gen x=D.unem-el(mat,1,1)*L2D.unem
regress y x


// 工具变量法：解决内生性问题(解释变量和 残差项相关)
// 工具变量条件：相关 & 正交(非内生)
use mroz,clear
ivregress 2sls lwage exper expersq (educ=fatheduc motheduc), first //二阶段回归
quietly ivreg lwage exper expersq (educ=fatheduc motheduc)
est store IV_reg
quietly regress lwage exper expersq educ
est store LS_reg
hausman IV_reg LS_reg // huasman 检验内生性
estat overid //过度识别约束检验



//带有参数约束的模型估计
use zellner,clear
constraint define 1 lnk+lnl=1 //约束规模报酬不变
cnsreg lny lnk lnl, constraints(1)

use zellner,clear
constraint define 2 lnk lnl //约束lnk=lnl=0
cnsreg lny lnk lnl, constraints(2)


//分步回归:在诸多变量中搜索最重要变量的方法
use wage1,clear
stepwise, pe(.2):lwage educ-west //显著性水平的门限0.2

// 二项选择模型

use mroz,clear
probit inlf nwifeinc educ exper expersq age kidslt6 kidsge6,nolog //估计 probit 模型
dprobit inlf nwifeinc educ exper expersq age kidslt6 kidsge6 //输出边际影响系数
matrix mfxat =J(1,8,0)
dprobit inlf nwifeinc educ exper expersq age kidslt6 kidsge6,at(mfxat)
estat class //计算准确率和拟合优度
estat roc
estat lsen
predict prob, pr //样本内预测
adjust,pr generate(prmean) //均值点预测
mfx

// 受限因变量模型
use mroz,clear
truncreg hours educ exper expersq age kidslt6 kidsge6, ll(0) nolog // 截断（有区间没有观测值）模型
tobit educ exper expersq age kidslt6 kidsge6,ll(0) //Tobit 模型属于归并模型，等价于Probit+截断
use recid,clear
cnreg durat black drugs educ age tserved,censored(cens) //归并模型
