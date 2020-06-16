use auto,clear

summary  //统计概览:bird’s eye view
codebook make price // in-depth description 

tabstat pri wei len, stat(mean sd n max p50 ) //统计量列表
pwcorr pri rep weight length //相关系数矩阵
pwcorr pri mpg weight length,sig star(0.05) //求相关矩阵，并做 t 检验

regress price mpg weight length //OLS回归　

// 结果输出
sysuse auto, clear 
logout, save(test2) excel replace: /// 
	pwcorr price mpg weight length, sig star(0.05)
	
// 	不同回归方程结果对比
sysuse auto, clear 
regress price mpg 
est store m1 // 将第一次回归储存为 m1 
regress price mpg weight length 
est store m2 // 将第二次回归储存为 m2 
esttab m1 m2 using reg1.rtf, r2 ar2 se replace nogap


// 统计制图
graph matrix price length weight mpg // 画出 price length weight mpg 变量的矩阵图

scatter price weight || lfit price weight // 画出 price, weight 变量的散点图并拟合直线
