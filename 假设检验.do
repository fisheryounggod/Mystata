// Easta
/*

1. DFBETA 影响统计量
dfbeta
2. Breusch_Pagan，Cook_Weidberg 异方差检验
estat
3. Ramsey 回归设定误差检验
estat ovtest
4. szroeter 异方差检验
estat szroeter
5. 多重共线性方差膨胀因子检验
estat vif
6. 信息矩阵检验
estat imtest
7. ARCH 检验
estat arch1m 
8. DW 一阶自相关检验
estat dwatson
9. DW 检验替代
estat durbinalt
10. Breusch_Godfrey 自相关检验
eatat bgodfrey
*/

/*7. 假设检验*/

// 7.1 参数检验
	// 7.1.1 单个总体均值的检验
// 1. 正态分布、方差已知

use iron,clear
quietly summ iron //得到统计量
scalar z=(r(mean)-4.45)/r(sd) //计算z统计量
scalar crit=invnormal(1-0.05/2) // 计算临界值
scalar p=(1-normal(abs(z)))/2 //计算p值
scalar list z crit p

// 2. 正态分布、方差未知
use temperature,clear
ttest temp=1277,level(95)

// 3. 分布未知、方差未知(大样本性质)
clear
set obs 400
scalar z=(11.9-12.3)/7.2 //计算z统计量
scalar crit=invnormal(0.05) // 计算临界值
scalar p=(1-normal(abs(z))) //计算p值
scalar list z crit p

	// 7.1.2 两个总体差异的检验	
	
// 正态分布、方差未知(t)

use exhaustgas,clear
ttest exhaust, by(year) welch

	// 7.1.3 总体方差的检验
sdtest
	// 7.1.2 总体比率的检验
prtest
robvar
// 7.2 参数检验
	// 7.2.1 拟合优度的检验
chitest 

// 因子分析
use tjrh,clear
factor x1-x5, factor(1) pcf
predict ci_lead, regression
factor y1-y5, factor(1) pcf
predict ci_coin,regression
tsline ci_lead ci_coin

// 单方程模型：


**********************CD生产函数********************************

use zellner,clear
drop lny lnk lnl
gen lny=ln(valueadd/nfirm)
gen lnk=ln(capital/nfirm)
gen lnl=ln(labor/nfirm)

regress lny lnk lnl
test lnk lnl //检验联合显著性
test lnk+lnl=1 //检验规模报酬不变性
// estat imtest ,white  // 异方差（怀特）检验
estat hettest ,rhs     // 异方差检验

********************Philips曲线：delta f_t=b0+b1*unem+u_t**********************

use phillips,clear
reg D.inf unem
/*
estat dwatson // DW 检验
*/
estat bgodfrey, lags(1/4) // BG检验
