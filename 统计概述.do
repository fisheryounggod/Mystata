cd /Users/mac/Documents/Stata/wang

use hdi,clear
sum,detail
tabstat GDP, by(LMH_income) statistics(mean median sd skewness kurtosis) format(%11.2f)

use wmean,clear
tabstat price [fweight=quant],stats(mean)

use case3_4,clear
ameans r //三个均值

tabulate LMH_income, plot //单个变量汇总:missing(缺失值单列)、plot(图示)
tabulate LMH_income LMH_hdi,chi2 //列连表

tabu LMH_inco LMH_h, summ(GDP) obs //列连表统计量

cumul GDPPER, generate(cdf_gdp)
scatter cdf_gdp GDP
stem GDP, prune digits(4) //茎叶图：竖直的直方图
graph box GDP
symplot GDP // 对称特征考察
quantile GDP //均匀分布考察
qnorm GDP // 正态分布考察--分位数
pnorm GDP // 正态分布考察--分布函数
qchi GDP

lnskew0 income2=income //无偏转换：log、BOX-Cox、幂转换
qnorm income2 //检验转换结果
