//聚类分析：

cluster kmeans y x1 x2 x3, k(3) // 依据 y 、 x1 、 x2 、 x3 ，将样本分为 n 类，聚类的核为随机选取

cluster kmeans y x1 x2 x3, k(3) measure(L1) start(everykth) // "start" 用于确定聚类的核， "everykth" 表示将通过构造三组样本获得聚类核：构造方法为将样本 id 为 1 、1+3 、 1+3×2 、 1+3×3…… 分为一组、将样本 id 为 2 、 2+3 、 2+3×2 、 2+3×3…… 分为第二组，以此类推，将这三组的均值作为聚类的核； "measure" 用于计算相似性和相异性的方法， "L1" 表示采用欧式距离的绝对值，也直接可采用欧式距离// L2 和欧式距离的平方// L2squared 。 PS ：这个方法所得的结果与 SPSS所得结果相同。

sort c1 c2 //对 c1 和 c2 两个分类变量排序

by c1 c2 ： reg y x1 x2 x3 //在 c1 、 c2 的各个水平上分别进行回归

bysort c1 c2 ： reg y x1 x2 x3 if c3=1 //逗号前面相当于将上面两步骤合一，既排序又回归，逗号后面的 “if c3=1” 表示只有在 c3=1 的情况下才进行回归

stepwise, pr(.2): reg y x1 x2 x3 //使用 Backward selection ，去除 P 值大于 0.2 时变量 

stepwise, pe(.2): reg y x1 x2 x3 //使用 forward selection ，去除 P 值小于 0.2 时变量 

stepwise, pr(.2) pe(.01):reg y x1 x2 x3 //使用 backward-stepwise selection ，取 P 值在 0.01 和 0.2 之间的变量

stepwise, pe(.2) forward: reg y x1 x2 x3 //使用 forward-stepwise selection 

reg y x1 x2 x3

predict Yhat,xb

predict u,resid

predict ustd,stdr //获得残差的标准误

predict std,stdp //获得 y 估计值的标准误

predict stdf,stdf //获得 y 预测值的标准误

predict e,e(1,12) //获得 y 在 1 到 12 之间的估计值

predict p,pr(1 ， 12) //获得 y 在 1 到 12 之间的概率

predict rstu,rstudent //获得 student 的 t 值

predict lerg,leverage //获得杠杆值

predict ckd,cooksd //获得 cooksd 

reg y x1 x2 x3 c1 c2

adjust x1 x2 x3 ， se //使得变量 x1 、 x2 和 x3 等于其均值，求 y 的预测值和标准误

adjust x1 x2 x3 ， stdf ci //使得变量 x1 、 x2 和 x3 等于其均值，求 y 的预测值，预测标准误和置信区间

adjust x1 x2,by(c1) se ci //控制变量 x1 、 x2 ，亦即取它们的均值，在分类变量 c1 的不同水平上求 y 预测值，标准误和置信区间

adjust x1 x2 x3,by(c1) stdf ci //控制变量 x1 、 x2 、 x3 ，亦即取它们的均值，在分类变量 c1 的不同水平上求y 预测值，预测标准误和置信区间

adjust x1 x2,by(c1 c2) se ci //控制变量 x1 、 x2 ，在分类变量 c1 、 c2 的不同水平上求 y 的预测值，标准误和置信区间

adjust x1 x2 x3,by(c1 c2) stdf ci //控制变量 x1 、 x2 、 x3 ，在分类变量 c1 、 c2 的不同水平上求 y 的预测值，预测标准误和置信区间

adjust x1=a x2=b x3=c ， se ci //当 x1=a 、 x2=b 、 x3=c 时，求 y 的预测值、标准误和置信区间

adjust x1=a x2=b x3=c ， by(c1) se ci //当 x1=a 、 x2=b 、 x3=c 时，在分类变量 c1 的不同水平上，求 y 的预测值、标准误和置信区间

adjust x1=a x2=b c1=1 ， by(c1) se ci //当 x1=a 、 x2=b ，并假设所有的样本均为 c1=1 ，求在分类变量 c1的不同水平上，因为变量 x3 的均值不同，而导致的 y 的不同的预测值 …… 

mvreg Y1 Y2 ……: X1 X2 X3…… //多元回归

mvreg y1 y2 y3: x1 x3 x3 //多元回归分析， y1 y2 y3 为因变量， x1 x3 x3 为自变量

//以下命令只有在进行了 mvreg 之后才能进行

test [y1] //测试对 y1 的回归系数联合为 0 

test [y1]: x1 x2 //测试对 y1 的回归中 x1 、 x2 的系数为 0 

test x1 x2 x3 //测试在所有的回归中， x1 、 x2 、 x3 的系数均为 0 

test [y1=y2] //对 y1 的回归和对 y2 的回归系数相等

test [y1=y2]: x1 x2 x3, mtest //对 y1 和 y2 的回归中，分别测试 x1 、 x2 、 x3 的系数是否相等，若没有 mtest

//这个命令，则测试他们的联和统计

test [y1=y2=y3] //三个回归的系数是否相等，可加 mtest 以分别测试

test [y1=y2=y3]: x1 x2 //测试三个回归中的 x1 、 x2 是否相等，可加 mtest 
