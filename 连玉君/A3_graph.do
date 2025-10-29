



          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================
          *           -3.1- 简 介
  
  
          *         ----------------
          *             本讲目录
          *         ----------------
          *          3.1  简 介 
          *          3.2  二维图选项 
          *          3.3  元素代号	
          *          3.4  常用图形示例	
          *          3.5  结 语



*------------------
*-> 3.1   简 介
*------------------

          *    ==本节目录==
		  
          *    3.1.1 Stata 图形的种类 
          *    3.1.2 二维图命令的基本结构 
          *    3.1.3 几种常用图形的简单示例
          *    3.1.4 图形的管理
          *          3.1.4.1 图形的保存
          *          3.1.4.2 图形的导出 
          *          3.1.4.3 图形的调入
          *          3.1.4.4 插入 Word
          *          3.1.4.5 查询
          *          3.1.4.6 重新显示图形
          *          3.1.4.7 图形的合并
          *          3.1.4.8 删除图形 
          *    3.1.5 图形的显示模式(绘图模板) 
          *          3.1.5.1 显示模式种类
          *          3.1.5.2 中文投稿的黑白图
          *          3.1.5.3 stata 用户提供的模板
          *          3.1.5.4 创建自己的图形模板	
	  		  

  * cd D:\stata11\ado\personal\Net_course\A3_graph
    cd `c(sysdir_personal)'Net_course_A\A3_graph
	
*________________________
*-3.1.1 Stata 图形的种类
                              
                                     /*
 graph twoway   二维图
      scatter   散点图
      line      折线图
      area      区域图
      lfit      线性拟合图
      qfit      非线性拟合图
      histogram 直方图
      kdensity  密度函数图
      function  函数图
---------------------------------
 graph matrix   矩阵图
 graph bar      条形图
 graph dot      点图
 graph box      箱形图
 graph pie      饼图
---------------------------------
      ac        相关系数图
      pac       偏相关系数图
      irf       脉冲相应函数图
---------------------------------
     ... ...                         */ 



*____________________________
*-3.1.2 二维图命令的基本结构

  *-整体架构 
    
	* twoway (单元图1) (单元图2) (...) ，选项1 选项2 ...
    
	* twoway  单元图1 || 单元图2 || ... ， 选项1 选项2 ...
     
  *-单元图的定义
    
	* (单元图类型 y1 y2 ... x , 选项1 选项2 ...)
     
  *-二维图选项的定义
    
	* 二维图选项标题 (定义内容 , 子选项 子选项 ...)
    
	
  *- 一个标准的实例
  *-----------------------------------------------------------
     sysuse sp500, clear
     twoway (line high date) (line low date)           ///
           ,                                           ///  
           title("图1：股票最高价与最低价时序图", box) ///
           xtitle("交易日期", margin(medsmall))        ///
           ytitle("股票价格")                          ///
           ylabel(900(200)1400) ymtick(##5)            ///
           legend(label(1 "最高价") label(2 "最低价")) ///
           note("资料来源：Stata公司，SP500.dta")      ///
           caption("说明：我做的第一幅Stata图形！")    ///
		   saving(mypig.gph, replace)
   *----------------------------------------------------------
   *- 注意：逗号后全部为选项，裸露在外的逗号只有一个


   
*                      +--------+
*=======================本讲导读========================
*                      +--------+

* 图形无非是点、线(面)、文字等元素的组合

* 这些组合的整体“风格”构成了图类:   单元图（逗号前的部分）

* 每种图形的具体特征由元素的特征决定：选项（逗号后的部分）

* 因此，选项的填写是Stata绘图的关键！

*=======================================================



*______________________________ 
*-3.1.3 几种常用图形的简单示例

    sysuse sp500, clear

  *-散点图
    twoway scatter high date
    
  *-折线图
    twoway line change date
    
  *-柱状图
    twoway bar open date in 1/50
    
  *-直方图
    histogram change
    
  *-密度函数图
    kdensity close, normal
    
  *-数学函数图
    twoway (function y=sin(x), range(-10 10) lw(*1.5))  ///
           (function y=cos(x), range(-10 10) lw(*2.0)), ///
           ytick(-2(0.5)2) ylabel(, angle(0))           ///
           yline(0, lcolor(black*0.5) lpattern(dash))   ///
		   scheme(s1mono)
 
 
*___________________ 
*-3.1.4 图形的管理

 *-3.1.4.1 图形的保存
   
   help graph save
   
    *-第一种方式
      sysuse sp500, clear
      twoway line high date
      graph save fig1.gph, replace
	  graph use fig1.gph           // 重现图形
	   
    *-第二种方式
      twoway line high date, saving(A3_price.gph, replace)
	  
    *-手动方式：右击 —> Save graph ...—> 填入图形名称，选择保存类型

	
 *-3.1.4.2 图形的导出 
   
   help graph export
   
    sysuse sp500, clear
    twoway line  high low  date
    graph export A3_price.wmf, replace
    graph export "D:\mypaper\A3_price.wmf", replace	
    
    *-注：相当于另存为其他格式的图形

    *   后缀       附加选项       输出格式
    *  ------------------------------------------------------------
    *   .ps        as(ps)         PostScript
    *   .eps       as(eps)        Encapsulated PostScript
    *   .wmf       as(wmf)        Windows Metafile
    *   .emf       as(emf)        Windows Enhanced Metafile
    *   .pict      as(pict)       Macintosh PICT format
    *   .png       as(png)        PNG (Portable Network Graphics)
    *   .tif       as(tif)        TIFF
    *    other                    must specify as()
    *  ------------------------------------------------------------
    
  *-调整输出图片的分辨率 
    twoway line high low date
    graph export A3_price2.tif, width(3160) height(1800) replace
	shellout A3_price2.tif
    *-注意：仅适用于 .png 和 .tif 格式的图片


 *-3.1.4.3 图形的调入
   
   help graph use
     
   graph use fig1.gph 
   graph use fig1, scheme(s1mono)
   graph use fig1, scheme(economist)   

 
 *-3.1.4.4 插入 Word
    
	shellout mypaper.doc
	
	* 右击 —> copy —> 粘贴到Word中
    * 若图片太大，可以右击图片->设置图片格式->大小，进行相应的调整
    * 建议先将图形输出为 wmf 格式，然后再贴入 word 
 
 
 *-3.1.4.5 查询
    graph dir

 
 *-3.1.4.6 重新显示图形
    
	twoway line  high low  date
    graph display, scheme(sj)
    graph save A3_price_sj.gph, replace

 
 *-3.1.4.7 图形的合并
    
	help graph combine
	
	sysuse sp500, clear
	twoway line high low date
	  graph save A3_price.gph, replace
	twoway line high low date, scheme(s1mono)
	  graph save A3_price_sj.gph, replace	
    graph combine A3_price.gph  A3_price_sj.gph

	
 *-3.1.4.8 删除图形
    erase A3_price.gph
	graph dir


*_____________________
*-3.1.5 图形的显示模式  (绘图模板)
 
  *-3.1.5.1 显示模式种类
  
    help schemes   // Stata 提供的显示模式
    
    *-两种设定方式
    *  set scheme schemename [, permanently]
    *  graph ...  [, ...  scheme(schemename) ...]
  
    *----实例-----
     sysuse auto, clear
     
	 twoway scatter price weight, scheme(sj)
     graph save A3_gr1.gph, replace
     graph use  A3_gr1.gph, scheme(s2color)
	 
     set scheme  economist
     twoway scatter price weight
     
	 
    *-各种显示模式一览
      graph use A3_scheme1.gph 
      doedit A3_scheme1.do

	
  *-3.1.5.2 中文投稿的黑白图
    
	set scheme s1mono
	
	sysuse auto, clear
	twoway scatter price weight
	graph bar price, over(foreign)
	graph bar price, over(rep78) over(foreign) 
    
	sysuse sp500, clear
    twoway (connect high date,sort  msymbol(D))    ///
           (connect low date, msymbol(+)) in 1/20  ///
		   , scheme(s1mono)

		   
  *-3.1.5.3 stata 用户提供的模板
    
	*-Mitchell 提供的模板
	  * Mitchell, M. 
	  *   A visual guide to Stata graphics. 
	  *   Stata Press, 2008.
	
      view browse "http://www.stata-press.com/data/vgsg.html"
    
	 * net from http://www.stata-press.com/data/vgsg2/
     * net install vgsg2   // 安装外部模式插件
	 * net get vgsg2       // 下载相关数据

	 *-e.g
	   use allstates.dta, clear
	   twoway scatter propval100 rent700 ownhome,  ///
	          scheme(vg_s1c)   // vg_s1c 黑白底，彩色图
			  
	   twoway scatter propval100 rent700 ownhome,  ///
	          scheme(vg_s1m)   // vg_s1c 黑白底, 黑白图

       *-其它模板(10余种)：参见 Mitchell(2008, section 1.3)
	  
	  
	*-Roger Newson 提供的模板	  
      
	  help scheme_rbn1mono
	  
	  use allstates.dta, clear
	  
	  *-stata默认黑白图
	    twoway scatter propval100 rent700 ownhome,  ///
	           scheme(s1mono)   
	  
	  *-rbn1mono 模式 比较紧凑
	    twoway scatter propval100 rent700 ownhome,  ///
	          scheme(rbn1mono) 
        *-需要适当修改
	    twoway scatter propval100 rent700 ownhome,  ///
	           scheme(rbn1mono)                    ///
			   xlabel(,angle(0)) legend(row(1))
    
	*-其它模板
     
	  findit scheme 
	   
	   
  *-3.1.5.4 创建自己的图形模板
   
      help scheme_files
	  
	  viewsource scheme-rbn1mono.scheme  // rbn1mono 模板
	
		
	
	
	
	
	
	

          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================
          *         -3.2- 二维图选项
		  *                  (I)
		  
		  
          *    ==本节目录==
		  
          *    3.2.1 坐标类 
          *          3.2.1.1 坐标轴刻度(tick)及刻度标签(label)
          *          3.2.1.2 坐标轴标题: ytitle() xtitle()
          *          3.2.1.3 坐标结构: yscale() xscale()
          *          3.2.1.4 双坐标系 
          *    3.2.2 标题类
          *          3.2.2.1 标题的种类
          *          3.2.2.2 示例
          *          3.2.2.3 标题的位置
          *    3.2.3 区域类
          *          3.2.3.1 Stata图形的区域划分
          *          3.2.3.2 控制内区和外区的边距
          *          3.2.3.3 控制图形的纵横比例
          *          3.2.3.4 绘图区的显示模式
          *          3.2.3.5 绘图区和全图区背景颜色的控制
          *    3.2.4 图例类
          *          3.2.4.1 自动产生的图例
          *          3.2.4.2 从新定制图例
          *          3.2.4.3 图例的位置
          *          3.2.4.4 多个图例的重排  
          *          3.2.4.5 线型的控制	
	
	
	
*------------------------
*-> 3.2   二维图选项
*------------------------
  
  help twoway_options

*_______________
*-3.2.1 坐标类
  
  help axis_options

 
 *-3.2.1.1 坐标轴刻度(tick)及刻度标签(label)
    
	help axis_label_options
    
	set scheme s2color
    sysuse auto, clear
    scatter mpg weight, xlabel(#10)   // 显示出来的刻度标签未必是10个，?
    
   * 主刻度及标签：ylabel(), xlabel() // 显示刻度标签时，同时显示刻度
   * 主刻度：	   ytick(),  xtick()  // 按设定显示刻度，仅显示主要刻度的标签
   * 子刻度及标签：ymlabel(),xmlabel()
   * 子刻度：	   ymtick(), xmtick()
    
   *-实例
     
	 scatter mpg weight              // Stata 默认设定，比较宽松 
     
	 scatter mpg weight, xlabel(#10) // 在横坐标上列示10个最佳的刻度及其标签 
     
	 scatter mpg weight, xtick(#10)
     
	 scatter mpg weight,    ///
            ylabel(10(5)45) ///
            xlabel(1500 2000 3000 4000 4500 5000) // 自行设定刻度标签 
    
	 scatter mpg weight, ymlabel(##5) xmtick(##10) // 子刻度和子刻度标签 
     
	 scatter mpg weight, xlabel(1500 2500 3190 "中位数" 3500 4500) 
                                   // 刻度标签由`数字'替换为`文字' 

     * 参数设定规则：
     *   rule     example    description
     *  --------------------------------------------------------------
     *   #?       #4         4 个最佳值
     *   ##?      ##10       10-1=9 个子刻度列印于主刻度之间
     *                         仅适用于 mlabel() 和 mtick() 选项
     *   ?(?)?    10(5)45    在 10 到 45 范围内，每隔 5 列印一个子刻度
     *   none     none       不显示刻度标签
     *  --------------------------------------------------------------
     *   注：#? 和 ##? 比较常用

    * 刻度标签的角度(详见文字选项部分) 
      scatter mpg weight, xlabel(,angle(45)) ylabel(,angle(-15))


	  
 *-3.2.1.2 坐标轴标题: ytitle() xtitle()
     
	 help axis_title_options
     
     sysuse auto, clear
     scatter mpg weight, ytitle("汽车里数") xtitle("汽车重量") 
     
   *-坐标轴标题的位置
     scatter mpg weight, ytitle("汽车里数",place(top))  ///
                         xtitle("汽车重量",place(right)) 
   
   *-长标题的处理
     scatter mpg weight, xtitle("汽车里数" "(mpg)")


	 
 *-3.2.1.3 坐标结构: yscale() xscale()
    
	help axis_scale_options
    
  *-显示范围的控制
    scatter mpg weight
	scatter mpg weight, xscale(range(0 5000)) xlabel(0(1000)5000)   
    scatter mpg weight, xscale(range(1000 6000))
    scatter mpg weight, xscale(range(3000 4000))  //为何不奏效？
    scatter mpg weight if (wei>=3000&wei<=4000)  // 局部显示需要用if语句
    
  *-坐标轴标题间距的控制
    label var mpg    "汽车里数"
    label var weight "汽车重量"
    scatter mpg weight , xlabel(#14)                       // 默认设置                
    scatter mpg weight, xscale(titlegap(2))   // 坐标轴与坐标轴标题间距 
    scatter mpg weight, xscale(titlegap(2) outergap(-2)) // 坐标轴标题下边距 
    
	
  *-坐标轴的显示
    
	*-不显示坐标轴
      scatter mpg weight, yscale(noline) xscale(noline)  
    
	*-不显示坐标轴和刻度标签
      scatter mpg weight, yscale(off) xscale(off)  
    
	*-无边距
      scatter mpg weight, yscale(off) xscale(off) plotregion(style(none))
      
    *-坐标轴线型
      scatter mpg weight, xscale(lcolor(red) lwidth(vthick))


	  
 *-3.2.1.4 双坐标系 
   
   help axis_choice_options 
  
  *-共用 x 轴
    
	sysuse sp500, clear
      twoway line close change date
	  twoway (line close  date, yaxis(1))  ///
             (line change date, yaxis(2))
      
	  twoway (line close  date, yaxis(1))  ///
             (line change date, yaxis(2)), ///
             ylabel(-50(10)40, axis(2) angle(0) labsize(small))
  
  *-单独的 y 轴和 x 轴
      
	  twoway (line close  date, yaxis(1) xaxis(1))  ///
             (line change date, yaxis(2) xaxis(2)), ///
              ylabel(-50(10)40,   axis(2))          ///
              xlabel(15005 15239, axis(2))          ///
              xtitle("", axis(2))
 
 

*_______________
*-3.2.2 标题类

  *-3.2.2.1 标题的种类
    
    * 主标题、副标题、注释、说明
    * title()、subtitle()、note()、caption()
      
	  help title_options
  
  *-3.2.2.2 示例
  
    sysuse auto,clear
    
	scatter mpg weight, title("Mileage and weight")
    
	scatter mpg weight, title("Mileage and weight", box)
    scatter mpg weight, title("Mileage and weight", box bexpand)
    
	scatter mpg weight, title("主标题") subtitle("副标题")
    
	scatter mpg weight, title("主标题") ///
                        subtitle("副标题") ///
                        note("注释内容")   ///
                        caption("进一步的说明")
    
	scatter mpg weight, title("汽车里数和重量的" "散点图") ///
                        subtitle("——美国资料实例")
               
                             
  *-3.2.2.3 标题的位置
  
    *-说明：本节内容同样适用于其它包含 legend() 选项的类目

    * 默认位置
     *   -----------------------------------
     *   title()                 居中
     *   subtitle()              居中
     *   note()                  左对齐
     *   caption()               左对齐
     *   -----------------------------------
     
     * 重新定位：position() 的取值 
     *
     *        +---------------------------------------+
     *        |        11         12        1         |
     *        |                                       |
     *        |       +-----------------------+       |
     *        |10     |10 or 11   12   1 or 2 |     2 |
     *        |       |                       |       |
     *        |       |        绘 图 区       |       |
     *        | 9     | 9       ring=0      3 |     3 |
     *        |       |                       |       |
     *        |       |                       |       |
     *        | 8     | 7 or 8     6   4 or 5 |     4 |
     *        |       +-----------------------+       |
     *        |                                       |
     *        |         7         6         5         |
     *        +---------------------------------------+
    
     * 默认相对间距：ring() 的取值
     * ---------------------------------------------------------
     * plot region        0     | ring(0) = 绘图区内
     * {t|b|l|r}1title()  1     |
     * {t|b|l|r}2title()  2     | ring(k), k>0, 绘图区以外
     * legend()           3     | 
     * note()             4     |
     * caption()          5     | ring() 的值越大，距离绘图区越远
     * subtitle()         6     | 
     * title()            7     | 
     * ---------------------------------------------------------
    
     * 示例
       scatter mpg weight, title("汽车里数和重量",position(5))
       scatter mpg weight, title("汽车里数和重量",position(3) ring(0)) 
       scatter mpg weight, title("汽车里数和重量",position(3) ring(12))   


	   
*________________
*-3.2.3 区域类

  help region_options

  *-3.2.3.1 Stata图形的区域划分
	do A3_region.do
    
  *-3.2.3.2 控制内区和外区的边距
    twoway function y=x
    twoway function y=x, plotregion(fcolor(green*0.4)) ///
                         plotregion(ifcolor(white))
    twoway function y=x, plotregion(margin(0))  // 图形真正从原点开始出发
    twoway function y=x, graphregion(margin(0))   
    twoway function y=x, plotregion(margin(l+15 r+5 t=10 b+4))  
                                        /*四个边距可以分别控制*/
                                        
  *-3.2.3.3 控制图形的纵横比例
    twoway function y=x  /*如何得到正方形的图形？*/
    twoway function y=x, ysize(5) xsize(5)
    
  *-3.2.3.4 绘图区的显示模式
    twoway function y=x, plotregion(style(none))    
    twoway function y=x, plotregion(style(ci2))
    
  *-3.2.3.5 绘图区和全图区背景颜色的控制
    sysuse auto, clear
    scatter mpg weight, graphregion(fcolor(green*0.8)) ///
                        graphregion(ifcolor(yellow))   ///
                        plotregion(fcolor(black*0.3))  ///  
                        plotregion(ifcolor(white))     ///
                        title("Stata图形分成四个区域")



*_______________
*-3.2.4 图例类
  
  help legend_options

  *-3.2.4.1 自动产生的图例
  
    * 一张图中同时呈现多个序列，便会自动产生图例
    * 对于变量而言，其默认图例是它的变量标签
  
    sysuse sp500, clear
    twoway (line high date) (line low date)  // 如何加入中文图例？
    
    sysuse auto, clear
    twoway (scatter price weight if foreign==1) ///
             (lfit price weight if foreign==1)  ///
           (scatter price weight if foreign==0) ///
             (lfit price weight if foreign==0)  
    * 此时，图例显得过于繁琐


  *-3.2.4.2 从新定制图例

   * 第一种方式：预先定义变量标签
     sysuse sp500, clear
     label var high 最高股价
     label var low  最低股价
     twoway (line high date) (line low date)
     *-缺点：会永久改变变量标签
     
   * 第二种方式：每个图单独加图例
     sysuse sp500, clear
     twoway (line high date,legend(label (1 "最高价"))) ///
            (line low date, legend(label (2 "最低价")))
            
   * 第三种方式：整体加图例
     twoway line high date || line low date, ///
         legend(label(1 "最高价") label(2 "最低价"))
         
   * 不显示图例 legend(off)
     twoway (line high date) (line low date), legend(off)


  *-3.2.4.3 图例的位置
 
   * legend 的默认位置是 ring(3)
   
   * 绘图区`外'的时钟点上
     twoway line high date || line low date, ///
	        legend(position(12))  
     
   * 绘图区`内'的时钟点上 ring(0)
     twoway line high date || line low date, ///
	            legend(ring(0)) 
     twoway line high date || line low date, ///
	            legend(position(12) ring(0))
      
   * 改变legend()的相对位置
     * note()   的默认位置是 ring(4)
     * caption()的默认位置是 ring(5)
     twoway line high date || line low date,  ///
         note("addad") caption(资料来源：Stata 公司)
     twoway line high date || line low date,   ///
         caption(资料来源：Stata 公司, ring(3)) ///
         legend(ring(5))    


  *-3.2.4.4 多个图例的重排  rows(#), cols(#) 选项
    sysuse uslifeexp.dta, clear
    line  le le_w le_b  year
    line  le le_w le_b  year, legend(rows(1))
    line  le le_w le_b  year, legend(cols(1) size(small))

	
  *-3.2.4.5 线型的控制
    
	help connect_options
    help linepatternstyle
    help linestyle
   
    sysuse sp500, clear
	
    twoway connect open close low  date in 1/10
							  
    twoway connect open close low  date in 1/10,  ///
                   lpattern(solid dash longdash)
					   
    twoway connect open close low  date in 1/10,  ///
                   lpattern(solid dash longdash)  ///
					   scheme(s1mono)  // 黑白图片




	
	
	
	
	

          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================
          *         -3.2- 二维图选项
		  *                 (II)
		  
        cd `c(sysdir_personal)'Net_course_A\A3_graph
		
          
		  *     ==本节目录==

          *    3.2.5 附加线类
          *          3.2.5.1 选项结构
          *          3.2.5.2 附加线 <位置>
          *          3.2.5.3 附加线 <风格>
          *          3.2.5.4 附加线 <线宽>
          *          3.2.5.4 附加线 <颜色>
          *          3.2.5.5 附加线 <线型>
          *          3.2.5.5 附加线属性的独立性
          *    3.2.6 文字与文本框
          *          3.2.6.1 选项类别
          *          3.2.6.2 文字和文本框的整体风格
          *          3.2.6.3 文本框属性
          *          3.2.6.4 文字属性  
          *    3.2.7 图标类
          *          3.2.7.1 简介
          *          3.2.7.2 图标的位置
          *          3.2.7.3 图标的大小
          *          3.2.7.4 图标的角度 
          *          3.2.7.5 图标的颜色
          *    3.2.8 其它选项
          *          3.2.8.1 分组绘图
          *          3.2.8.2 重新设置变量标签
          *          3.2.8.3 重新设置变量显示格式
          *          3.2.8.4 重设图形种类
		  
		  
*__________________
*-3.2.5 附加线类

  help added_line_options
  
  *-说明：本节中介绍的附加线属性，适用于所有与线相关的对象

 *-3.2.5.1 选项结构
  
  * twoway ..., yline(数字, 子选项)
  * twoway ..., xline(数字, 子选项)
    *-数 字： 控制附加线的位置
    *-子选项：控制附加线的类型、颜色、宽度等
    
	
 *-3.2.5.2 附加线 <位置>
   
   sysuse sp500, clear
   line open date, yline(1100)
   line open date, yline(1100 1313) xline(15242)
   
   
 *-3.2.5.3 附加线 <风格>
   
   * defult      决定于显示模式(set scheme)
   * extended    延伸到绘图外区
   * unextended  不延伸到绘图外区
   
   line open date, yline(1100, style(unextended))
   *-解释
   line open date, yline(1100, style(unextended)) ///
                   plotregion(fcolor(green*0.3))  ///
				   plotregion(ifcolor(white))
   line open date, yline(1100)                    ///
                   plotregion(fcolor(green*0.3))  ///
				   plotregion(ifcolor(white))				   
   
   
 *-3.2.5.4 附加线 <线宽>
   
   help linewidthstyle
   
   line open date, yline(1100, lwidth(thick))  // 采用代号设定
   line open date, yline(1100, lwidth(*1.5))   // 设定相对宽度
   
   
 *-3.2.5.4 附加线 <颜色>
   
   graph query colorstyle
   
   line open date, yline(1100, lcolor(blue))  
   line open date, yline(1100, lcolor(blue*0.3))   
   
   
 *-3.2.5.5 附加线 <线型>
   
   help linepatternstyle
   
   palette linepalette 
   
   line open date, yline(1100, lpattern(dash) lcolor(black*0.3))  
   line open date, yline(1100, lpattern(dot)) 
    
	
 *-3.2.5.5 附加线属性的独立性
   
   line open date, yline(1100,lp(shortdash_dot) lc(blue*0.6))  ///
                   yline(1313,lw(*2.5) lc(green*0.4))          ///
                   xline(15242,lw(*2) lc(pink*0.4) lp(longdash))



*_____________________
*-3.2.6 文字与文本框

  help textbox_options
  help textstyle
  help textboxstyle
  
  * 指点迷津：想想 word 中的文本框
  * 凡是出现文字的地方都可以做下面的设定

  
  *-3.2.6.1 选项类别
   
   * 文字和文本框的整体风格：  标题、副标题、文本、小号
   
   * 文本框相关设定：文本框颜色、背景、与文字的边距等
   
   * 文字相关的设定：大小、颜色、位置、行距

   
 *-3.2.6.2 文字和文本框的整体风格
   
   *-文字的风格: 文字的标准化大小
     help textstyle
   
   *-文本框的风格
     help textboxstyle
     line open date, title("SP500 开盘价", tstyle(subheading))
   
   *-文字与文本框的区别：
   *  文字：  单行，无边框
   *  文本框：单行或多行，可加边框，是文字的更一般化定义


 *-3.2.6.3 文本框属性
 
   *-显示文本框
	 line open date, title("SP500 开盘价", box)
   
   *-文本框的相对大小
     line open date, title("SP500 开盘价", box width(60) height(15)) 
   
   *-文本框的背景和边框的颜色
     line open date, title("SP500 开盘价", box fcolor(blue*0.2))   //仅背景
     line open date, title("SP500 开盘价", box bcolor(yellow*0.4)) //背景和边框
     line open date, title("SP500 开盘价", box fc(blue*0.2) lc(red))
   
   *-边框的粗细、线型
     line open date, title("SP500 开盘价", box fc(yellow*0.2)  ///
                       lc(green) lwidth(*2.5) lpattern(dash)) 
   
   *-文字与边框的相对位置
     line open date, title("SP500 开盘价", box width(60) height(15) ///
                     alignment(middle))    // 纵向定位
     line open date, title("SP500 开盘价", box width(60) height(15) ///
                     justification(right)) // 横向定位 


 *-3.2.6.4 文字属性  
 
  *-文字位置
    
	help compassdirstyle
     
	 * 控制标题等位置: place()
       line open date, xtitle("交易日期", place(right)) ///
                       ytitle("开盘价格", place(top))
     
	 * 在图形中的特定坐标点添加文字
       line open date, text(1324.83 15117 "一个波峰") 
      
	  
  *-文字的角度
    
	help anglestyle
    
	line open date
    line open date, xlabel(, angle(30)) ylabel(,angle(0))
    line open date, xlabel(, angle(30)) ylabel(,angle(15)) ///
	                         ymlabel(##4,angle(15))
    
	
  *-文字大小
    
	help textsizestyle
     
	line open date, text(1324.83 15117 "一个波峰",size(huge)) // 绝对大小
    line open date, text(1324.83 15117 "一个波峰",size(*1.6)) // 相对大小 
      
	  
  *-文字颜色
    
	help colorstyle
     
	line open date, text(1324.83 15117 "一个波峰",color(blue))
    line open date, text(1324.83 15117 "一个波峰",color(black*0.4))
     
  *-文字行距
    
	line open date,   ///
	     note("SP500指数的时序图""(在此期间，股市两次大跌！)", ///
		 color(blue))
    
	line open date,   ///
	     note("SP500指数的时序图""(在此期间，股市两次大跌！)", ///
         color(blue) linegap(2.5))



*_______________
*-3.2.7 图标类

  help markerlabelstyle
  help marker_options
  help marker_label_options

  
  *-3.2.7.1 简介
   
    *-命令结构：  twoway (单元图) , mlabel(文字变量) 其他选项
      
	  sysuse lifeexp, clear
	  
      do A3_mlabel.do
      
	  list lexp gnppc country2 if region==2
      scatter lexp gnppc if region==2, mlabel(country2)

	  
 *-3.2.7.2 图标的位置
   
   *-整体设定
     scatter lexp gnppc if region==2,   ///
	         mlabel(country2) mlabposition(9)
     scatter lexp gnppc if region==2,   ///
	         mlabel(country2) mlabp(3) 
               
			   help clockposstyle
             
			 *         11  12  1
             *       10         2
             *        9    0    3
             *        8         4
             *          7  6  5  
   
   *-个别设定
	 gen pos = 3
     replace pos = 4  if country2=="美国"
     replace pos = 1  if country2=="宏都拉斯"
     
	 scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos)
     scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             xscale(range(-2000 33000))
        
		
 *-3.2.7.3 图标的大小
   
   *-标准化大小
     
	 help textstyle
     
	 scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             mlabtextstyle(heading)
			 
   *-任意大小
     
	 help textsizestyle
     
	 scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             mlabsize(vsmall) 
			 
     scatter lexp gnppc if region==2,     ///
	         mlabel(country2) mlabvp(pos) ///
             mlabsize(*0.7)  // 推荐采用此法！
         
		 
 *-3.2.7.4 图标的角度 
   
   * 可以是任意数值
   * 0 水平  90 竖直 
   
   help anglestyle
   
   scatter lexp gnppc if region==2,     ///
           mlabel(country2) mlabvp(pos) ///
           mlabangle(15)
   
   scatter lexp gnppc if region==2,     ///
           mlabel(country2) mlabvp(pos) ///
		   mlabangle(-15)               ///
		   xscale(range(35000) log)
		   
   help axis_scale_options
   
   
 *-3.2.7.5 图标的颜色
   
   help colorstyle
   
   scatter lexp gnppc if region==2,     ///
           mlabel(country2) mlabvp(pos) ///
           mlabcolor(green)



*__________________
*-3.2.8  其它选项

  *-3.2.8.1 分组绘图
  
    help by_option
   
    sysuse auto, clear
    scatter mpg weight, by(foreign)
    scatter mpg weight, by(foreign, total)
    scatter mpg weight, by(foreign, total rows(1))
    scatter mpg weight, by(foreign, total cols(1))
	scatter mpg weight, by(foreign, total cols(1) style(compact))
	
	
   *------------------一个复杂的示例-----------------------
	use comp2001ts, clear
	  browse
    reshape long price, i(date) j(compname) string
      browse
    
	#delimit ;	    // 彩色图形
	twoway tsline price ,  
	  by(compname, cols(1) yrescale note("") compact)
      ylabel(#2, nogrid) 
	  title(" ", box width(130) height(.001) bcolor(ebblue))
	  subtitle(, pos(5) ring(0) nobexpand nobox color(red))
	  scheme(s2color) ;
    #delimit cr
  
	#delimit ;	    // 黑白图形
	twoway tsline price ,  
	  by(compname, cols(1) yrescale note("") compact)
      ylabel(#3, nogrid) 
	  title(" ", box width(130) height(.001) bcolor(black*0.3))
	  subtitle(, pos(5) ring(0) nobexpand nobox color(black))
	  scheme(s1mono) ;
    #delimit cr	
   *--------------------------------------------------------
   
   
  *-3.2.8.2 重新设置变量标签
  
    help advanced_options
   
    sysuse sp500, clear
	
    twoway line close date,     ///
	    yvarlabel("收盘价") xvarlabel("交易日期")
    
	twoway line high low date,       ///
        yvarlabel("最高价" "最低价") ///
        xvarlabel("交易日期")
  
  *-说明：比 legend() 命令要简洁


  *-3.2.8.3 重新设置变量显示格式
  
    help advanced_options 
   
    twoway line high date, xvarformat(%tdY-n-d) yvarformat(%6.2f) 


  *-3.2.8.4 重设图形种类
  
    twoway line change date, recast(area)
  
    twoway area change date
  
    twoway (line change date if change>0, recast(spike)) ///
           (line change date if change<0, recast(area))
  
    twoway (line change date, recast(area) color(blue)) ///
           (line change date if abs(change)<15, recast(area) color(red)), ///
           legend(label(1 "|change|>=15") label(2 "|change|<15"))
         
    twoway function y=normalden(x), range(-4 4) 
   
    twoway function y=normalden(x), range(-4 4) recast(spike)
  
    twoway (function y=normalden(x), range(-4 4)) ///
       (function y=normalden(x), range(-4 -1.96)  ///
           recast(area) color(black*0.4))         ///
       (function y=normalden(x), range(1.96   4)  ///
           recast(area) color(black*0.4)),        ///
       legend(off)
         
		 
    *-示例：彩色花瓣       
      
	  doedit A3_area02.do


	



	
	
	

          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================
          *          -3.3- 元素代号
				  
	  
*------------------------
*-> 3.3     元素代号
*------------------------

          *     ==本节目录==

          *    3.3.1 颜色代号
          *    3.3.2 线 相关的代号
          *          3.3.2.1 线型代号
          *          3.3.2.2 线宽代号
          *          3.3.2.3 连接方式代号
          *    3.3.3 标记符号的代号
          *          3.3.3.1 符号样式
          *          3.3.3.2 符号的边界和填充
          *          3.3.3.3 符号代号一览
          *    3.3.4 文字相关的代号
          *          3.3.4.1 文字大小代号
          *          3.3.4.2 文字角度代号
          *          3.3.4.3 文字对齐方式的代号
          *    3.3.5 边距大小的代号	
		  
		  
        cd `c(sysdir_personal)'Net_course_A\A3_graph		  

		
*________________
*-3.3.1 颜色代号

  help colorstyle
  graph query colorstyle
  
  * 显示特定的颜色
    palette color  blue brown
    palette color  olive dkorange
    
  * 颜色模板
    palette_all            // 外部命令
	palette_all, b(white)  // 指定背景，便于对比
    palette_all, b(black)

	vgcolormap             // 外部命令,效果更佳
	
	clear
	full_palette           // 外部命令，附加 RGB 代码, 66 种颜色
	browse
    
	
  * 调制自己喜欢的颜色
  *    代码格式                  调色方式
  * ---------------------------------------------------------
  *   # # #        RGB value; white = "255 255 255"
  *   # # # #      CMYK value; yellow = "0 0 255 0"
  *   color*#      color with adjusted intensity; yellow*1.2
  *   *#           default color with adjusted intensity
  * ---------------------------------------------------------
  
  *- 三个基准色：      
  *		 red     =   255    0    0
  *      green   =     0  255    0
  *      blue    =     0    0  255

      
	*-RGB 与 CMYK 之间的转换
	  colortrans 255 0 0
      colortrans 0 255 255 0
	  ret list
  
  

*____________________
*-3.3.2 线 相关的代号

  help lines
  
  help line_options
  

 *-3.3.2.1 线型代号
   
   help linepatternstyle
   help linestyle
   
   palette linepalette           // ͼʾ
   
   graph query linepatternstyle  // 列示代码
   
   twoway function y=normalden(x), range(-4 4) lpattern(longdash)
   
 
 *-3.3.2.2 线宽代号
   
   help linewidthstyle
   
   graph query linewidthstyle
   
   twoway function y=normalden(x), range(-4 4) lwidth(vthick)
  
 
 *-3.3.2.3 连接方式代号
   
   help connectstyle
   
   graph query connectstyle
   
   twoway function y=normalden(x), range(-4 4) n(50) ///
                   connect(stepstair)


   
*______________________
*-3.3.3 标记符号的代号

  help symbolstyle
  palette symbolpalette 
    
  *-3.3.3.1 符号样式
   
   sysuse auto, clear
   twoway (scatter price weight if foreign,  msymbol(T))  ///
          (scatter price weight if !foreign, msymbol(dh)),  ///
          legend(label(1 "国产") label(2 "进口"))
          
   * 另一种语法格式
    sysuse sp500, clear
    twoway scatter high low date, msymbol(oh dh)
    
	
  *-3.3.3.2 符号的边界和填充
    
	* mlcolor()：边界颜色； mfcolor(): 填充颜色
    
	sysuse auto, clear
    scatter mpg weight, msymbol(O) mlcolor(green) mfcolor(yellow*0.5)

	
  *-3.3.3.3 符号代号一览
    
	help showmarkers
	
	showmarkers, over(msymbol)
	showmarkers, over(msymbol) msize(large)
	showmarkers, over(msize)   
	showmarkers, over(mcolor)    // 边界颜色
	showmarkers, over(mfcolor)   // 填充颜色
	showmarkers, over(mlcolor) mfcolor(gray)   ///
	             msize(large) mlwidth(medthick)
	showmarkers, over(mlwidth) mfcolor(gray)   ///
	             msize(large) mlcolor(navy)
	showmarkers, over(msymbol) scheme(s1mono)
    showmarkers, over(msymbol) msize(large)    ///
	             scheme(s1mono)
	
	
	
	
*______________________
*-3.3.4 文字相关的代号

  *-3.3.4.1 文字大小代号
   
    help textsizestyle
   
   
  *-3.3.4.2 文字角度代号
   
    help anglestyle
   
   
  *-3.3.4.3 文字对齐方式的代号
   
    help justificationstyle  // 左右对齐方式
    help alignmentstyle      // 上下对齐方式


*______________________
*-3.3.5 边距大小的代号
   
   help marginstyle


*---------------------关于代号的一个说明-------------------------
*  多数情况下，Stata都支持相对数值，为我们提供了一种便捷的设定方式
*  如, text("文字",size(*0.5) 
*      color(green*0.3))
*      xline(30, lwidth(*1.5))
*---------------------------------------------------------------








	

          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================
          *       -3.4- 常用图形示例
		  *                 (I)

		
*--------------------------
*-> 3.4   常用图形示例 (I)
*--------------------------

          *    ==本节目录==

          *    3.4.1 散点图
          *    3.4.2 折线图
          *    3.4.3 区域图
          *    3.4.4 钉形图
          *    3.4.5 直方图
          *    3.4.6 密度函数图
          *    3.4.7 累积分布函数图  
		    
        cd `c(sysdir_personal)'Net_course_A\A3_graph	

		

*-导言：帮助文件的使用
  
  * 各类图形的选项分为两类：`专属选项' 和 `公共选项'
  * 公共选项可以参考上面的说明进行填写
  * 专属选项通常较少，也容易填写

  help twoway bar
  help twoway lfit
  help twoway scatter


*--------------
*-3.4.1 散点图

  help twoway scatter
  
     sysuse uslifeexp2, clear
     #delimit ;
        scatter le year,
                title("图1: 散点图示例")
                subtitle("预期寿命, 美国")
                yvarlabel(预期寿命)
                xvarlabel(年份)
                note("1")
                caption("数据来源:  美国国家重要统计资料报告,
                         第5卷-第6期")
                scheme(economist);
      #delimit cr


	  
*--------------
*-3.4.2 折线图

  help line  
  
  *-注意：需要对 x 变量排序
     sysuse auto, clear
     line mpg weight
     line mpg weight, sort
     
	 
  *-一个较复杂的例子   
     
	do A3_line.do  
	 
	*-------------------------A3_line.do --------------------------
	 sysuse uslifeexp, clear
     gen diff = le_wmale - le_bmale
     label var diff "寿命差异"
     #delimit ;  
       twoway (line le_wmale year, yaxis(1 2) xaxis(1 2))
              (line le_bmale year)
              (line diff  year)
              ,
              ylabel(0 20(10)80,     gmax angle(0))
              ylabel(0(5)20, axis(2) gmin angle(0))
              xlabel(1918, axis(2)) 
              title("图2：白人和黑人预期寿命")
              subtitle("美国, 1900-1999")
              ytitle("预期寿命 (年)")
              xtitle("年份")
              ytitle("", axis(2))
              xtitle("", axis(2))
              note("数据来源:  美国国家重要统计资料报告, 第5卷-第6期"
                   "(1918 巨降: 源于1918年全国性流行感冒)",linegap(1.2))
              legend(label(1 "白人男性") label(2 "黑人男性") 
                     rows(1) size(*0.7));
     #delimit cr
	*--------------------------------------------------------------     
     
	 
	 
*--------------
*-3.4.3 区域图

   help twoway area
   
   *-事实上是折线图的变形，无非是在折线下方的区域内涂上颜色而已！
 
   sysuse gnp96, clear
   twoway line d.gnp96 date, yline(0,lc(black*0.4) lp(dash))
   twoway area d.gnp96 date
   
  * 一个相对完整的示例
    #delimit ;
     twoway area d.gnp96 date, 
                 xlabel(36(8)164, angle(45))
                 ylabel(-100(50)200, angle(0))
                 ytitle("Billions of 1996 Dollars")
                 xtitle("")
                 subtitle("Change in U.S. GNP", position(11))
                 note("Source: U.S. Department of Commerce,
                       Bureau of Economic Analysis") ;
    #delimit cr
    
    
	
*--------------
*-3.4.4 钉形图

   help twoway spike   // 简单钉形图
   help twoway rspike  // 区域钉形图
   
 *-多用于股票数据
  
    sysuse sp500, clear
    twoway spike high date
    twoway rspike high low date
    twoway (rspike hi low date) (line close date) in 1/57
               
  *-完整示例    
    
  *-e.g 1
	sysuse sp500, clear
    replace volume = volume/1000
    #delimit ;
        twoway (rspike hi low date)
               (line   close  date)
               (bar    volume date, barw(.25) yaxis(2))
                in 1/57
            , 
		    yscale(axis(1) r(900 1400))
            yscale(axis(2) r(  9   45))
            ylabel(, axis(2) grid)
            ytitle("股价 -- 最高, 最低, 收盘",place(top))
            ytitle("交易量 (百万股)", axis(2) bexpand just(left))
            xtitle(" ")
            legend(off)
            subtitle("S&P 500", margin(b+2.5))
            note("数据来源: 雅虎财经！");
    #delimit cr
	
  *-e.g 2
	sysuse sp500, clear
    replace volume = volume/10000	
	twoway (rarea high low date)           ///
	       (spike volume date, yaxis(2)),  ///
            legend(span)
	*-改进
	twoway (rarea high low date)           ///
	       (spike volume date, yaxis(2)),  ///
           legend(span)	                   ///		
           yscale(range(500 1400) axis(1)) ///  // new!
		   yscale(range(0 5) axis(2))      ///  // new!
		   ylabel(,angle(0))               /// // new!
	       ylabel(,angle(0) axis(2)) 


	
*--------------
*-3.4.5 直方图

   help histogram
   
    *-概览
      sysuse nlsw88.dta, clear
      histogram wage
      gen ln_wage = ln(wage)
      histogram ln_wage         // 对数转换后往往更符合正态分布
        
    *-图形的纵坐标
      histogram wage            // 长条的高度对应样本数占总样本的比例，
	                            // 总面积为 1
      graph save g0.gph, replace
      histogram wage, fraction  // 将长条的高度总和限制为 1
      graph save g_frac.gph, replace
      histogram wage, frequency // 纵坐标为对应的样本数，而非比例
      graph save g_freq.gph, replace
      graph combine g0.gph g_frac.gph g_freq.gph, rows(1)
      
    *-其他选项
      histogram ttl_exp, normal  // 附加正态分布曲线
      histogram wage, kdensity   // 附加密度函数曲线
      histogram wage, addlabels  // 每个长条上方附加一个表示其高度的数字
      histogram wage, by(race)
      
    *-离散变量的直方图
      histogram grade
      graph save d1, replace
      histogram grade, discrete  // 离散变量的直方图必须附加 discrete 选项
      graph save d2, replace
      graph combine d1.gph d2.gph
	  
	*-长条的显示
	  histogram wage, gap(50)
	  histogram wage, gap(90) scheme(s1mono)	  
	  histogram wage, gap(99.9) scheme(s1mono) blwidth(thick)
      
    *-分组绘制直方图
      sysuse auto, clear
      histogram mpg, percent discrete                 ///
          by(foreign, col(1) note(分组指标：汽车产地) ///
                      title("图3：不同产地汽车里数")  ///
                      subtitle("直方图")              ///
             )                                        ///
          ytitle(百分比) xtitle(汽车里数) 
    
	
    *-一个较复杂的例子     
      
	  do A3_histogram.do
 
      *-----------------A3_histogram.do----------------------
	   sysuse sp500, clear
       #delimit ;
       histogram volume, freq normal 
                 addlabels addlabopts(mlabcolor(blue))
                 xaxis(1 2)
                 ylabel(0(10)65, grid)
                 xlabel( 12321 "mean"
                          9735 "-1 s.d."
                         14907 "+1 s.d."
                          7149 "-2 s.d."
                         17493 "+2 s.d."
                         20078 "+3 s.d."
                         22664 "+4 s.d."
                        ,axis(2) grid gmax
                       )
                 subtitle("图4：S&P 500 交易量 (2001年1月-12月)")
                 ytitle(频数)
                 xtitle("交易量(千笔)") xscale(titlegap(2))
                 xtitle("", axis(2))
                 note("数据来源：雅虎！财经数据");
       #delimit cr
      *------------------------------------------------------                
     
 
 
*------------------
*-3.4.6 密度函数图
 

   *-Kernal 密度函数图
     
	 help kdensity 
	 
	 sysuse nlsw88, clear
	 kdensity wage
	 kdensity wage, normal
     
   *-把多个变量的核密度函数图绘制在一张图上
     sysuse sp500, clear
     twoway (kdensity open) (kdensity low)
     twoway (kdensity open) (kdensity high) (kdensity low) (kdensity close)
     
   *-比较不同子样本的密度函数
     sysuse auto, clear
	 kdensity weight, nograph generate(x dx)
	 kdensity weight if foreign==0, nograph generate(dx0) at(x)
	 kdensity weight if foreign==1, nograph generate(dx1) at(x)
	 label var dx  "all cars"
	 label var dx0 "Domestic cars"
	 label var dx1 "Foreign cars"	 
	 line dx dx0 dx1 x, sort lw(*2.5 *1.5 *1.5)
	 
	 *-另一种方法
	 sysuse auto, clear
	 kdensity weight              , nograph gen(p_x  d_x)
	 kdensity weight if foreign==0, nograph gen(p_x0 d_x0)
	 kdensity weight if foreign==1, nograph gen(p_x1 d_x1) 
	 label var d_x  "all cars"
	 label var d_x0 "Domestic cars"
	 label var d_x1 "Foreign cars"
	 twoway (line d_x p_x) (line d_x0 p_x0) (line d_x1 p_x1)
  
   *-附加置信区间    -akdensity- 外部命令 SJ 3(2):148--156
     sysuse auto, clear
     akdensity length, stdbands(2)
	 
	 
   *-双变量联合密度函数图  -kdens2- 外部命令
   
     help kdens2
     
	 use grunfeld, clear
     gen linv = log(invest)
     gen lmkt = log(mvalue)
     
	 kdens2 linv lmkt
     kdens2 linv lmkt, n(100)         // defaults Min(_N,50)
     kdens2 linv lmkt, xw(.5) yw(.5)  // defaults `optimal'
  
  
   *-Furthur reading:
   *   Cox, N., 2005, 
   *     Speaking Stata: Density probability plots, 
   *     Stata Journal, 5(2): 259-273.
  
  
  
*----------------------
*-3.4.7 累积分布函数图
      
  help cumul
    
  *-基本概念	
    sysuse auto, clear
    cumul price, gen(pcum)
    line pcum price, sort
    
	sort price
	list price pcum in 1/5 
	dis 1/74
	dis 3/74
	
	list price pcum in 70/74
	dis 72/74
	dis 73/74
   
  
  *-更为简洁的命令  -displot-  (外部命令)
    
	help distplot
	
	sysuse auto, clear
    distplot scatter mpg
    distplot line mpg, by(foreign)
	distplot connected mpg, trscale(ln(@))

    *-支持的图形种类
	* area bar connected dot dropline line scatter spike

      foreach t in area bar connected dot dropline line scatter spike {
        distplot `t' mpg, by(foreign)
      }

	  
  *-cdfplot- 命令 

    help cdfplot 

	sysuse auto,replace
    cdfplot length, normal
    cdfplot length, by(foreign)
    cdfplot length, by(foreign) norm saving(mygraph, replace) 
   
    *-示例：对数转换的作用
      sysuse nlsw88, clear
	  cdfplot wage, normal
	  gen ln_wage = ln(wage)
	  cdfplot ln_wage, normal

      
   *-Furthur reading:
   *  Cox, N., 2004, 
   *    Speaking stata: Graphing distributions, 
   *    STATA JOURNAL, 4(1): 66-88.                   
   *  Cox, N., 2004, 
   *    Speaking Stata: Graphing categorical and compositional data, 
   *    STATA JOURNAL, 4(1): 190-215.
               
               
                          





	

          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *           ::第一部分::
          *            Stata 操作
          *       =====================
          *         第三讲  Stata绘图
          *       =====================
          *       -3.4- 常用图形示例
		  *                 (II)
		
*--------------------------
*-> 3.4   常用图形示例 (II)
*--------------------------
		  
          *    ==本节目录==

          *    3.4.8  线性/非线性 拟合图
          *    3.4.9  矩阵图: 显示变量间的相关性
          *    3.4.10 柱状图 
          *           3.4.10.1 一维柱状图
          *           3.4.10.2 二维柱状图 
          *    3.4.11 点 图
          *    3.4.12 函数图
          *    3.4.13 合图示例
          *    3.4.14 三维图形 
          *    3.4.15 地 图 	  
		  
		  
        cd `c(sysdir_personal)'Net_course_A\A3_graph	
		
		
*--------------------------
*-3.4.8 线性/非线性 拟合图
 
  help twoway lfit
  help twoway qfit
 
  *-简单示例
    sysuse auto, clear
    scatter mpg weight || lfit mpg weight
    scatter mpg weight || lfit mpg weight, by(foreign, total row(1))
   
   
  *-附加置信区间
    help twoway lfitci
    help twoway qfitci
   
    twoway (lfitci mpg wei, stdf) (scatter mpg wei)  // 线性拟合的置信区间
   
    twoway (scatter mpg wei) (lfitci mpg wei, stdf)  // 图层的概念
   
    twoway (qfitci mpg wei, stdf) (scatter mpg wei)  // 非线性拟合
   
    twoway (qfitci mpg wei, stdf level(99) color(yellow)) ///
           (qfitci mpg wei, stdf level(90))               ///
           (scatter mpg wei)                              // 置信水准



*----------------------------------
*-3.4.9 矩阵图: 显示变量间的相关性
  
  help graph matrix
  
  sysuse auto, clear
  graph matrix mpg weight length
  pwcorr mpg weight length
  graph matrix mpg weight length,  ///
         diag("mpg(汽车里数)" . "length (汽车长度)")
  
  *-整体缩放
    graph matrix mpg weight length, scale(1.5)
    graph matrix mpg weight length, scale(0.8)
  
  *-图标
    sysuse citytemp, clear
	sum
    graph matrix heatdd-tempjuly
    gr mat       heatdd-tempjuly, msymbol(point)
    help symbolstyle
     
  *-半边显示
    gr mat heatdd-tempjuly, ms(p) half
     
  *-坐标刻度和标签
    gr mat heatdd-tempjuly, ms(p) half ///
	       maxes(ylab(#4) xlab(#4))

  *-附加网格线
    gr mat heatdd-tempjuly, ms(p) half ///
	       maxes(ylab(#4, grid) xlab(#4, grid))

	

*----------------
*-3.4.10 柱状图 


  *-3.4.10.1 一维柱状图  (参见第二讲)
  
  help graph bar
  
  *-命令格式1：
  *   graph bar yvars ... 
 
  *-命令格式2：
  *   graph bar (mean) varlist, over(g1) over(g2)... [other options]
  
  *-基本用法: graph bar yvars ...  
    sysuse nlsw88, clear
	graph bar wage, over(race)
  
  
  *-组变量的设定
  
    sysuse nlsw88, clear
    
    graph bar (mean) wage, over(race) scheme(s1mono) 
 
    graph bar (mean) wage, over(smsa) over(married) over(collgrad) 

    #delimit ;
     graph bar (mean) wage, over(smsa) over(married) over(collgrad)
               title("Average Hourly Wage, 1988, Women Aged 34-46")
               subtitle("by College Graduation, Marital Status,
                          and SMSA residence")
                note("Source:  1988 data from NLS, U.S. Dept. of Labor,
                      Bureau of Labor Statistics");
    #delimit cr

  *-柱体的样式
    help barlook_options
	
    graph bar (mean) wage hours, over(race) over(married) ///
                     scheme(s1mono)      ///
                     bar(1, bstyle(p1))  ///
                     bar(2, bstyle(p6))
           
  *-柱体的标签
    help blabel_option
    
    graph bar (mean) wage, over(race) over(married)      ///
           blabel(bar, position(outside) format(%3.1f) color(green))
           
    graph hbar (mean) wage, over(industry) over(married) ///
           blabel(bar, position(outside) format(%3.1f)   ///
                       color(blue) size(vsmall))
  
  *-累加柱体
    sysuse educ99gdp, clear
    graph hbar (mean) public private, over(country)
    graph hbar (mean) public private, over(country) stack 
     
    *-完整示例
	  generate total = private + public
      #delimit ;
        graph hbar  public private, stack 
          over(country, sort(total) descending)
          blabel(bar, posi(center) color(white) format(%3.1f))
          title( "Spending on tertiary education as % of GDP, 1999",
                  span pos(11))
          subtitle(" ")
          note("Source:  OECD, Education at a Glance 2002", span) ;
      #delimit cr
	  
	*-进一步美化
	  generate frac = private/(private + public)
	  #delimit ;
        graph hbar  public private, stack percent
          over(country, sort(frac) descending) 
		  blabel(bar, posi(center) color(white) format(%3.1f))
          title("Public and private spending on tertiary education, 1999",
                 span pos(11) )
          subtitle(" ")
          note("Source: OECD, Education at a Glance 2002", span);
      #delimit cr 
	  
	  
  *-重叠柱体
    sysuse nlsw88, clear
    graph bar (mean) hours wage, over(race) over(married) 
    graph bar (mean) hours wage, over(race) over(married) bargap(-30)
   
  *-图形的比例
    sysuse nlsw88, clear
    graph hbar wage, over(ind, sort(1)) over(collgrad)
    graph hbar wage, over(ind, sort(1)) over(collgrad) ///
                     ysize(4) xsize(8)

					 
  *-3.4.10.2 二维柱状图 		
    
	help twoway bar
	
	sysuse sp500, clear
	
	twoway bar change date in 1/100
	twoway bar change date in 1/100, barwidth(0.6)
	
	
	sysuse pop2000, clear
    replace maletotal = -maletotal
    twoway  bar maletotal agegrp, horizontal ||  ///
            bar  femtotal agegrp, horizontal

   *-一个较复杂的例子
    sysuse pop2000, clear
    replace maletotal = -maletotal/1e+6
    replace femtotal = femtotal/1e+6
    gen zero = 0
    #delimit ;
     twoway
         (bar maletotal agegrp, horizontal xvarlab(Males))
         (bar  femtotal agegrp, horizontal xvarlab(Females))
         (scatter  agegrp zero, mlabel(agegrp) mlabcolor(black) msymbol(i))
        , xtitle("Population in millions") ytitle("")
          plotregion(style(none))     
          ysca(noline) ylabel(none)    
          xsca(noline titlegap(-3.5))  
          xlabel(-12 "12" -10 "10" -8 "8" -6 "6" -4 "4" 4(2)12, 
		         tlength(0) grid gmin gmax)
          legend(label(1 Males) label(2 Females)) 
		  legend(order(1 2))
          title("US Male and Female Population by Age, 2000")
          note("Source: U.S. Census Bureau, Census 2000")
	    ;
     #delimit cr

    *-解析：
	  scatter agegrp zero
	  scatter agegrp zero, mlabel(agegrp) mlabcolor(black) msymbol(i)
  
  

*-------------
*-3.4.11 点图

   help graph dot  
  
   *-事实上是柱状图的另一种表示方法，比较适合中文投稿，省墨！

   sysuse nlsw88, clear
   graph dot wage, over(occ) by(collgrad)
   graph dot wage, over(occ,sort(1)) by(collgrad)
  
  *-一个相对完整的示例
    sysuse nlsw88, clear
    #delimit ;
    graph dot wage, over(occ, sort(1))
          by(collgrad,
             title("Average hourly wage, 1988, women aged 34-46", span)
             subtitle(" ")
             note("Source:  1988 data from NLS, U.S. Dept. of Labor, 
Bureau of Labor Statistics", span)
            );
    #delimit cr

	

*---------------
*-3.4.12 函数图

   help twoway function
   
   twoway function y=normalden(x), range(-4 4) n(15) 
   
   twoway function y=normalden(x), range(-4 4) dropline(-1.96 1.96)
   
   twoway function y=normalden(x), range(-4 4) xline(-1.96 1.96)
     
   twoway function y=normalden(x), range(-4 4) dropline(-1.96 1.96) horizon

   twoway function y=exp(-x/6)*sin(x), range(0 12.57)  ///
           xlabel(0 3.14 "pi" 6.28 "2 pi" 9.42 "3 pi" 12.57 "4 pi") ///
           yline(0, lstyle(foreground)) dropline(1.48) ///
           plotregion(style(none))                     ///
           xsca(noline) ytitle(" ") xtitle(" ")

   sysuse sp500, clear
   twoway (scatter open close, msize(*.35) mcolor(*.8))  ///
          (function y=x, range(close) yvarlab("y=x") clwidth(*1.5))
 
	 
   *-综合示例
   
     do A3_function_ci90.do
	 
   *-------------------------A3_function_ci90.do------------------------
     #delimit ;
     twoway 
         function y=normden(x), range(-4 -1.96) color(gs12) recast(area)
      || function y=normden(x), range(1.96 4)   color(gs12) recast(area)
      || function y=normden(x), range(-1.96 -1.64) color(green) recast(area)
      || function y=normden(x), range(1.64 1.96)   color(green) recast(area)
      || function y=normden(x), range(-4 4) lstyle(foreground)
      ||,
         plotregion(style(none))
         legend(off)
         xlabel(-4 "-4 sd" -3 "-3 sd" -2 "-2 sd" -1 "-1 sd" 0 "mean"
                 1  "1 sd"  2  "2 sd"  3  "3 sd"  4  "4 sd"
                , grid gmin gmax)
         xtitle("");
     #delimit cr   
   *--------------------------------------------------------------------
   
   
   
   
*-----------------
*-3.4.13 合图示例    -graph combine-

  *-例 1：
 
   do A3_eg1.do
   
   *--------------------------A3_eg1.do---------------------------
    sysuse lifeexp, clear

    gen loggnp = log10(gnppc)
    label var loggnp "人均GNP(Log10)"
    label var lexp   "期望寿命"

    scatter lexp loggnp, ysca(alt titlegap(1.5))   ///
                     xsca(alt titlegap(0.8)) ///
                     xlabel(, grid gmax)     ///
                     ylabel(,angle(0))  ///
                     saving(yx, replace)
    histogram lexp, percent xsca(alt reverse titlegap(0.8)) ///
                horiz xtitle(占比) ylabel(,angle(0)) ///
                saving(hy, replace)
    histogram loggnp, percent ysca(alt reverse titlegap(1.5))  ///
                  ytitle(占比) ylabel(,nogrid angle(0)) ///
                  xscale(titlegap(2)) xlabel(,grid gmax) ///
                  saving(hx, replace)

    graph combine hy.gph yx.gph hx.gph, ///
           hole(3) imargin(0 0 0 0) ///
           graphregion(margin(l=12 r=12)) ///
           title("图1：期望寿命与人均 GNP") ///
           note("资料来源:  世界银行小组，1988")
   *--------------------------------------------------------------
 
 
   *-进一步美化
   *--------------------------A3_eg1.do----modify-----------------
    sysuse lifeexp, clear

    gen loggnp = log10(gnppc)
    label var loggnp "人均GNP(Log10)"
    label var lexp   "期望寿命"

    scatter lexp loggnp, ysca(alt titlegap(1.5))   ///
                     xsca(alt titlegap(0.8)) ///
                     xlabel(, grid gmax)     ///
                     ylabel(,angle(0))       ///
                     saving(yx, replace)     
    histogram lexp, percent xsca(alt reverse titlegap(0.8)) ///
                horiz xtitle(占比) ylabel(,angle(0)) ///
                saving(hy, replace)                  ///
					 fxsize(25)        // new! fy
    histogram loggnp, percent ysca(alt reverse titlegap(1.5))  ///
                  ytitle(占比) ylabel(,nogrid angle(0))  ///
                  xscale(titlegap(2)) xlabel(,grid gmax) ///
                  saving(hx, replace)                    ///
					 fysize(25)        // new! fx

    graph combine hy.gph yx.gph hx.gph,      ///
           hole(3) imargin(0 0 0 0)          ///
           graphregion(margin(l=12 r=12))    ///
           title("图1：期望寿命与人均 GNP" ) ///
		   subtitle(" ", size(*0.5))         ///  new! a blank line  
           note("资料来源:  世界银行小组，1988")
   *--------------------------------------------------------------   
   *-解释：
   * fxsize(#)  仅将 x 轴方向缩小为原始尺寸的 25%
   * fysize(#)  仅将 y 轴方向缩小为原始尺寸的 25%


  *-例 2：
    sysuse sp500, clear
	replace volume = volume/1000
    twoway rarea high low date, name(hilo, replace)
	twoway spike volume date, name(vol, replace)
	graph combine hilo vol
	
	*-美化 I
	  graph combine hilo vol, cols(1)
	
	*-美化 II
	  twoway rarea high low date,   ///
	         xscale(off) name(hilo, replace)  // new! off
	  graph combine hilo vol, cols(1)
	  graph combine hilo vol, cols(1) imargin(b=1 t=1)
	  
	*-美化 III
	  twoway spike volume date, name(vol, replace) ///
	         ylabel(5 15 25) fysize(25)           // new! fysize
	  graph combine hilo vol, cols(1) imargin(b=1 t=1)

	  
	  
*-----------------
*-3.4.14 三维图形    -surface- 外部命令
	  
    clear
    set obs 900
    gen x = int((_n - mod(_n-1,30) -1 ) /30 )
    gen y = mod(_n-1,30)
    gen z = normalden(x,10,3)*normalden(y,15,5)
    surface x y z



*-----------------
*-3.4.15  地 图 

  *-tmap- 命令
  
    *-参考资料
      
	 *-查看最新资料
	   findit tmap
		
	 *-说明文档和范例
	   *-SJ 4(4):361-378
       view browse http://www.stata.com/support/faqs/graphics/tmap.html 
       shellout tmap.mht             // 范例网页 
	   shellout tmap2-userguide.pdf  // -tmap- 的说明书
		
	 *-相关辅助命令	
       doedit usmaps.do  // module to provide US state map coordinates for tmap
       findit usmaps2    // module to provide US county map coordinates for tmap

   *-范例
    
	use Us-Database.dta, clear
    
	tmap choropleth murder, id(id) map(Us-Coordinates.dta)
    
	tmap cho murder if conterminous, id(id) map(Us-Coordinates.dta)
    
	tmap cho murder if conterminous, id(id) ocolor(white) ///
	     map(Us-Coordinates.dta) palette(Blues)           ///
         title(`"`"Murders per 100,000 population"'"')    ///
		 subtitle("United States 1994")
		 
    tmap propsymbol murder if conterminous,               ///
	     x(x_coord) y(y_coord) map(Us48-Coordinates.dta)  ///
         sshape(o) scolor(edkblue) fcolor(eltblue)        ///
		 title(`"`"Murders per 100,000 population"'"')    ///
		 subtitle("United States 1994")
		 
    tmap deviation murder if conterminous,                ///
	     x(x_coord) y(y_coord) map(Us48-Coordinates.dta)  ///
         sshape(s) scolor(sienna) fcolor(eggshell)        ///
		 title(`"`"Murders per 100,000 population"'"')    ///
		 subtitle("United States 1994")
		 
    tmap label label if conterminous,        ///
	     x(x) y(y) map(Us48-Coordinates.dta) ///
		 lc(white) ls(0.9) fc(emerald)

    use MilanoPolice-Database.dta, clear
    tmap dot, x(x) y(y) map(MilanoOutline-Coordinates.dta) ///
	     by(type) marker(both) sshape(s d)                 ///
		 title("Location of police stations")              ///
		 subtitle("Milano 2004") legtitle("Police force",  ///
         size(*0.7)) legbox(lc(black))

 
  *-spmap- 命令
    
	*-使用说明：

      view browse http://www.stata.com/support/faqs/graphics/spmap.html 

      shellout spmap_intro.mht 
	  
	  help spmap

      use "Italy-RegionsData.dta", clear
      spmap relig1 using "Italy-RegionsCoordinates.dta", id(id)  ///
        clnumber(20) fc(Greens2) oc(white ..) osize(medthin ..)  ///
        title("Pct. Catholics without reservations", size(*0.8)) ///
        subtitle("Italy, 1994-98" " ", size(*0.8))               ///
        legstyle(3) legend(ring(1) position(3))                  ///
        plotregion(icolor(stone)) graphregion(icolor(stone))
  
      use "Italy-RegionsData.dta", clear
      spmap relig1 using "Italy-RegionsCoordinates.dta", id(id)  ///
        clmethod(stdev) clnumber(5)                              ///
        title("Pct. Catholics without reservations",size(*0.8))  ///
        subtitle("Italy, 1994-98" " ", size(*0.8)) area(pop98)   ///
        note(" "                                                 ///
        "NOTE: Region size proportional to population", size(*0.75))

 
  *-中国地图
  
    findit china map
  
    use china_label,clear
    tab name
    replace name = subinstr(name, "ʡ", "", .)
    replace name = subinstr(name, "市", "", .)
    replace name = subinstr(name, "回族自治区", "", .)
    replace name = subinstr(name, "壮族自治区", "", .)
    replace name = subinstr(name, "特别行政区", "", .)
    replace name = subinstr(name, "自治区", "", .)
    replace name = subinstr(name, "维吾尔", "", .)
    tab name
    gen x = uniform()
    format x %9.3g
  
    spmap x using "china_map.dta", id(id)                  /// 
      label(label(name)                                    ///
        xcoord(x_coord) ycoord(y_coord) size(*.9))         ///
	  plotregion(icolor(stone)) graphregion(icolor(stone)) ///
      clnumber(8) fc(Greens2) oc(white ..) osize(medthin ..) 
  
  
  *-其它命令
  
    findit spgrid
    doedit spgrid_example.do  // 构建地图网格

	
	

*------------
*-3.5  结语

  *-学会帮助画天下！
  
  *-一本有用的书
    
	* Mitchell, M. 
	*   A visual guide to Stata graphics. 
	*   Stata Press, 2008.
	
	view browse   ///
	     "http://www.stata.com/support/faqs/graphics/gph/statagraphs.html"



*-练习：一个尚未搞定的圆圈

    twoway ( function y = sqrt(1-x^2),        ///
	         plotregion(margin(0))            ///
			 range(-1.5 1.5) lc(blue) )       ///
           ( function y = -sqrt(1-x^2),       ///
		     plotregion(margin(0))            ///
			 range(-1.5 1.5) lc(blue) )       ///
		  ,                                   ///
             ysize(2) xsize(2)                ///
			 ylabel(-1.5 1.5) xlabel(-1.5 1.5)

   *-方案 1：
     twoway ( function y = sqrt(1-(x-1)^2),   ///
	          plotregion(margin(0))           ///
			  range(-0 2) lc(blue) )          ///
            ( function y =-sqrt(1-(x-1)^2),   ///
			  plotregion(margin(0))           ///
			  range(0 2) lc(blue))            ///
		  ,                                   ///
              ysize(3) xsize(3)               ///
			  ylabel(-1.5 1.5) xlabel(-1 2)

   *-方案 2：
     clear
     set obs 100000 
     gen z = invnorm(uniform())
     gen y = sin(z)
     gen x = cos(z)
     twoway (scatter y x), ysize(4) xsize(4)  
     twoway (scatter y x, msymbol(smcircle)), ysize(4) xsize(4)   



*-----------------------------OVER------------------------------------------
