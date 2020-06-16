
* ******************************画图** ******************************

sysuse auto,clear
//采用 auto 数据库

//茎叶图：

stem price,line(2) //做 x1 的茎叶图，每一个十分位的树茎都被拆分成两段来显示，前半段为 0 ～ 4 ，后半段

为 5 ～ 9 

stem mpg,width(2) //做 x1 的茎叶图，每一个十分位的树茎都被拆分成五段来显示，每个小树茎的组距为 2 

stem price,round(100) //将 x1 除以 100 后再做 x1 的茎叶图

//直方图


histogram mpg, discrete frequency normal xlabel(1(1)5)

// discrete 表示变量不连续， frequency 表示显示频数， normal 加入正太分布曲线， xlabel 设定 x 轴， 1 和

5 为极端值， (1) 为单位

histogram price, fraction norm

// fraction 表示 y 轴显示小数，除了 frequency 和 fraction 这两个选择之外，该命令可替换为 “percent” 百分

比，和 “density” 密度；未加上 discrete 就表示将 price 当作连续变量来绘图

histogram price, percent by(foreign)

//按照变量 “foreign” 的分类，将不同类样本的 “price” 绘制出来，两个图分左右排布

histogram mpg, discrete by(foreign, col(1))

//按照变量 “foreign” 的分类，将不同类样本的 “mpg” 绘制出来，两个图分上下排布

histogram mpg, discrete percent by(foreign, total) norm

//按照变量 “foreign” 的分类，将不同类样本的 “mpg” 绘制出来，同时绘出样本整体的 “ 总 ” 直方图

//二变量图：

graph twoway lfit price weight || scatter price weight

//作出 price 和 weight 的回归线图 //“lfit” ，然后与 price 和 weight 的散点图相叠加

twoway scatter price weight,mlabel(make)

//做 price 和 weight 的散点图，并在每个点上标注 “make” ，即厂商的取值

twoway scatter price weight || lfit price weight,by(foreign)

//按照变量 foreign 的分类，分别对不同类样本的 price 和 weight 做散点图和回归线图的叠加，两图呈左右

分布

twoway scatter price weight || lfit price weight,by(foreign,col(1))


//按照变量 foreign 的分类，分别对不同类样本的 price 和 weight 做散点图和回归线图的叠加，两图呈上下

分布

twoway scatter price weight [fweight= displacement],msymbol(oh) //画出 price 和 weight 的散点图， “msybol(oh)” 表示每个点均为中空的圆圈， [fweight= displacement] 表示

每个点的大小与 displacement 的取值大小成比例

twoway connected y1 time,yaxis(1) || y2 time,yaxis(2)

//画出 y1 和 y2 这两个变量的时间点线图，并将它们叠加在一个图中，左边 “yaxis(1)” 为 y1 的度量，右边

“yaxis(2)” 为 y2 的

twoway line y1 time,yaxis(1) || y2 time,yaxis(2)

//与上图基本相同，就是没有点，只显示曲线

graph twoway scatter var1 var4 || scatter var2 var4 || scatter var3 var4

//做三个点图的叠加

graph twoway line var1 var4 || line var2 var4 || line var3 var4

//做三个线图的叠加

graph twoway connected var1 var4 || connected var2 var4 || connected var3 var4

//叠加三个点线相连图

//更多变量：

graph matrix a b c y

//画出一个散点图矩阵，显示各变量之间所有可能的两两相互散点图

graph matrix a b c d,half

//生成散点图矩阵，只显示下半部分的三角形区域

//用 auto 数据集：

graph matrix price mpg weight length,half by( foreign,total col(1) )

//根据 foreign 变量的不同类型绘制 price 等四个变量的散点图矩阵，要求绘出总图，并上下排列】 = 具

//其他图形：

graph box y,over(x) yline(.22)

//对应 x 的每一个取值构建 y 的箱型图，并在 y 轴的 0.22 处划一条水平线

graph bar (mean) y,over(x)

对应 x 的每一个取值，显示 y 的平均数的条形图。括号中的 “mean” 也可换成 median 、 sum 、 sd 、 p25 、p75 等



graph bar a1 a2,over(b) stack

//对应在 b 的每一个取值，显示 a1 和 a2 的条形图， a1 和 a2 是叠放成一根条形柱。若不写入 “stack” ，则

a1 和 a2 显示为两个并排的条形柱

graph dot (median)y,over(x) //画点图，沿着水平刻度，在 x 的每一个取值水平所对应的 y 的中位数上打点

qnorm x //画出一幅分位 - 正态标绘图

rchart a1 a2 a2 //画出质量控制 R 图，显示 a1 到 a3 的取值范围
