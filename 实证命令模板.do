***************************管理类实证论文模块化命令模板以oprobit为例************
****************************by 李文 wendell_lee@ruc.edu.cn**********************

*******************************0、数据清理和变量生成****************************
sum x1 x2 x3  //查看异常值
replace x1=. if x1==9999997 //清理异常值
gen age2=age*age //生成年龄平方项
drop if gender<0
rename a2 gender //老变量a2被命名为gender

***************************1、描述性统计：心中明确数据结构**********************
sum y x1 x2 x3
corr y x1 x2 x3//相关系数表
tab y if gender==0 //单变量分数位表
tab y x //联合分布表，最多俩个

*******************************2.1、导出Oprobit回归结果*************************
oprobit y x i.year,r
est store m1
//丰富模型方案：分组且核心变量、控制变量、固定效应逐步放入对比并表
esttab m1 m2 m3 m4 m5 m6,b(%6.3f) se star(* 0.1 ** 0.05 *** 0.01) ///
scalars(N r2 chi2) mtitles title(“图1”),using esttab1.rtf,replace//导出到rtf文件

logout, save(mylogout) excel replace fix(3):  /// //注意冒号；导出到Excel文件
esttab  m1 m2 m3 m4 m5 m6, ///
b(%6.3f) se(%6.2f) /// //系数、标准误
star(* 0.1 ** 0.05 *** 0.01)  /// //显著水平的标注
scalar(r2 r2_a N F) compress nogap

********************************2.2 中介效应：a*b显著即可************************
//约定，y：因变量 m：中介/调节变量 iv：核心解释变量 cv：协变量
//1.检验系数c（X对Y）
oprobit y x1 x2/*个人层面*/ //c的系数不显著没研究意义
//2.1检验系数a（M对Y）
oprobit y m x2//
//2.2检验系数b（X对M）
oprobit m x1 x2//中介（间接效应）核心在于a*b是否显著，a，b同显著则a*b显著，否则sobel检验
//2.3Sobel检验
sgmediation y if gender==2,mv(m) iv(x1) cv(x2 x3) //sobel中介效应检验
//3.检验系数c‘（中介模型中的下路）
oprobit y x1 x2 m//c‘系数显著，说明直接效应显著

*******************************2.3 调节效应：交互项显著即可**********************
generate x1x2=x1*x2  //定义交互项
oprobit y x1 x2 x1x2 x3 x4 //同时进入方程，交互项显著即可，主效应可以不再显著
est store m6
esttab m1 m2 m3 m4 m5 m6,b(%6.3f) se star(* 0.1 ** 0.05 *** 0.01) ///
scalars(N r2 F)  mtitles title(“图1”),using esttab1.rtf,replace
//调节效应斜杠图
twoway(lfit y x if m<2) (lfit y x if m>3),xtitle(m) ytitle(m) ///
xscale(range(1 5)) yscale(range(1 5)) xlabel(#5) ylabel(#5)
// m为调节变量，两分段可以不连续，一高一低且能看出两线斜率不一样即可

*******************************3.拓展性研究**************************************

**分位数回归：在y分段内回归（对x分段回归用if限定or门限模型）

qui reg y x1 x2 i.x3,vce(cluster id)//qui表安静回归，quiltly，不报过程
est store OLS
qreg y x1 x2 i.x3,q(0.25) //qreg为分数位回归
est store QR_25
qreg y x1 x2 i.x3,q(0.5)
est store QR_50
qui qreg y x1 x2 i.x3,q(0.75)
est store QR_75
qui qreg y x1 x2 i.x3,q(0.9)  
est store QR_90

logout, save(mylogout) excel replace fix(3):  ///
esttab QR_25 QR_50 QR_75 QR_90,se mtitles star(* 0.1 ** 0.05 *** 0.01) b(%6.3f) 

//分位数回归画图
set seed 10101
bsqreg y x1 x2 i.x3,reps(200) q(0.5)  
grqreg, ci ols olsci

**********************************4.稳健性检验**********************************
 两者均是处理样本选择偏误的方式，不同在于P
**（1）PSM克服自选择
psmatch2 belief happiness x1 x2//进入处理组和控制组的概率按协变量匹配
pstest, both
psgraph
//核密度估计图
//- 比较密度函数图
   
      //-匹配前的密度函数图   
        *-E-version(large)
          twoway (kdensity _ps if _treat==1,lp(solid) lw(*2.5)) ///
            (kdensity _ps if _treat==0,lp(dash) lw(*2.5)), ///
            ytitle("Density", size(*1.1))      ///
   ylabel(,angle(0) labsize(*1.1))    ///
            xtitle("Propensity Score", size(*1.1))  ///
   xscale(titlegap(2))         ///
            xlabel(0(0.2)0.8, format(%2.1f) labsize(*1.1))  ///
            legend(label(1 "Treatment Group") label(2 "Control Group") row(2) ///
               position(10) ring(0) size(*1.1))   ///
            scheme(s1mono) 
          graph export "Figs\kn01_large.wmf",  ///
              replace fontface("Times New Roman")          
        
      //-匹配后的密度函数图 
        *-E-version(large)
        twoway (kdensity _ps if _treat==1,lp(solid) lw(*2.5)) ///
            (kdensity _ps if _wei!=1 & _wei!=.,lp(dash) lw(*2.5)), ///
            ytitle("Density", size(*1.1))      ///
   ylabel(,angle(0) labsize(*1.1))    ///
            xtitle("Propensity Score", size(*1.1))  ///
   xscale(titlegap(2))         ///
            xlabel(0(0.2)0.8, format(%2.1f) labsize(*1.1))  ///
            legend(label(1 "Treatment Group") label(2 "Control Group") row(2) ///
               position(10) ring(0) size(*1.1))   ///
            scheme(s1mono) 
         graph export "Figs\kn02_large.wmf",  ///
              replace fontface("Times New Roman")   
			
***（2）Heckman两阶段克服自选择偏误
heckman wage edu gender,select(work=family health edu) twostep //检验是否有自选择
       //选择变量内至少一一个变量与前不一致，以能生成p_work（是否工作的概率）
heckman wage edu gender,select(work=family health edu) twostep first
probit wage edu gender
predict p_work,xb //生成work概率,xb不能改
gen IMR = normalden(p_work)/normal(p_work) 
       //影响work概率的变量被降维成单变量IMR（逆米尔斯比）
oprobit wage edu gender IMR
