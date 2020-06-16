/*5.模型估计*/

// 5.1 概览
	// 描述统计与假设检验：anova manova mean proportion tatio total treatreg rocfit
	// 多元统计分析:
	// 单方程线性回归
	// 非线性回归模型
	// 系统方程
	// 时间序列:			arima arch varbasic var svar vec vecrank
	// 离散选择模型:     probit logit 
	// 计数
	// 归并、截断模型
	// 面板数据
	// 广义线性模型:    binreg glm
	// 蒙特卡罗模拟:    monte boostrap jackknife
	// 海克曼选择模型
	// 调查数据分析：   svy
	// 生存模型
	// 其他估计模型：   bsqreg cnsreg intreg iqreg _qreg qreg
	
// 5.2 语法:
			command varlist [if] [in] [weight] [,options]
			
// 			估计选项：
					noconstant:没有常数项
					hascons：自己设定
					offset(varname):约束模型中var 系数为1
					exposure(varname): 约束模型中ln(var) 的系数为1
					constraints:参数约束
					level: 置信度
					。。。
					
// 5.3 模型预测
	// 线性预测： predict
	// 	非线性预测：predictnl
	// 调整的预测：adjust
// 5.4 模型的统计指标
estat ic //信息准则
estat summarize //统计描述指标

// 5.5 参数检验
test coeflist //线性Wald检验
testnl        //非线性线性Wald 检验
lincom exp //只能检验一个线性组合
nlcom [name:] exp [name:] exp //非线性组合
lrtest modelspec1 modelspec2 //LR检验
hausman name-consistent //豪斯曼检验

// 5.6 虚拟变量的处理
xi: i.var
// 5.7 边际弹性
mfx 











