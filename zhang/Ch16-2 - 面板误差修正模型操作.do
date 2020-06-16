


/*------张华节---手把手教你Stata软件操作与案例分析---应用面板数据模型---------*/


/*-----------Ch16-2----此处，介绍如何进行【面板协整检验】-----*/





cd G:\Stataex                          /*----指定默认路径----*/
use G:\Stataex\cointegrationpdata.dta,clear      /*----打开指定路径下的数据文件----*/

*webuse xtcoint, clear                 /*----打开网络数据文件----*/

* encode id, gen(id1)      /*----生成新变量id(取值为1,2,3...)替代id----*/
xtset id time              /*----告诉Stata该数据为面板数据----*/

rename  productivity  y    /*----对变量重新命名，此处主要是为了后面操作简便----*/
rename  rddomestic    x1
rename  rdforeign     x2



* set matsize 11000 , permanently    /*----Stata/MP and Stata/SE----*/
* set matsize 800 , permanently    /*----for Stata/IC----*/





/*--第1步--利用【面板协整检验结果】判断协整回归模型中
是否包含个体固定效应或时间趋势项--
    --进而确定【面板误差修正模型】的形式----*/




/*--第2步-------------利用AIC、BIC计算面板误差修正模型【最优滞后阶数】-----------------*/

/*--1-1--【面板协整回归模型】中仅含【个体固定效应】项，----
------且斜率是【常数项】情形，因为此处个体数N=100，T=148，N较大--
------利用AIC、BIC计算面板误差修正模型【最优滞后阶数】------------*/

forvalues k = 6(-1)1 {
    forvalues j = 4(-1)1 {
        forvalues i = 5(-1)1 {
             quietly xtreg d.y  l.y l.x1 l.x2 l(1/`k').d.y  ///
			         l(0/`j').d.x1  l(0/`i').d.x2,fe vce(cluster id)
             est store model`k'`j'`i'
        }
    }
}
esttab model* using PECM1.xls, nogap aic bic mtitles replace
 
 
 
/*--第3步--找出最优滞后阶数后，重新回归，就能得到面板误差修正模型
和长期均衡方程----*/

xtreg d.y  l.y l.x1 l.x2 l(1/6).d.y l(0/1).d.x1  l(0/1).d.x2, fe vce(cluster id)
estimates store FEIC 
esttab using FEIC.xls, nogap aic bic mtitles replace

 
 
 
 
/*--1-2--【面板协整回归模型】中仅含【个体固定效应】项，----
-------且斜率是【可变】情形，因为此处个体数N=100，T=148，N较大------*/
/*--【注意】此处，变了y_t-1,x1_t-1,x2_t-1的系数--*/
/*------利用AIC、BIC计算面板误差修正模型【最优滞后阶数】------------*/

forvalues k = 4(-1)1 {
    forvalues j = 4(-1)1 {
        forvalues i = 3(-1)1 {
             quietly xtreg d.y  i.id#c.l.y i.id#c.l.x1 i.id#c.l.x2 ///
			           i.id#c.l(1/`k').d.y  i.id#c.l(0/`j').d.x1  ///
					   i.id#c.l(0/`i').d.x2,fe vce(cluster id)
             est store betamodel`k'`j'`i'
        }
    }
}
esttab betamodel* using PECM2.xls, aic bic mtitles replace


 
/*--第3步--找出最优滞后阶数后，重新回归，就能得到面板误差修正模型
和长期均衡方程----*/

xtreg d.y  i.id#c.l.y i.id#c.l.x1 i.id#c.l.x2 i.id#c.l(1/?k).d.y ///
         i.id#c.l(0/?j).d.x1  i.id#c.l(0/?i).d.x2, fe vce(cluster id)
/*--【注意】i.id#c.l(1/?k).d.y中"?k"是第2步确定d.y的最优滞后阶数
--"?j"、"?i"类似，不要弄错了--下同，故不赘述----*/

estimates store FEIR 
esttab using FEIR.xls, nogap aic bic mtitles replace





 
 
/*--2-1--【面板协整回归模型】中仅含【个体固定效应和线性时间趋势】项，----
-------且斜率是【常数项】情形，因为此处个体数N=100，T=148，N较大--------*/
/*------利用AIC、BIC计算面板误差修正模型【最优滞后阶数】------------*/

di tq(1973q3)                /*----看一下季度数据对应的数字是多少----*/
gen qtime=time-54            /*----生成时间(t-1)=1,2,3,...----*/
forvalues k = 4(-1)1 {
    forvalues j = 4(-1)1 {
        forvalues i = 3(-1)1 {
             quietly xtreg d.y  i.id#c.l.qtime l.y l.x1 l.x2 ///
			       l(1/`k').d.y  l(0/`j').d.x1  l(0/`i').d.x2,fe vce(cluster id)
             est store timemodel`k'`j'`i'
        }
    }
}
esttab timemodel* using PECMtime1.xls, aic bic mtitles replace


 
/*--第3步--找出最优滞后阶数后，重新回归，就能得到面板误差修正模型
和长期均衡方程----*/

xtreg d.y  i.id#c.l.qtime l.y l.x1 l.x2 l(1/?k).d.y l(0/?j).d.x1 ///
            l(0/?i).d.x2, fe vce(cluster id)
estimates store FEITC 
esttab using FEITC.xls, nogap aic bic mtitles replace





/*--2-2--【面板协整回归模型】中仅含【个体固定效应和线性时间趋势】项，----
-------且斜率是【可变】情形，因为此处个体数N=100，T=148，N较大--------*/
/*--【注意】此处，变了y_t-1,x1_t-1,x2_t-1的系数--*/
/*------利用AIC、BIC计算面板误差修正模型【最优滞后阶数】------------*/

* di tq(1973q3)                /*----看一下季度数据对应的数字是多少----*/
* gen qtime=time-54            /*----生成时间(t-1)=1,2,3,...----*/
forvalues k = 4(-1)1 {
    forvalues j = 4(-1)1 {
        forvalues i = 3(-1)1 {
             quietly xtreg d.y  i.id#c.l.qtime i.id#c.l.y i.id#c.l.x1///
			 i.id#c.l.x2 i.id#c.l(1/`k').d.y  i.id#c.l(0/`j').d.x1 ///
			 i.id#c.l(0/`i').d.x2,fe vce(cluster id)
             est store betatimemodel`k'`j'`i'
        }
    }
}
esttab betatimemodel* using PECMtime2.xls, aic bic mtitles replace


 
/*--第3步--找出最优滞后阶数后，重新回归，就能得到面板误差修正模型
和长期均衡方程----*/

xtreg d.y  i.id#c.l.qtime i.id#c.l.y i.id#c.l.x1 i.id#c.l.x2 ///
           i.id#c.l(1/?k).d.y i.id#c.l(0/?j).d.x1  i.id#c.l(0/?i).d.x2, fe vce(cluster id)
estimates store FEITR 
esttab using FEITR.xls, nogap aic bic mtitles replace





* 时间趋势项，变系数情形，y x1 x2 x3

forvalues k = 4(-1)1 {
    forvalues j = 4(-1)1 {
        forvalues i = 3(-1)1 {
		    forvalues h = 5(-1)1 {
             quietly xtreg d.y  i.id#c.l.qtime i.id#c.l.y i.id#c.l.x1///
			 i.id#c.l.x2 i.id#c.l.x3///
			 i.id#c.l(1/`k').d.y  i.id#c.l(0/`j').d.x1 ///
			 i.id#c.l(0/`i').d.x2 i.id#c.l(0/`h').d.x3,fe vce(cluster id)
             est store betatimemodel`k'`j'`i'`h'
			 }
        }
    }
}
