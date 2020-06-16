



          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *              ::第一部分::
          *               Stata 操作
          *       ==========================
          *         第五讲  STATA 编程初步
          *       ==========================
          

    *cd D:\stata11\ado\personal\Net_course_A\A5_prog
     cd `c(sysdir_personal)'Net_course_A\A5_prog


*--------------------
*     本讲目录
*--------------------
* 5.1  stata程序简介
* 5.2  单值(scalar)
* 5.3  暂元
* 5.4  其它暂时性物件
* 5.5  控制语句
* 5.6  引用 Stata 命令的返回值





          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *              ::第一部分::
          *               Stata 操作
          *       ==========================
          *         第五讲  STATA 编程初步
          *       ==========================
          *          -5.1- stata程序简介
          
          
*---------------------
*-> 5.1 stata程序简介
*---------------------

       *   ==本节目录==
              
       *   5.1.1 Stata 程序的基本结构
       *   5.1.2 程序的执行
       *       5.1.2.1 第一种执行方式：ado 文档执行方式
       *       5.1.2.2 第二种执行方式：run(Ctrl+R) 
       *   5.1.3 程序的管理
       *   5.1.4 避免列印过多的结果
       *   5.1.5 避免程序因错误而中断
       *   5.1.6 避免数据在程序执行过后有所变动


*--------------------------
*-5.1.1 Stata 程序的基本结构

     program define myprog
     version 8.0
        dis "I Iove This Game!"
     end

  * 注：保存为 myprog.ado (文件的扩展名为 `.ado')
    

*--------------------
*-5.1.2  程序的执行

  *-5.1.2.1  第一种执行方式：ado 文档执行方式
    
    myprog
    
    adopath + D:\stata10\ado\personal\Net_course_A\A5_prog
 
    myprog
	
    
    *-说明：
    *   (1) 这种执行方式与stata官方命令完全相同；
    *   (2) 对于需要经常执行的命令，采用这种方式很好；  
 
    *-建议：
    *   (1) 把自己编写的程序统一存放于 ……\personal\_Myado下；
    *   (2) 并在profile.do文件中定义如下
            adopath + D:\stata11\ado\personal\_Myado
    *   (3) 该文件夹下可进一步设定 a-z 等子文件夹，
	*       存放相应字母开头的文件
    *   (4) 对于临时的 ado 文档，可以采用 -adopath- 命令定义存放地址
 

  *-5.1.2.2  第二种执行方式：run 
 
    *-Step1: 在内存中定义程序；
      *具体方法：选中, 点击`Execute Quietly(run)'键 (快捷键：Ctrl+R)
     
    *-Step2：执行程序(方式同前)
    
    *-示例：
   
      program define mynike
        version 8.0
        dis in red "Just do it! "
      end  
       
      mynike


*------------------
*-5.1.3 程序的管理

  doedit myprog.ado     // 修改程序
  program dir           // 查找内存中的程序
  program list myprog   // 列示程序代码
  program list _all
  program drop mynike   // 删除内存中调入的程序，但不影响硬盘中存储的文件 
  mynike                // 错误信息，因为程序已不在内存中
  
   program define mynike
     version 8.0
     dis in red "Just do it! hahaha! "
   end  
       
   mynike
   
   *-说明：
   *   (1) 修改程序后，必须先将旧版本从内存中清除(program drop)，
   *       然后再调入新定义的程序
   *   (2) 更为合理的定义方法：
       
       capture program drop mynike        // 新增语句
       program define mynike
         version 8.0
         dis in red "Just do it! ha   ha! "  // 请修改后执行
       end  
          
       mynike


*--------------------------
*-5.1.4 避免列印过多的结果         -quietly-

  sysuse auto, clear
  quietly sum price, meanonly   // 静悄悄地做，单行
  scalar avg = r(mean)
  dis avg

  quietly{                      // 静悄悄地做，整段
     sum price if foreign == 0
     scalar avg1 = r(mean)
     sum price if foreign == 1
     scalar avg2 = r(mean)
     scalar diff = avg2 - avg1
  }
  dis diff


*----------------------------
*-5.1.5 避免程序因错误而中断     -capture-

  sysuse auto, clear
  drop prcie              // 错误!   声张，停止
             
  capture drop prcie      // 错误! 不声张，不停止
  sum mpg
  dis _rc                 // -help _rc-
  
  capture drop price      // 正确! 不声张
  dis _rc                 // 注意该值的变化
  
  sysuse auto, clear
  cap noisily drop prcie  // 错误! 声张,但不停止
  sum mpg
  
  *- 示例：
       
       cap program drop varyes
       program define varyes
       version 10.0
         args varname         // 设定输入项
         cap sum `varname'
         if _rc ~= 0{
           dis as error "错误：未发现变量 `varname'"
           exit _rc 
         }  
       end
      
       varyes pp 
       varyes weight
    
    
  *- 特别说明：
     * capture 后的任何一个 argument 错误，则所有 args 都不会被执行
     
     sysuse auto, clear
     order price weight length
     
     cap drop price weigth length   // Q:哪些变量会被 drop ？
     
     *-正确方法：
       cap drop price 
       cap drop weigth
       cap drop length
        
     *-或使用 -dropvars-
       sysuse auto, clear
       order price weight length
       dropvars price weigth length


*-------------------------------------
*-5.1.6 避免数据在程序执行过后有所变动     -preserve-

  sysuse auto, clear
    preserve                      // 备份当前状态 s1
      keep price weight foreign
      drop if price > 10000
      sum 
      save auto_new.dta, replace
    restore                       // 恢复到状态 s1
  sum  

  use auto_new.dta,clear
  
  *-说明：
    * (1) 多数情况下，我们改动资料都是为了得到特定的结果；
    * (2) 在 preserve 和 restore 之间对资料进行的任何修改都无法保留；
    * (3) preserve 和 restore 不可“嵌套”使用
	*     stata11 提供了"嵌套"功能，参见
	
	      help snapshot
	     

  *-实例：上市公司资本结构影响因素分析
  
    *-数据
      use xtcs2, clear
      tsset code year
      xtdes                          // unbalance panel data
	  
    * 基本模型：非平行面板分析结果
      xtreg tl size-tobin, fe
      est store fe_unb
	  
    * 稳健性检验：平行面板回归结果
      preserve
         xtbalance, range(1998 2004) // 处理为平行面板
         xtreg tl size-tobin, fe
         est store fe_bal
      restore
	  
    * 随机效应模型(针对非平行面板)
      xtreg tl size-tobin, re
      est store re_unb
	  
    * 结果汇总
      esttab fe_unb fe_bal re_unb, nogap stat(N N_g)
    
    

	
	
	
	

          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *              ::第一部分::
          *               Stata 操作
          *       ==========================
          *         第五讲  STATA 编程初步
          *       ==========================
          *          -5.2-  单值(scalar)
          *          -5.3-  暂  元
          *          -5.4-  其它暂时性物件          
          
          
*---------------------
*-> 5.2  单值(scalar)
*---------------------

              *     ==本节目录==

              *     5.2.1 存放数值
              *     5.2.1 存放数值
              *     5.2.2 存放字符串
              *     5.2.3 执行命令后的单值结果
              *     5.2.4 单值的管理 
              
  scalar a = 3
  scalar b = ln(a) + (3^4.2)/exp(2)
  dis a
  dis b


*-------------------  
*-5.2.2  存放字符串 

  scalar c = .a
  dis c
  scalar s1 = "hello, Arlion"
  scalar s2 = substr(s1,1,5)   // 单值的引用很简单
  dis s1
  dis s2

* display 命令还是一个简单的计算器
  dis       ln(3) + (3^4.2)/exp(2)
  dis %6.2f ln(3) + (3^4.2)/exp(2)

* 标示出变量的特定观察值
  sysuse auto,clear
  dis price[3]
   list price in 1/3
  sort price 
  gen pmax = price[_N]
   list pmax in 1/20
   sum price


*----------------------------- 
*-5.2.3  执行命令后的单值结果

  sum price 
  return list
    dis r(N)
  scalar range = r(max) - r(min)
    dis range
  gen qq = r(sd)
    list qq in 1/10
    
  *-示例：求取 mean(price) 的标准误
  
    *- 公式： s.e.(mean) = s.d.(price)/sqrt(N)
	
    sysuse auto, clear  
    sum price          
    scalar se_price = r(sd)/sqrt(r(N))
    dis "sd(price) = "  r(sd)
    dis "se(price) = "  se_price
	
	*-用途：t 检验
	  scalar t_value = r(mean) / se_price
	  dis t_value
	  
	*-stata t 检验命令(验证)
	  ttest price=0
 
      
*------------------- 
*-5.2.4  单值的管理 

  scalar dir
    scalar list
  scalar drop a
    scalar list
  scalar drop _all
    scalar list


          
          
*---------------------
*-> 5.3    暂  元
*---------------------

      *   ==本节目录==
      
      *   5.3.1 暂元的定义和引用
      *         5.3.1.1 赞元的基本功能
      *         5.3.1.2 数学运算符的处理
      *         5.3.1.3  复合双引号：`"  "'
      *         5.3.1.4 暂元中的暂元
      *         5.3.1.5 暂元引用机制的简化 
      *   5.3.2 全局暂元
      *   5.3.3 暂元的管理


*-------------------------
*-5.3.1 暂元的定义和引用

  *-5.3.1.1 暂元的基本功能
  
    *-存放数字
      local a = 5
      dis `a'
      
      local b = `a' + 7
      dis `b'
  
    *-存放文字
      local name1  "Arlion: "
      dis "`name1'"
      
      local name2  中山大学 岭南学院
      dis "`name2'"
      
      local name3  `name1'`name2'
      dis "`name3'"
  
    *-存放变量名称
      sysuse auto, clear
      local varlist  price weight rep78 length
      sum `varlist'
      des `varlist'
  
      dis `varlist'   // 列印各变量的第一个观察值 
      dis price weight rep78 length
      list price weight rep78 length in 1/1
      dis "`varlist'" // 列印变量名称 
  
  
  *-5.3.1.2  数学运算符的处理
    
    local a "2+2"
    dis  `a'
    dis "`a'"
    
    local b = 2+2  // 与上面的定义有何差异?
    dis  `b'
    dis "`b'"
  
  
  *-5.3.1.3  复合双引号：`"  "'
  
    *-适用于文字中包含 `' 和 "" 的情形
      local tt  John's "car"
      dis "`tt'"              // 错误方式 
      dis "John's " car ""
      local tt  John's "car"  // 正确方式 
      dis `" `tt' "'  
  
  
  *-5.3.1.4  暂元中的暂元
   
     local a1 = 2
     local a2 "var"
     local a3 = 2*`a1'
     local a4 `a`a1''
     local `a2'`a1' = 2*`a3'
     local `a`a3'' "``a`a1''2'"  // 从第一个完整的 ` ' 开始分析 
     
     dis  `a1'
     dis "`a2'"  
     dis  `a3'          // 4 
     dis "`a4'"         // 暂元 a2 中的内容 
     dis ``a2'`a1''     // 8 
     dis "`a`a3''"      // ? 
     dis "``a`a3'''"    // 8 
 

  *-5.3.1.5  暂元引用机制的简化
  
    *-数学运算式的简化
        sysuse auto, clear
        local i = 19
        local j = int(sqrt(`i'))
        dis `j'
        dis price[`j']
      *-等价于：
        local i = 19
        dis price[`=int(sqrt(`i'))']   // price`=j'  
      *-验证
        list price in 1/5 
  
    *-逻辑运算的简化
      gen price1 = price if foreign==1
      gen price0 = price if foreign==0
      local i = 0
      sum price`=(`i'>0)'
  
    *-暂元内数值的递增和递减
      local i = `i' + 1
      local i++       // 执行运算`之后' 加 1  
      local ++i       // 执行运算`之前' 加 1  
      
      local j = `j' - 1
      local j--
      local --j
      
     * e.g.
       local i = 1
         dis `i++'
         dis `i'
       local i = 1
         dis `++i'
         dis `i'


*----------------------
*-5.3.2  全局暂元

  *- 定义和引用方式
     global aa "This is my first program!"      
     dis "$aa"

     global x1 = 5
     global x2 = 2^$x1
     dis $x2
   
  *- 示例：  
     sysuse nlsw88, clear
     global option ", vce(bootstrap, reps(50))"  // 公共选项
     global reg    "regress"                     // 估计方法
   
     local x1 "hours ttl_exp"
     $reg wage `x1' $option
     est store m1
   
     local x2 "hours ttl_exp married union"
     $reg wage `x1' $option    // `x1' 中的内容个已经失效
     $reg wage `x2' $option
     est store m2
   
     esttab m1 m2, nogap
   

*----------------------
*-5.3.3  暂元的管理

    macro list
    macro dir
    macro drop x2
    macro dir x2
    macro dir aa


          
*-----------------------
*-> 5.4  其它暂时性物件
*-----------------------

      *   ==本节目录==

      *   5.4.1 暂时性变量
      *   5.4.2 暂时性矩阵和暂时性单值
      *   5.4.3 暂时性文件


*-----------------
*-5.4.1 暂时性变量      -tempvar-
  
  sysuse nlsw88, clear
  tempvar x1 x2
  gen `x1' = hours^2
  gen `x2' = ln(wage)
  sum `x1' `x2'
  
  * 暂时性变量的名称可与永久性变量同名，因为二者的引用方法有别
  
  *---------------一个实例-------------------
    cap program drop mysum
    program define mysum
     version 8.0
     args var                 // 输入项 help args  
     
     tempvar x1 x2            // 定义两个暂时性变量
     gen `x1' = sqrt(`var')
     gen `x2' = ln(`var')
     
     dis in y "The summary of `var' is: " 
        sum `var'
     dis _n in y "The summary of sqrt(`var') is:"
        sum `x1'
     dis _n in y "The summary of ln(`var') is:"
        sum `x2'
     
    end
  *------------------------------------------
    
    sysuse nlsw88, clear
    mysum wage


*------------------------------
*-5.4.2 暂时性矩阵和暂时性单值       -tempname-
  
  local j = 7
  tempname mymat        // 定义暂时性矩阵
  mat `mymat' = I(`j')  // 引用方式
  mat list `mymat'

  *---------------一个实例---------------
  * 求取一个矩阵各行的和
    mat a = J(4,4,1) + I(4)
    mat a[3,2] = 9
    tempname one rowsum
    local c = colsof(a)      // 返回矩阵 a 的列数
    mat `one' = J(`c',1,1)   // 定义一个 cx1 的列向量
    mat `rowsum' = a * `one' // 求和 
    mat list a
    mat list `one'
    mat list `rowsum'
  *--------------------------------------
    
  *-练习：如何求取各行的算术平均值和加权平均值？

  
  *---------------------封装为程序----------------------
    *! 求取给定矩阵的各行之和和各列之和 
    cap program drop mat_sum
    program define mat_sum
    version 10
      args matname
      tempname one rowsum colsum
      local c = colsof(`matname') 
      mat `one' = J(`c',1,1)      // (1)
      mat `rowsum' = `matname' * `one'     
      dis in g _n "矩阵 `matname' 的" in w " 各行加总为："
      mat list `rowsum', noheader nonames
      
      local c = rowsof(`matname') 
      mat `one' = J(1,`c',1)      // (2) 重复利用 one 这个空盒子，比较"环保"
      mat `colsum' = `one' * `matname'      
      dis in g _n "矩阵 `matname' 的" in w " 各列加总为："
      mat list `colsum', noheader nonames      
    end
    exit
  *----------------------------------------------------
  *- 语句可精简: mat `one' = J(`=colsof(`matname')',1,1) 
   
    mat list a
    mat_sum a
    
    mat b = (-1.3, 2.6 \ 3.89, 0.42 \ 50.1, -0.634)
    mat list b
    mat_sum b
    

  * 关于暂时性单值的两点说明：
    * (1) 可以将其视为 1*1 暂时性矩阵
    * (2) 尽量避免暂时性单值的使用，而用暂元替代之
    
    

*------------------
*-5.4.3 暂时性文件      -tempfile-

  *-定义： tempfile file1
  *-调用： use "`file1'"
  
  *---------------------- 一个实例 -------------------------
  * 数据：沪市的7家公司财务数据
          use A5_tempfile1.dta, clear
          list, sepby(id)
  * 任务：产生一个新的公司代码变量,值为：1,2,3 
  * 思路：应用 _n 和 egen 命令
          keep id
          duplicates drop 
          gen id_new = _n
          list, sep(0)
          
  * 具体处理过程：        
    use A5_tempfile1.dta, clear
    preserve                     // 备份数据，以便抽取 id
      keep id
      duplicates drop
      sort id
      gen id_new = _n
        list 
      tempfile id_data           // 声明暂时性文件 id_data
      sort id
      save "`id_data'", replace  // 存储数据至暂时性文件
    restore                      // 抽取 id 完成，恢复原数据
      sort id year
      merge id using "`id_data'" // 将新的 id 合并到原始数据中
      sort id_new year

    order id id_new year
    list,sepby(id)
    tsset id_new year            // 使用新 id 标示 panel
    xtdes
  *----------------------------------------------------------

  *-一个简洁的处理方法：
    use A5_tempfile1.dta, clear
    xtset id year
    egen id_new = group(id)
    list, sepby(id)
  


    
	
	


          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *              ::第一部分::
          *               Stata 操作
          *       ==========================
          *         第五讲  STATA 编程初步
          *       ==========================
          *            -5.5-  循环语句

    cd `c(sysdir_personal)'Net_course_A\A5_prog
	
*---------------------
*-> 5.5   循环语句
*---------------------

      *   ==本节目录==
      
      *   5.5.1 条件循环：while 语句
      *   5.5.2 forvalues 语句         
      *   5.5.3 foreach 语句 

      

*          本节命令
*-----------------------------
* while, forvalues, foreach 
*-----------------------------


*----------------
*-5.5.1  循环语句

  *-5.5.1.1  条件循环：while 语句
    
     local j = 0
     while `j'<5{
       dis in y _s(10) `j'
       local j = `j'+1
     }
    
   *-或
       
     local j = 0
     while `j'<5{
       dis in y _s(10) `j++'
     }
    
   *___________________________________ 
   *-示例: 采用数值法求取函数的极小值
           
     twoway function y = 0.2*exp(x) - ln(x^2) + 3, ///
            range(0 4) lw(*2) 
     
     
       local trace "set trace on"   // 解析具体过程
     *---------------------------------------------------------
       local delta = 0.05   // 步长
       local     x = 1     // x 的初始值
       local     j = 0     // 计数器：记录迭代次数
       local     e = 1     // y1-y0
       local    e0 = 0.01  // 收敛判据       
      while `e' > `e0'{
        `trace'
        local y0 = 0.2*exp(`x') - ln(`x'^2) + 3 
        local x  = `x' + `delta' 
        local y1 = (0.2*exp(`x') - ln(`x'^2)) + 3
        local e  = abs(`y1' - `y0')
        dis in g "*" _c
        local j = `j' + 1
      }
       dis "e = " `e'    
       dis "x = " `x'     // x 的解
       dis "y = " `y1'    // y 的极小值
       dis "j = " `j'     // 迭代次数
	   
     *-图示：
       twoway function y = 0.2*exp(x) - ln(x^2) + 3,      ///
              range(0 4) lw(thick) xline(`x') yline(`y1') ///
              text(`=`y1'-0.5' `=`x'+0.8' "(`x'，`y1')")
     *---------------------------------------------------------
	 
     *- 练习：
        * (1) 设定 (delta=0.1, e0=0.01)，-trace- 计算过程
        * (2) 尝试将 (delta=0.001, e0=0.0001),结果有何变化？
        * (3) 若设定 (delta=0.02, e0=0.0001)，能否收敛?
        * (4) 若设定 x=2 为初始值，能否收敛？
        
             
     *- 程序修改如下：               
     *--------------------------------------------------------
       local   h = 0.001    // 步长
       local   x = 1        // x 的初始值
       local   j = 0        // 计数器：记录迭代次数
       local   e = 1        // y1-y0
       local  e0 = `h'/10   // 收敛判据 (修改为动态数值)     
      while abs(`e')>`e0'{  
                            // 修改：abs(`e')
        local y0 = 0.2*exp(`x') - ln(`x'^2) + 3 
        local x  = `x' + `h' 
        local y1 = (0.2*exp(`x') - ln(`x'^2)) + 3
        local e  = `y1' - `y0'   // 此前 e  = abs(`y1'-`y0') 
        if (`e' > 0){
           local h = -`h'   // 新增：反向搜索
        }
        dis in g "*" _c
        local j = `j' + 1
      }
       dis "e = " `e'    
       dis "x = " `x'      // x 的解
       dis "y = " `y1'     // y 的极小值
       dis "j = " `j'      // 迭代次数
     
     *-图示：
       local x: dis %4.3f `x'   // 新增：显示的更美观
       local y: dis %4.3f `y1'     
       twoway function y = 0.2*exp(x) - ln(x^2) + 3,      ///
              range(0 4) lw(thick) xline(`x') yline(`y1') ///
              text(`=`y'-0.5' `=`x'+0.4' "(`x', `y')")       
     *--------------------------------------------------------
	 
     *- 练习：
        * (1) 尝试初始值 x=3，是否能熟收敛？
        * (2) 如何搜索更加有效？程序如何编写？


     *___________________________________________________________
     *- 挑战：请求取如下函数的全局极大值(0<x<80): 
        
          twoway function                                     ///
              y = 0.3*sin(0.5*x)+ 0.9*cos(0.2*x) + 0.5*ln(x), ///
                  range(0 80) lw(*2)          
     *___________________________________________________________
        *
        * 思路：dy/dx = 0
        *  dy/dx = 0.15*cos(0.5*x) -0.18*sin(0.2*x) + 0.5*(1/x)
        *
        * 尚未完成的解答：
          doedit A5_while_max.do
       
                 
                 
  *-5.5.1.2  forvalues 语句   // 数字的循环 
    
    forvalues i = 0(-1)-14{
       dis in y _s(8) `i'
    }

    forvalues i = 0/4{
       dis in y _s(10) `i'
    }

    forvalues i = 10(-2)1{
       dis in y _s(8) `i'
    }

    mat mm = J(10,3,0)
    forvalues i = 1/10{
      forvalues j = 1/3{
        mat mm[`i',`j'] = `i' + `j'
      }
    } 
    mat list mm
    
    
    *-示例 1：多个文件导入和合并
         type d1.txt
         type d2.txt 
         type d3.txt
		 
       *-导入
         forvalues j = 1/3{
           local varname  id year invest market stock 
           insheet `varname' using d`j'.txt, clear
           save s`j'.dta, replace 
         }
		 
       *-合并(纵向追加)
         use s1.dta, clear
         forvalues j = 2/3{
            append using s`j'.dta
         } 
         save alldata.dta, replace
         browse
    
    
    *-示例 2： Fama-French two-step regression
      * viewsource xtfmb.ado
      * help xtfmb
      
      *- step1: 对面板分年度执行 OLS 回归，记录之；
      *- step2: 将各年度的估计值平均，得到最终的 b, se, R2 等统计量
      
      *- 简单处理方式
      *  model: reg mvalue  invest kstock 
         use grunfeld.dta, clear
         sort year company
         tab year
         mat R = J(20, 7, 0)
         local i = 1
         forvalues yr = 1935/1954{
            qui reg mvalue invest kstock if (year == `yr')
            mat b  = e(b)
            mat se = vecdiag(cholesky(diag(vecdiag(e(V))))) 
                                         // 参见 A4_Matrix.do      
            mat R[`i++', 1] = (b, se, e(r2_a))
         }
         mat list R
		 mat list e(b)  // 验证 1954 的结果
      
         
               
   *- 一般化处理方式(可封装成程序)   
   *---------------------------------------------------- 
         use grunfeld.dta, clear
         xtset company year
         xtdes
       *-基本设定  
         qui xtset
         egen tt = group(year)      // 有什么好处?
         tab tt
         tsset company tt
         local T = r(tmax)          // 样本时间跨度 
         local y   "mvalue"         // 被解释变量
         global xx "invest kstock"  // 解释变量
       *-设定存储结果的矩阵
         local s = wordcount("$xx")
         local c = (`=`s'+1')*2 + 1      
         mat   R = J(`T', `c', 0)  
       *-第一步：分年度回归
         forvalues t = 1/`T'{
            qui reg `y' $xx if (tt == `t')
            mat    b = e(b)
            mat  se2 = vecdiag(e(V))
            math se  = sqrt(se2)    // Arlion 自编程序
		   *mat se = vecdiag(cholesky(diag(vecdiag(e(V))))) 
            mat R[`t', 1] = (b, se, `e(r2)')  
         }
      
       *-第二步：计算各年度平均值
         mat  one = J(1, `T', 1)/`T'  // 每个元素都是 1/T
         mat AR = one * R
         mat list AR
      
       *-第三步：呈现结果  
         qui tsset company year
         global rowname ""
         forvalues t = `r(tmin)'/ `r(tmax)'{
             global rowname "$rowname `t'"
         }
         dis "$rowname"
         mat rownames R = $rowname
         global xx "$xx cons"
         mat colnames R = $xx  se se se  R2
         local coln : colnames R     
         mat colnames AR = `coln'
         mat list R                  // 分年度估计结果
         mat list AR                 // 各年度平均
         *- 尚可进一步美化：
            mat a = R[1, 1..3] 
             mat list a
            mat RR = (AR[1, 1..3] \ AR[1, 4..6] \ AR[1, 7], ., .)
            mat rownames RR = b se avg-R2
            mat list RR
      *----------------------------------------------------
      *- 测试结果：
         *ssc install xtfmb, replace  // 下载安装该命令
         xtfmb mvalue invest kstock
                  
         

  *-5.5.1.3 foreach 语句   // 变量、暂元、文件等的循环 

       help foreach         // 语法格式 

    *-a. 任意格式：foreach v in ...
       type d1.txt
       type d2.txt 
       type d3.txt
       foreach file in  d1 d2 d3{
          local varname id year invest market stock 
            insheet `varname' using `file'.txt,clear
            save `file'.dta, replace 
       }
       
       * 追加样本
         use d1.dta, clear
         foreach file in  d2.dta d3.dta{
            append using `file'
         }
         list


    *-b. 变量名循环：foreach v of varlist ...
         
      *-示例 1：各变量的对数转换
         sysuse auto,clear
         global vars "price weight length"
         foreach v of varlist $vars{
            gen ln_`v' = ln(`v')
            label variable ln_`v'  "ln(`v')" 
         }
		 
      *-示例 2：各变量的缩尾处理(Winsorized)
         sysuse nlsw88, clear
         local vv "wage hours ttl_exp grade"
         foreach v of varlist `vv'{
            winsor `v' , gen(`v'_w) p(0.01)
         }      
         d *_w   


    *-c. 暂元循环：foreach cc of local ...
         sysuse auto,clear
         local vars price weight length
         foreach v of local vars{
            gen `v'_2 = `v'^2 
         }
      
         *-特别注意：这里的 vars 暂元在引用时无需加 `'
      

    *-d. 数字循环：foreach num of numlist ...
  
      foreach num of numlist 1 4/8 13(2)21 103 {
         display in y _s(10) `num'
      }

      foreach num of numlist 111  1111  11111  111111 1111111 11111111{
         dis in g _s(10) %16.0f  `num'^2
      }

      *-这与 -forvalues- 语句有何差异？



	  
	  
	  
	  
	  
	  
          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *              ::第一部分::
          *               Stata 操作
          *       ==========================
          *         第五讲  STATA 编程初步
          *       ==========================
          *            -5.6-  条件语句

      cd `c(sysdir_personal)'Net_course_A\A5_prog
	  
*---------------------
*-> 5.6   条件语句
*---------------------

      *   ==本节目录==

      *   5.6.1 if 语句
      *   5.6.2 一些有用的条件函数 	  
	  
	  
*-----------------
*-5.6.1 -if- 语句
  
    *-基本要求
      * (1) 语法格式
      *     CASE I:
      *        if (条件){
      *           执行命令
      *        }  
      *     CASE II:
      *        if (条件1){
      *           执行命令1
      *        } 
      *        esle if (条件2){
      *           执行命令2
      *        }      
      * (2) 左括弧 "{" 紧接着条件；右括弧 "}" 另起一行
      * (3) 条件判断可嵌套

    *-示例 1
	  clear
      scalar tt = 7^2 + 3*29 + ln(100) 
      if tt>0{
         dis in g "The valus is" in y " positive! "
      }
      dis tt

	  
    *-示例 2
      scalar aa = 1   // 测试，修改为 aa==1
      if aa ==1{
         dis "这小子真帅!"
      }
      else if aa==0{
         dis "这女孩真靓!"
      }

	  
    *-示例 3
      sysuse nlsw88.dta, clear
      sort hours
      forvalues i = 1(1)20{
        if race[`i'] == 1{
          dis in y "`i'" in g " 号是" in y " 白人"
        }
        else if race[`i'] ==2{
          dis in y "`i'" in g " 号是" in y " 黑人"
        }
        else{
          dis in y "`i'" in g " 号是" in y " 其它人种"
        }
      }


    *-示例 4：
      *
      *- 目的：Tukey power(n) function of variable (x)
      *
      *- 变换规则：
      *
      *       {   x^n     if  n > 0
      *   z = {   ln(x)   if  n = 0
      *       {  -x^n     if  n < 0
      *
      *---------------------mygen.ado----------------------
       cap program drop mygen
       program define mygen
       version 10
       syntax varname(numeric), Power(integer) 
         if `power'>0 {   
           generate  `varlist'_p`power' = `varlist'^`power'
           label var `varlist'_p`power'   "`varlist'^`power'"
         }
         else if `power'==0 {
           generate  ln_`varlist' = ln(`varlist')
           label var ln_`varlist'  "ln(`varlist')"
         }
         else {
           generate  `varlist'_np`=-`power'' = -`varlist'^(`power')
           label var `varlist'_np`=-`power''  "-`varlist'^(`power')"
         }
       end
      *------------------------------------------------------
      
      *-测试：
        sysuse auto, clear
        mygen price, power(-2)
        mygen price, p(0)
        mygen price, p(3)
        d *price*
        
      *-如下命令是错误的
        mygen price , power(0.5)      // Power(integer)
        mygen price weight, power(0)  // varname
        mygen make, power(0)          // varname(numeric)
      
      
    *-示例 5：寻找变量的最大值
      sysuse auto, clear
      local max = price[1]
      local N = _N
      forvalues i = 2/`N'{
        set trace on       // 具体过程解析
        if `max' < price[`i']{
           local max = price[`i'] 
        }
        else{               // 这个语句不必要
           local max = `max'
        }
      }
      dis `max'
      sum price
      
      *-解决方法 2：使用 cond() 函数
         sysuse auto, clear
         gen max = price in 1/2     // Q: 为何 in 1/2 ?
            list price max in 1/10
         replace max = cond(price>max[_n-1], price, max[_n-1]) in 2/74
                                    // Q: 为何 in 2/74 ?
            order price max
            list price max
         local max = max[_N]
           dis `max'
           
      *-练习：如何对变量 price 的值进行排序？(不能使用sort或gsort命令)
      
      
	  
	  
*---------------------------
*-5.6.2  一些有用的条件函数
    
    *-参见 A2_data.do:   *-2.1.2.4 利用条件函数产生虚拟变量
  
    * -cond()- 函数：二元条件语句
      * 基本语法: cond(x, a, b)
      * 示例
        scalar aa = 1
        dis cond(aa==1, "这小子真帅!", "这女孩真靓!")
      
    * -inrange()- 函数：取值区间的判断
      * 基本语法:  inrange(z,a,b)
      * 示例
        sysuse nlsw88, clear
        tab grade
        gen d_grade = inrange(grade, 12, 16)
        list grade d_grade in 1/40, sepby(d_grade)
    
    * -inlist()- 函数：枚举判断
      * 基本语法: inlist(z, a, b, ...)
        help inlist()

    * -clip()- 函数：分段区间判断
      * 基本语法: clip(x,a,b)
        help clip()

    * -missing()- 函数：
      * 基本语法: missing(x1,x2,...,xn)  or mi(x1,x2,...,xn)
        help mi()
 

    
	
	
	
	


          *===================================
          *        计量分析与STATA应用
          *===================================

          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *              ::第一部分::
          *               Stata 操作
          *       ==============================
          *         第五讲  STATA 编程初步
          *       ==============================
          *        -5.7- 引用 Stata 命令的返回值
          
            
*------------------------------
*-> 5.7  引用 Stata 命令的返回值
*------------------------------

      *   ==本节目录==

      *   5.7.1 留存在内存中的结果
      *   5.7.2 r-class
      *   5.7.3 e-class
      *   5.7.4 c-class


*                 本节命令
*------------------------------------------------------
* return list, ereturn list, sret list, cret list
*------------------------------------------------------


*--------------------------
*-5.7.1 留存在内存中的结果

  *- Stata 命令分为三种类型：
  
     * (1) r-class  与模型估计无关的命令； 如，summary
     * (2) e-class  与模型估计有关的命令； 如，regress
     * (3) s-class  其它命令；             如，list
     * (4) c-class  存储系统参数

  *- 显示留存值的方法：
     * r-class:  return  list
     * e-class:  ereturn list
     * s-class:  sreturn list
     * c-class:  creturn list

  *- 留存值分为四种类型：
     * 单值：  如，r(mean), r(max), r(N), e(r2), e(F)
     * 矩阵：  如，e(b), e(V)
     * 暂元：  如，e(cmd), e(depvar)
     * 函变量：如，e(sample)
     

*-----------------
*-5.7.2  r-class

   sysuse auto, clear
   sum price
   return list
   dis "汽车的平均价格是：" in g `r(mean)'  // 两种方法均可
   dis "汽车的平均价格是：" in g  r(mean)
   local ss = r(sum)                        // 引用留存值
   dis "所有汽车的价格总和是：" in g `ss'

   *----------------示 例---------------------
   * 计算一组变量的取值范围，并存于一个矩阵中
     sysuse auto, clear
     local vars "price weight gear_ratio"
     local n = wordcount("`vars'")
     mat aa = J(`n',4,0)
     local i = 1
     foreach v of varlist `vars'{
        qui sum `v'
        mat aa[`i++',1] = (r(mean),r(min),r(max),`=r(max)-r(min)')
     }
      mat colnames aa = mean min max range
      mat rownames aa = `vars'
      mat list aa
   *------------------------------------------


   *-封装之，以便反复调用

*----------------- asum.ado -----------begin---
  *! Author:  Roger Federer
  *! Date:    2010.10.10
  *! Version: 1.0.0

   cap program drop asum
   program define asum, rclass  // 程序类型为 r-class
   version 8.0
   syntax varlist               // 输入项 
   
     local n = wordcount("`varlist'")
     tempname aa                // 定义暂时性矩阵 
     mat `aa' = J(`n',4,0)
     local i = 1
     foreach v of varlist `varlist'{
       qui sum `v'
       local range = r(max)-r(min)
       mat `aa'[`i++',1] = (r(mean), r(min), r(max), `range')
     }
     mat colnames `aa' = 平均值 最小值 最大值 取值范围
     mat rownames `aa' = `varlist'
     
   * 列示结果
     dis _n in g _dup(20) "=" in y "我的统计结果" in g _dup(20) "=" 
     mat list `aa', noheader
     
   * 返回值
     return add           // 加上该命令，看结果有何变化？
     return scalar range = `range'
     return matrix r = `aa'
     
   end
*---------------- asum.ado -------------over---

   sysuse auto, clear
   asum price weight length
   ret list
   mat list r(r)

   *-存储之，以便永久使用
     doedit asum.ado
     adopath + D:\stata11\ado\personal\Net_course_A\A5_prog
     asum mpg turn
     which asum

   *-该程序的缺陷：
     * (1) 结果的显示不够美观
     * (2) 程序没有选项，缺乏弹性
     * (3) 只能返回最后一个变量的计算结果
	    ret list



*-----------------
*-5.7.3  e-class     

*-> 在高级视频中会非常详细的介绍
 
  sysuse auto, clear
  regress price weight length foreign
  ereturn list
  
  dis "The method is: " in g  e(model)
  dis "最大似然值 = "   in g  e(ll)
  dis "R-sq = "  r(r2)            // ~-~ 错误
  dis "R-sq = "  e(r2)            // ^-^ 正确

  dis "系数向量为：" 
      mat list e(b)

  dis "系数的方差-协方差矩阵为："
      mat list e(V), format(%6.2f)

  *- e(sample) 的内容
     sysuse auto, clear
     count if rep78>4
     reg price weight length rep78 if rep78<=4
     sum price
     sum price if e(sample) == 1
     gen e_sample = e(sample)
     list rep78 e_sample in 1/20, sepby(e_sample)

  *- 示例1：控制缺漏值
     sysuse nlsw88, clear
     sum
     gen ln_wage  = ln(wage)
     gen ln_hours = ln(hours)
     local vv "ln_wage married ln_hours ttl_exp"
     reg `vv' 
     sum `vv' if e(sample)
     tabstat `vv' if e(sample), stat(mean sd min max N)  ///
                  format(%6.3f) c(s) 
    
  *- 示例2：样本内预测
     sysuse auto, clear
     qui reg price weight length rep78 if rep78<=4
     predict y_hat_a               // 回归拟合值
     predict res_a , res           // 残差
     gen e_sample = e(sample)
	 predict y_hat if e(sample)
     predict res   if e(sample), res
     format y_hat* res*  %6.2f
     list rep78 price y_hat* res* e_sample in 1/30, sepby(e_sample) 
  
     gsort -rep78
     list rep78 price y_hat* res* e_sample in 1/30, sepby(e_sample) 
 


*-----------------
*-5.7.4  c-class    

*-> 提供了大量提供参数的返回值，编程时非常有用

    creturn list

  *- 常数值
     dis `c(pi)'           // 圆周率
     dis "`c(alpha)'"      // 英文字母
     dis "`c(seed)'"       // 种子值
     dis `c(maxvar)'       // 当前版本所允许的最大变量数
     dis `c(memory)'
     clear
     set memory 10m
     dis `c(memory)'
     sysuse nlsw88, clear
     dis `c(k)'            // 变量的个数
     dis `c(N)'            // 观察值个数
       
  *- 文件路径
     dis "`c(sysdir_personal)'"
     dis "`c(sysdir_plus)'"
     cd  `c(sysdir_personal)'Net_course_A
     cd
     cd A5_prog
     dis `"`c(adopath)'"'
     dis "`c(pwd)'"
     adopath
         
  *- 时间
     dis "`c(current_date)'"  // 当前日期
     dis "`c(current_time)'"  // 当前时间  
     *-应用
       doedit `c(sysdir_stata)'profile.do
       dir `c(sysdir_stata)'do\*.log
       shellout `c(sysdir_stata)'do\s1Apr2010084746.log
       
  *- 应用实例 A：
     local date `c(current_date)'
     local time `c(current_time)'
       local vers `c(stata_version)'
       local mem `c(memory)'
       local flav = cond(`c(MP)',"MP", cond(`c(SE)',"SE","IC"))
       local cwd `c(pwd)'
       display _newline "Run `date' at `time' on Stata/`flav' "  ///
                        "version `vers', memory = `mem' bytes"
       display _newline "Current working directory: `cwd'" 
       
    *- 应用实例 B：
       sysuse auto, clear
       display _n "Datafile: `c(filename)' (N=`c(N)', k=`c(k)')" ///
                  " as of `c(filedate)'"
     
 
   *-一些有用的外部命令
   
   *  -adoedit- 在 do editor 中编辑 ado 文件



*==========================后 记===============================

* 至此，我们已经完成了 Stata 入门知识的学习

* 在第二部分中，我们将学习如何使用 Stata 分析和估计各种计量模型

*==============================================================

exit









*----------------------
* 笑话：stata修炼宝典
*----------------------
*
*-测试说明：输入 t1-t2 的时间值，运行结果

  *-------------------测试开始------------------------
  
     local t1 = 16   // "蹂躏 STATA 的时间"
     local t2 = 0.5 // "打游戏的时间"
     local t3 = .2   // "陪女朋友的时间"
     local t4 = .2   // "打网球的时间"
    
     if invlogit(`t1')>normal(`t2'+`t3'+`t4'-1.5){
        dis "恭喜：你将成为 STATA 高手！"
     }
     else{
        dis "悲哀：STATA 将蹂躏你！"
     }
     
  *-------------------测试结束------------------------    


* 结论：你不蹂躏STATA，STATA就会蹂躏你！

    twoway (function y = invlogit(x), range(0 14))   ///
           (function y = normal(x-1.5), range(0 14))





