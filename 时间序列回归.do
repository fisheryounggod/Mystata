//十 三 、时 间 序列 回 归：

//回归元严格外生时 AR(1) 序列相关的检验

reg y x1 x2

predict u,resid

gen u_1=u[_n-1]

reg u u_1,noconstant

//回归之后， u_1 的序数如果不异于零，则该序列不相关


//用 Durbin-Watson Statistics 检验序列相关：

tsset year @ //对时间序列回归中代表时间的变量进行定义 @

reg y x1 x2

dwstat @ //求出时间序列回归的 DW 值 @

durbina @ //对该回归是否具有序列相关进行检验， H0 为无序列相关，可根据 chi2 值求出 P 值 @

durbina,small @ // small 可以根据 F 值求出 P 值，以代替 chi2 值 @

durbina,force @ //让检验能在 robust 、 neway 之后进行 @

durbina,small lag(1/10) @ // lag 可以求出更高阶滞后的序列相关，如本例中可求出 1 到10 阶的序列相关

@

durbina,robust lag(1/10) @ // robust 可进行异方差 — 稳健性回归，避免未知形式的异方差 @

bgodfrey @ //利用 Breusch-Godfrey test 求出高阶序列相关 @

bgodfrey,small lag(1/10)









