



          *     -------------------------------------
          *     -------- 计量分析与STATA应用 ---------
          *     -------------------------------------
                    
          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *             ::第一部分::
          *              Stata 操作
          *         =====================
          *            第四讲   矩 阵
          *         =====================

   *cd D:\stata11\ado\personal\Net_course_A\A4_matrix
   cd `c(sysdir_personal)'Net_course_A\A4_matrix


*----------------
*    本讲目录
*----------------
* 4.1  矩阵的基本操作
* 4.2  矩阵运算
* 4.3  矩阵的解析 
* 4.4  关于矩阵的进一步说明  



*---------------------
*->4.1  矩阵的基本操作
*---------------------

     *         ==本节目录==
     
     *     4.1.1  基本定义方式
     *     4.1.2  矩阵的管理 
     *            4.1.2.1 矩阵的名称
     *            4.1.2.2 列示矩阵
     *            4.1.2.3 矩阵的行数和列数
     *            4.1.2.4 查找/删除矩阵
     *            4.1.2.5 查验矩阵中是否存在缺漏值
     *     4.1.3  矩阵的行名和列名
     *     4.1.4  选取部分矩阵
     *            4.1.4.1 选取1个元素: 1*1矩阵
     *            4.1.4.2 选取子矩阵
     *            4.1.4.3 矩阵元素的修改
     *     4.1.5  更一般化的矩阵定义
     *     4.1.6  常用矩阵的定义
     *            4.1.6.1 单位矩阵
     *            4.1.6.2 常数矩阵
     *            4.1.6.3 元素为随机数的矩阵
     *            4.1.6.4 对角矩阵
     *     4.1.7  变量和矩阵的相互转换
     *            4.1.7.1  变量—>矩阵
     *            4.1.7.2  矩阵—>变量
     *     4.1.8  用矩阵存储统计结果
     *            4.1.8.1 以矩阵方式呈现tabstat命令的结果
     *            4.1.8.2 更一般化的矩阵存储
     *     4.1.9  采用变量的方式操作矩阵
     *            4.1.9.1 对矩阵中的各列进行变换和运算
     *            4.1.9.2 矩阵元素的数学变换
     *     4.1.10 矩阵的保存和调入      
     *            4.1.10.1 将矩阵保存为 .dta 文档中      
     *            4.1.10.2 将矩阵保存到 txt, word, excel 文档中 


*                          本节命令
*--------------------------------------------------------------
* matrix, matrix dir, matrix list, matrix rename, matrix drop
* matmissing(), rowsof(), colsof(), matuniform(), diag(), 
* rownames, colnames, rownumb(), colnumb() 
* mat_capp, mat_rapp, mat_order
* roweq, coleq, mkmat, svmat, set matsize, 
* mat accum, mat glsaccum, mat opaccum
*--------------------------------------------------------------

*_____________________
*-4.1.1  基本定义方式

  *-简介(stata中的数据可以视为矩阵)
    sysuse auto, clear
    keep in 1/10 
    keep price mpg weight length
    list

  *-规则：逗号分列  反斜线分行
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    matrix b = (-1.3, 2.6 \ 3.89, 0.42 \ 50.1, -0.634)
    mat list b
    matrix c = (-10 \ -5 \ -8 \ 3 \ 5.6 \ 9)
    mat list c
    matrix d = (-10,-5,-8,5.6,9)
    mat list d
    matrix e = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
    mat list e


*_____________________
*-4.1.2  矩阵的管理 

  *-4.1.2.1 矩阵的名称
  
    * 可以和内存中的变量同名
      mat price  = (2,3)
    * 不可以和单值重名，虽然不会提示错误信息，但会自动覆盖
    * 在数学运算中，如果表达式中出现一个既是变量名称又是矩阵名称的名称，
    *   stata会将其解释为变量名称。
      clear 
      set obs 100
      gen x = 5
      mat x = J(3,3,2) 
      sum x
      
    *-矩阵更名 
      mat dir
      matrix rename a  MM
      mat dir

  *-4.1.2.2 列示矩阵
    mat list MM 
    mat list b               // 元素的默认显示格式为：%10.0g
    mat list b, format(%3.1f)
    mat list e 
    mat list e, nohalf
    mat list e, nohalf nonames 
    mat list e, nonames title("一个5*5的对称矩阵")
    
    
    *-matlist 命令 (更为灵活的设定方式)
    * 主要用于编程，呈现结果 
    
      *-eg1-- 
        matrix A = (1, 2 \ 3, 4 \ 5, 6)
        matrix list A
        matlist A
        matlist A, border(rows) rowtitle(rows) left(4)
        matlist 2*A, border(all) lines(none) format(%6.1f) names(rows) ///
                     twidth(8) left(4) title(Guess what, a title)

      *-eg2--
        #delimit ;
        matrix Htest = ( 12.30,  2,  .00044642  \ 
                          2.17,  1,  .35332874  \                    
                          8.81,  3,  .04022625  \ 
                         20.05,  6,  .00106763  ) ;
        #delimit cr
        matrix rownames Htest = trunk length weight overall  // 定义行名
        matrix colnames Htest = chi2 df p                    // 定义列名
        matrix list Htest
        matlist Htest       // 比较两种结果的差异
        * 更为细致的呈现方式
          matlist Htest, title("检验结果") rowtitle("变量名称")  ///
               cspec(o4& %12s | %8.0g & %5.0f & %8.4f o2&) rspec(&-&&--)
               
               /*         上述命令的含义
--------------------------------------------------------------------------               
Element 	Purpose	 			Description
--------------------------------------------------------------------------
o4&     before column 1 			4 spaces/no vertical line
%12s 	display format column 1 	string display format %12s
| 		between columns 1 and 2 	1 space/vertical line/1 space
%8.0g 	display format column 2 	numeric display format %8.0g
& 		between columns 2 and 3 	1 space/no vertical line/1 space
%5.0f 	display format column 3 	numeric display format %5.0f
& 		between columns 3 and 4 	1 space/no vertical line/1 space
%8.4f 	display format column 4 	numeric display format %8.4f
o2& 	after column 4 				2 spaces/no vertical line
&-&&--  首行上方无横线，首行下方有横线，最后一个行上下方均有横线
--------------------------------------------------------------------------
               */
               
        * 修改上述表格的呈现方式
           matlist Htest, title("检验结果") rowtitle("变量名称")  ///
               cspec(o4| %12s | %8.0g | %5.0f | %8.4f o2|) rspec(--&&--) 
               
        * 进一步修改
          matlist Htest, title("检验结果(New)") rowtitle("变量名称")  ///
               cspec( o4&o2 %10s | b t %8.0g & %4.0f & i c %7.4f o2& ) ///
               rspec( & - & & - & )       
          *-说明：
          * (1) b t %8.0g  第二列 加粗(bold), 绿色(text color)
          * (2) i c %7.4f  第四列 斜体(italic), 白色(command color)
          
          
  *-4.1.2.3 矩阵的行数和列数
    matrix a = (1,2,3 \ 4,5,6)
    display colsof(d)
    display rowsof(c)
    scalar ra = rowsof(a)
    scalar ca = colsof(a)
    dis in g "矩阵 a 的行数是: " in y ra 
    dis in g "矩阵 a 的列数是: " in y ca


  *-4.1.2.4 查找/删除矩阵
  
    *-查找矩阵
      mat dir

    *-删除矩阵 (这个其实没有必要)
      mat drop MM
     *mat drop _all


  *-4.1.2.5 查验矩阵中是否存在缺漏值
    mat list e
    display matmissing(e)
    mat e[2,3] = .
    mat list e
    display matmissing(e)     


*_________________________
*-4.1.3  矩阵的行名和列名

  mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
  mat rownames A = 1998 1999 2000 2001
  mat colnames A = y x1 x2 x3 
  mat list A

  mat r = rownumb(A, "2000")
  mat c = colnumb(A, "x1")
  mat list r
  mat list c


*_____________________
*-4.1.4 选取部分矩阵

  *-4.1.4.1 选取1个元素: 1*1矩阵
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    mat a1 = a[1,1]
    mat list a1
    mat a4 = a[2,1]
    mat list a4

  *-4.1.4.2 选取子矩阵
    mat list e,nohalf
    mat ec3 = e[1..3,3]
    mat list ec3
    mat e3c = e[....,3]
    mat list e3c
    mat e34 = e[3...,4...]
    mat list e
    mat list e34

  *-4.1.4.3 矩阵元素的修改
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    mat a[1,2] = -10
    mat list a
    mat a[2,2] = (-9, 20)
    mat list a
    
    
*___________________________
*-4.1.5 更一般化的矩阵定义

  * 矩阵中的每一个元素都可以视为一个1*1维矩阵，
  * 所以矩阵的操作可以分块进行
  
    mat a1 = (1, 2, 3 \ 42, 50, 63)
    mat a2 = (-3,-5,-7 \ -9 , -11, -13)
    mat list a1
    mat list a2 
  
    mat aa  = [a1, a2]   // 横向合并两个矩阵
    mat list aa
    mat aaa = [a1 \ a2]  // 纵向追加两个矩阵
    mat list aaa
  

  *-更为直观的定义方式
    mat_capp a1_a2 : a1 a2   // 横向合并
    mat list a1_a2
    mat_rapp a1a2 : a1 a2    // 纵向追加
    mat list a1a2
    * 注意：上述命令中，冒号前必须有一个空格


*_____________________
*-4.1.6 常用矩阵的定义

  *-4.1.6.1 单位矩阵
    mat I = I(5)
    mat list I

  *-4.1.6.2 常数矩阵
    mat r1 = J(5,5,1)
    mat r2 = J(2,6,-3)
    mat list r1
    mat list r2
    
  * -----------------
  * 一个实例：差分矩阵
  * 构造
 
    mat B = J(4,5,0)
    mat B[1,1] = -1*I(4)
    mat B1 = B
    mat B = J(4,5,0)
    mat B[1,2] = I(4)
    mat B2 = B
    mat B = B1 + B2
    mat list B1
    mat list B2
    mat list B
  * 应用
    mat cc = J(5,5,1) + 2*I(5)
    mat rownames cc = 1998 1999 2000 2001 2002 // 定义矩阵的行名
    mat list B, nonames
    mat list cc, nohalf   
    mat dd = B*cc
    mat list dd
    mat rownames dd = 1999 2000 2001 2002 
    mat list dd
  * -----------------
  
    *-一般化定义
	  local T = 10
      mat B = J(`T'-1,`T',0)
      mat B[1,1] = -1*I(`T'-1)
      mat B1 = B
      mat B = J(`T'-1,`T',0)
      mat B[1,2] = I(`T'-1)
      mat B2 = B
      mat B = B1 + B2
      mat list B1
      mat list B2
      mat list B


  *-4.1.6.3 元素为随机数的矩阵
    *set seed 13699
    mat r3 = matuniform(10,4)
    mat list r3


  *-4.1.6.4 对角矩阵
    mat u = J(5,1,-0.5)
    mat list u
    mat du = diag(u)  // 取出对角元素
    mat list du
    mat v = diag(matuniform(5,1)) // 一个任意的5*5对角矩阵
    mat list v



*____________________________ 
*-4.1.7  变量和矩阵的相互转换

  *-4.1.7.1  变量—>矩阵           -mkmat-
    
  * 转换单变量为同名列向量
    sysuse auto,clear
    mkmat price in 1/10   // 生成一个 10*1 的列向量，矩阵名为 price
    mat list price
    
    mkmat price weight length if rep78==4  // 生成三个同名列向量
    mat list price
    mat list weight
    mat list length
    
  * 将多个变量合并至一个矩阵
    mkmat price, matrix(Y)
    gen cons= 1
    mkmat weight length foreign cons, mat(X)
    mat list Y
    mat list X
    
   * 应用实例：OLS 系数估计
     mat b = inv(X'*X)*X'*Y
     mat list b
     reg price weight length foreign
   
     * 缺漏值的处理
       count if price>10000
       replace price =. if price>10000
       count if weight>4000
       replace weight =. if weight>4000 
       mkmat price wei, mat(pw)
       dis rowsof(pw)
       mkmat price wei, mat(pw_no) nomissing  // 仅包含非缺漏值
       dis rowsof(pw_no)
       list price weight if price==.|wei==.
       count if price==.|wei==.


  *-4.1.7.2  矩阵—>变量       -svmat-  -xvmat-

    svmat b, names(coff)
    list coff1 in 1/5
    svmat X, names(var)  // 自行定义统一的变量名
    drop weight length foreign cons
    svmat X, names(col)  // 用矩阵的列名作为变量的名称

    *-xsvmat 命令 (svmat的拓展) 
      sysuse nlsw88, clear
      xi: reg wage hours ttl_exp i.race
      mat covmat = e(V)  // 方差-协方差矩阵
      mat list covmat
   
      xsvmat covmat, list(,)   // 以变量方式列示矩阵的内容
      xsvmat covmat, rowname(xvar) rowlab(label) list(, abbr(32))


*_________________________ 
*-4.1.8  用矩阵存储统计结果       -makematrix-  -tabstatmat-

    *-4.1.8.1 以矩阵方式呈现tabstat命令的结果    -tabstatmat- 
       *-eg1-
        sysuse auto, clear
        tabstat price mpg weight length, save
        tabstatmat A 
        mat list A
       *-eg2-
        tabstat price mpg weight length, save ///
             by(foreign) stat(mean p50 sd min max) format(%6.3f)
        tabstatmat A
        mat list A, format(%6.3f)

    *-4.1.8.2 更一般化的矩阵存储     -makematrix-
       sysuse auto, clear
       makematrix, from(r(mean) r(sd) r(skewness)) :  ///
                   sum price trunk length weight, detail
               
       makematrix A, from(_b[_cons] _b[mpg] e(r2) e(r2_a))  ///
                   lhs(rep78-foreign) format(%4.3f) :     ///
                   regress mpg
       mat list A
       
       sysuse nlsw88, clear                       
       makematrix B,  ///
         from(_b[_cons] _b[married] _b[age] _b[south] ///
		      _b[ttl_exp] e(r2) e(r2_a))              ///
         lhs(wage hours)                           /// // 被解释变量
         format(%4.3f) list  sep(0) divider:       ///
         regress married age south ttl_exp             // 解释变量
       mat B = B'
       mat colnames B = wage hours
       mat list B
               
       use xtcs.dta, clear
       makematrix, from(_b[_cons] _b[tobin] _se[tobin] ///
                   e(r2) e(r2_w) e(F_f))               ///
                   lhs(tl sl ll) format(%6.5f) :       ///
                   xtreg fr-tobin, fe 
        
       sysuse auto, clear               
       makematrix, from(r(rho)) :                 ///
               spearman head trunk length displacement weight
       spearman head trunk length displacement weight // 对比一下
       
	   *- from()选项中可以执行数学运算        
       makematrix, from(r(rho)^2) format(%4.3f) :   ///
               spearman head trunk length displacement weight


*_______________________________ 
*-4.1.9  采用变量的方式操作矩阵     -mgen-

  *-4.1.9.1 对矩阵中的各列进行变换和运算，如加总、相除等
    clear
	mat drop _all
    matrix a = (1,2,3 \ 4,5,6)
    mat list a
    mgen v1=c1+c2 v2=c2+c3, in(a) out(z)
    mat list z
    
  *-4.1.9.2 矩阵元素的数学变换 
    mgen ln_c1=ln(c1) exp_c2=exp(c2), in(a) out(c)
    mat list c
   *- 基于这一思路，我们可以对矩阵中的元素进行数学变换
   *- 如下数学函数都可以使用：
      help math functions


*_________________________
*-4.1.10  矩阵的保存和调入    -matsave-, -matload-, -mat2txt-
  
  *-4.1.10.1 将矩阵保存为 .dta 文档中
  
    *- 基本思路：
    *  matsave
    *    把矩阵转换为变量(参见4.1.7.2小节),然后保存为 .dta 文件
    *  matload
    *   把 .dta 文件调入，然后将变量转换为矩阵(参见4.1.7.1小节)
    
    *-说明：
    * (1) 多数情况下，我们都无需保存矩阵，只需保存do文档即可；
    * (2) 极少数情况下，要通过非常耗时的计算才能得到某个矩阵，
    *     而这个矩阵可能还会参与后续运算，此时需要保存；  
    
    *- 矩阵的保存：matsave
       sysuse auto, clear
       reg price weight length mpg
       eret list
       mat COV = e(V)
       *-基本用法
         matsave COV           // 错误命令
         matsave COV, dropall replace // 正确命令
       
    *- 矩阵的调入：matload
       mat dir     // 当前内存中已经有一个 COV 矩阵
       matload COV, overwrite dropall // 覆盖当前内存中的同名矩阵


  *-4.1.10.2 将矩阵保存到 txt, word, excel 文档中   -mat2txt-, -dataout-
                             
       sysuse nlsw88, clear
       
     *-基本统计量
       tabstat wage age ttl_exp hours, stats(N mean sd min max) c(s) save
       tabstatmat A   
       mat A = A'     // 使结果与tabstat一致
	   *-保存为txt格式
       mat2txt, matrix(A) saving(mytable01) replace  /// 
                title("Table 1: statistics of key variables")
       shellout mytable01.txt
      
     *-相关系数矩阵
       makematrix R, from(r(rho)) : spearman wage age ttl_exp hours 
       *-追加结果到 mytable01.txt 文档中
       mat2txt, matrix(R) saving(mytable01) append  /// 
                title("""""Table 2: correlation of key variables")
       dataout using mytable01.txt, word excel replace // 转换为word,excel格式
     
     *-练习：请进一步将回归结果追加到上述文件中  
     
     *-其它处理方式：
     *   参见 A1_intro 第【10.1.1小节】  输出基本统计量
    
     
	 
	 
	 
	 
	 
	 


          *     -------------------------------------
          *     -------- 计量分析与STATA应用 ---------
          *     -------------------------------------
                    
          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *             ::第一部分::
          *              Stata 操作
          *         =====================
          *            第四讲  矩阵操作
          *         =====================
		  *            -4.2- 矩阵的运算
          
          
*---------------------
*-4.2    矩阵的运算
*---------------------

     help matrix operators
     
     *         ==本节目录==
     
     *     4.2.1 矩阵的基本运算
     *           4.2.1.1 加、减、乘
     *           4.2.1.2 直乘
     *           4.2.1.3 哈式乘法
     *           4.2.1.4 矩阵元素的数学变换
     *           4.2.1.5 矩阵与单值的运算   
     *     4.2.2 矩阵的转置
     *     4.2.3 矩阵的逆矩阵  
     *           4.2.3.1 矩阵的行列式 
     *           4.2.3.2 矩阵求逆
     *     4.2.4 矩阵的向量化
     *     4.2.5 矩阵的对角值
     *     4.2.6 交乘矩阵的定义
     *           4.2.6.1 简单交乘矩阵
     *           4.2.6.2 加权交乘矩阵 
     *           4.2.6.3 用户自行设定的权重 
     *           4.2.6.3 特殊加权交乘矩阵     
     
     
*                          本节命令
*-------------------------------------------------------
* hadamard(), inv(), issym(), det(), trace(), vecdiag()
* diag(), math(), vec(), mgen(), + - * / #
*-------------------------------------------------------

*            Operator               Symbol
*            -----------------------------
*            parentheses            ()
*            transpose              '
*            negation               -
*            Kronecker product      #
*            division by scalar     /
*            multiplication         *
*            subtraction            -
*            addition               +
*            column join            ,
*            row join               \
*            -----------------------------


*_____________________
*-4.2.1 矩阵的基本运算

  *-4.2.1.1 加(+)、减(-)、乘(*)
  
    matrix e   = J(5,5,3)
    matrix I5  = 5*I(5)
    mat list e, nohalf 
    mat list I5

    * 加法
      mat add = e + I5
      mat list add, nohalf
 
      mat add1 = e + 2         // 错误方式
      mat add1 = e + J(5,5,2)
      mat list add1

    * 减法
      mat sub = e - I5
      mat list sub, nohalf

    * 乘法
      mat prod= e*I5
      mat list prod


  *-4.2.1.2  直乘
  
    *-定义：
    
    *          [ a11*B  a12*B  ... a1k*B ]
    *          | a21*B  a22*B  ... a2k*B |
    *  A # B = |   .      .    ...    .  | 
    *          |   .      .    ...    .  |
    *          [ an1*B  an2*B  ... ank*B ]
              
    *--eg1----------------
     mat one = J(4,1,1)
     mat I1  = I(5)
     mat kro = I1 # one
     mat list one
     mat list I1
     mat list kro
    
    *--eg2----------------
     mat xx = J(3,3,-1)
     mat kro2 = I1 # xx
     mat list xx, nonames nohalf
     mat list I1, nonames nohalf
     mat list kro2, nohalf
    
    *--eg3----------------
	 mat a = (1,2 \ 3,4 \ 5, 6)
     mat kro3 = a # xx
     mat list a
     mat list xx, nohalf
     mat list kro3
     
   *-直乘的性质：
   *
   * (1)  (A # B)' = A' # B'  
   *
   * (2)  inv(A # B) = inv(A) # inv(B)
   *
   * (3)  |A # B| = |A|^k*|B|^n  (A是nXn矩阵，B是kXk 矩阵)
   *
   * (4)  tr(A # B) = tr(A)*tr(B)
   *
   * (5)  a*b' = a # b' = b' # a
   *
   * (6)  (a # B)*C = a # B*C
   *
   * (7)  A*(b'#C) = b'#AC
   *
   * (8)  (A#b)*C = AC#b 
   *
   * (9)  A(B#c') = AB#c'
   *
   * (10) a'b*CD = (a'#C)*(b#D) 
   
   * 练习：请使用stata命令验证上述性质。
   

  *-4.2.1.3  哈式乘法: 元素对元素的乘法
 
    mat a = (1,2  \ 3,4 \ 5, 6)
    mat b = (-1,4 \ 0,1 \ -3,12)
    mat aHb = hadamard(a,b)
    * 呈现结果
      mat m = J(3,1,.) 
      mat R = (a, m, b, m, aHb)
      mat list R
 

  *-4.2.1.4  矩阵元素的数学变换
    
    *-整体变换
      help math           // arlion 自行编写的程序
     
      mat a = J(4,5,8)
      math ln_a = ln(a)   // 矩阵元素取对数
      mat  list a
      mat  list ln_a
     
      math exp_a = exp(a) // 矩阵元素取幂
      mat  list exp_a
	  
	  sysuse auto, clear
	  reg price wei len foreign
	  mat  V  = e(V)
	  mat list V
	  mat  se2 = vecdiag(e(V))
      math se  = sqrt(se2)    // Arlion 自编程序
	  mat  se0 = vecdiag(cholesky(diag(vecdiag(e(V))))) 
      mat list se
	  mat list se0
	  
	  viewsource math.ado
     
    *-操作过程详解：
	  view browse http://www.ats.ucla.edu/stat/stata/faq/elemmatrix.htm
	  
    *-可供调用的函数如下：
      help math functions
      
	  
    *-分列变换
      help mgen   // 详见 4.1.9.1 小节
    
      mgen v1=ln(c1) v2=exp(c2) v3=sin(c3), in(a) out(b)
      mat list a
      mat list b
    
    * 特别注意：mgen后的各项表达式以空格区分，
    *           所以，"v1=ln(c1)" 不可以写为 "v1 = ln(c1)"
     
 
  *-4.2.1.5 矩阵与单值的运算
  
    scalar c = 5
    mat D = J(4,4,1)
    mat list D
    
    mat Dc = D*c
    mat list Dc
  
    mat cD = c*D
    mat list cD
  
    mat D_c = D/c
    mat list D_c
      

*__________________________
*-4.2.2 矩阵的转置: 行列互换

  matrix A = (-1, 2 \ 3, 4 )
  matrix B = ( 4, 1, 2, 5 )
  mat    C = (4,1 \ 2, 5)
  
  mat list A
  mat At = A'
  mat list At 
  
  mat list B
  mat Bt = B'
  mat list Bt
  
  * 公式：(A*C)' = C'*A' != A'*C'
    mat ACt  = (A*C)'
    mat AtCt = A'*C'  
    mat CtAt = C'*A'  // 转置运算优先于乘法运算
    mat list ACt
    mat list CtAt
    mat list AtCt


*___________________
*-4.2.3 矩阵的逆矩阵

   *-4.2.3.1 矩阵的行列式：描述矩阵特征的一个统计量
     
     mat A = (-1, 2 \ 3, 4)
	 mat list A
     scalar detA = det(A)
     dis detA
     dis -1*4 - 3*2
     
     *= 性质：
        * (1) 若A不可逆，则 |A|=0, 反之亦然
        * (2) |A'|  = |A|
        * (3) |A*B| = |A|*|B|
        * (4) |5*A| = 5^n*|A| 
		*
        *     |A  0| 
        * (5) |    | = |A|*|B|
		*     |0  B| 
        
        
   *-4.2.3.2 矩阵求逆
     
     dis issym(A)         // 判断一个矩阵是否为对称矩阵
     mat invA = inv(A)
     mat IA   = A*invA
     mat list A
     mat list invA
     mat list IA


*______________________
*-4.2.4  矩阵的向量化

  *- 向量化矩阵 类似于变量操作中 stack 命令
     mat A  = (-1, 2 \ 3, 4)
     mat vA = vec(A)
     mat list A
     mat list vA 
     
  *- 向量化方阵的对角元素
     mat E = e + 0.9*I(5)
     mat dA = vecdiag(A)
     mat dE = vecdiag(E)
     mat list A
     mat list dA
     mat list E
     mat list dE
	 *-例:
	   sysuse auto, clear
	   reg price wei len foreign
	   mat b = e(b)
	   mat  V  = e(V)
	     mat list V
	   mat  se2 = vecdiag(e(V))
	     mat list se2
	   mat se2 = diag(se2)        // 向量的对角化
	     mat list se2
	   mat se = cholesky(se2)     // 裘氏分解
	     mat list se
	   mat t = diag(b)*inv(se)
	   mat list t
       reg price wei len foreign  // 验证一下
	   
 
  *- 矩阵向量化的性质
  
     * 1. vec(ABC)  = (C'#A)vec(B)
     *
	 * 2. vec(ab')  = b # a
     *
	 * 3. vec(a'#B) = a # vec(B)
	 *
     * 4. vec(a #B) = (Ik # a # In)*vec(B) = vec(B # a')  (B是 nXk 矩阵)
	 *
     * 5. tr(AB) = vec'(A')vec(B) = vec'(B')vec(A)
	 *
     * 6. tr(ABCD) = vec'(A)(B#D')vec(C') = vec'(A')(D'#B)vec(C)
	 *
     * 7. a'BcDF = (c'#a'#D)[vec(B)#F]
	 *
     * 8. Abc'D = (b’#In)vec(A)vec'(D')(c'#Im) = (b'#In#c')[vec(A)#D]
     *    其中，A是nXk矩阵，D是mXj矩阵
     *    In表示nXn单位阵
     
     * 练习：请采用stata命令验证上述性质


	 
*__________________________
*-4.2.5 矩阵的对角值(trace)

   *-定义：方阵的对角元素之和
   
   *-性质：
     * (1) tr(AB) = tr(BA)    // 要求：A,B可乘
     * (2) tr(cA) = c*tr(A)   // c 是单值
   
   *-示例：
     matrix Atr = trace(A)
     scalar Etr = trace(e)
     mat list A
     mat list Atr
     mat list e
     dis Etr 


	 
*__________________________
*-4.2.6  交乘矩阵的定义

* [P] matrix accum -- Form cross-product matrices

   help matrix accum
 
   *-4.2.6.1 简单交乘矩阵    -matrix accum-， -matrix vecaccum-
   
     *-应用背景
     *
     *  OLS估计： b = inv(X'X)*X'y
     *
     *  X 是一个 N*K 维矩阵，
     *  当N较大时(如N=20000)，将超过stata矩阵的上限(11000)
     *  但 X'X 则是一个较小的矩阵，维度为：K*K
     *
     *- matrix accum 的定义 
     *
     *     matrix accum (A) = A'*A     其中，A = (x1,x2,x3……)
     *
     *- matrix vecaccum 的定义
     *
     *     matrix vecaccum(A) = x1'*X  其中，X = (x2,x3,……)
     *
     *- 几个重要选项：
     *  (1) noconstant 不在 X 矩阵中自动附加常数项；
     *  (2) deviation  采用离差的形式
 
     *-eg1- 线性模型的 OLS 估计  
     
       *-目的：求取 b = inv(X'X)*X'y
       * 其中，y = price, 
	   *       X =(weight,mpg,Cons)
     
       * 方法1：结合使用 matrix accum 和 matrix vecaccum
         sysuse auto, clear
         mat accum XX = weight mpg
         mat vecaccum yX = price weight mpg
         mat Xy = yX'                     // 这里要注意
         mat b = inv(XX)*Xy
         mat list b
         reg price weight mpg, noheader   // 检验上述结果
       
       * 方法2：仅使用 matrix accum 命令
       * 思路: 若 A = (y, X)， 则
       *
       *                                       [ y'y  y'X ]
       *   mat accum (A) = S = (y, X)'(y, X) = [          ]
       *                                       [ X'y  X'X ] 
       * 
       * 其中，X 的最后一列会被自动加入常数项
       * 可见，X'X 和 X'y 矩阵都可以从 S 矩阵中抽取     
         matrix accum S = price weight mpg  // y=price, X=[weight mpg 1]
         mat list S
         matrix XX = S[2..., 2...]
         mat list XX
         matrix Xy = S[2..., 1]
         mat b = inv(XX)*Xy
         mat list b
         reg price weight mpg,nohead       // 检验上述结果
    
     *-eg2- 获取变量的相关系数矩阵
       sysuse auto, clear
       corr price weight mpg length
       ret list                   
     *-自行生成矩阵
       matrix accum R = price weight mpg length, noconstant deviation
       matrix R = corr(R)
       mat list R, format(%6.4f)
 
   
  *-4.2.6.2  加权交乘矩阵   -mat glsaccum-
   
    * 用于生成 GLS 估计中的相关矩阵
    *
    *-mat glsaccum 的定义
    *  
    *     mat glsaccum(X) = S = X'BX
    *
    * 其中，B 为权重矩阵，定义如下：
    *
    *       [ W_1   0   ...   0  ]
    *       |  0   W_2  ...   0  |
    *   B = |  .    .    .    .  |
    *       |  .    .     .   .  |
    *       [  0    0   ...  W_k ]
    *
    *  W_k(k=1,2,...,K) 表示第 k 组观察值的权重矩阵，是一个方阵
    *
    *  若 X 也根据组别定义，则可表示为：
    *  
    *        [ X_1 ]
    *        | X_2 | 
    *    X = |  .  |
    *        |  .  | 
    *        [ X_k ]
    *
    *  由此可以更为细致的了解到 glsaccum 的定义方式：
    *
    *   X'BX = X1'W1X1 + X2'W2X2 + ... + X_k'*W_k*X_k 
    
    *- 应用举例：White(1980) 异方差稳健性标准误的计算
    *  
    *  Var(b) = inv(X'X)*(X'WX)*inv(X'X)  // White(1980)稳健性方差-协方差矩阵 
    *
    *  其中，
    *  
    *       [ e1^2   0    ...    0  ]
    *       |  0    e2^2  ...    0  |
    *   W = |  .     .     .     .  |
    *       |  .     .     .     .  |
    *       [  0     0    ...  eN^2 ]  NXN 矩阵
    *
    *  ei 表示第 i 个观察值对应的残差
    *
    *  问题的关键：求得 (X'WX) 矩阵即可，可采用 -mat glsaccum- 命令  
     
     *-1 获得OLS估计值
       sysuse auto, clear
       mat accum XX = wei len mpg
       mat vecaccum Xy = price wei len mpg
       mat Xy = Xy'
       mat b = inv(XX)*Xy             // 系数的 OLS 估计值
       mat list b
       
     *-2 求取残差之平方向量：e2
       mkmat price, mat(y)
       gen cons = 1
       mkmat wei len mpg cons, mat(X) // 注意附加常数项
       mat e = y - X*b                // 残差向量
       mat colnames e = c1
       mgen e2=c1^2, in(e) out(e2)    // 权重：残差的平方项
       
     *-3 求取 (X'WX) 矩阵  
       gen id = _n        // 最简单的情况：每个观察值归属于一个组别
       sort id
       mat e2 = diag(e2)  // 将残差向量变换为对角方阵
       mat glsaccum XWX = wei len mpg, group(id) glsmat(e2) row(id)
	   mat list XWX
      
     *-4 求取稳健性标准误   
       mat var_b = inv(XX)*XWX*inv(XX)              // 计算 White(1980) 估计式 
       mat se_rob = cholesky(diag(vecdiag(var_b)))  // 对角元素开根号，求得[s.e.]
       mat se_rob = se_rob/sqrt(70/74)              // 调整自由度
       mat list b
       mat list se_rob
       reg price wei len mpg, robust nohead         // 验证一下
       
     *-5 计算 t 值
       mat t_rob = diag(b)*inv(se_rob)              // t-value = b/se
       mat list t_rob   
 

   *-4.2.6.3 用户自行设定的权重 
   
     *- mat (vec)accum 与 mat glsaccum 的关系
        
        * 上述三个命令所返回的矩阵具有如下一般形式：
        *
        *       X1'*B*X2
        *
        *  (1) mat accum: 	 X1=X2, B=I  ==>  X'X
        *  (2) mat glsaccum: X1=X2       ==>  X'BX
        *  (3) mat vecaccum: B=I, X1 是一个列向量，X2是一个矩阵
		*                                ==>  y'X   
     
     *- 自行指定权重
        
        *-基本思想：
        *    X1'*B*X2 可采用一般化形式表示为  
        *    X1'W1*B*W1*X2，其中 W1 = W^{1/2}
        *
        *    若用户不自行设定权重，则 W = I 
        *    若用户自行设定权重，如 pweights(v), 则 W = diag(v)
        *    此处，v 是一个变量
        *
        *-用途：若设定 B=I，X1=X2, 由于 W1*W1' = W, 则上式可表示为：
        *     X'*W*X  
        *    这与 mat glsaccum 命令返回的矩阵形式相似，
        *    区别在于我们可以通过变量 v 来设定权重矩阵，
        *    而不必采用矩阵的形式来设定
         
        *-eg：一个难题的解决：用-mat accum-替代 -mat glsaccum-
   
        *-参见: 
		  view browse http://statalist.org/archive/2002-10/msg00144.html 
     
        *-问题：
        *   在上述 mat glsaccum 命令中:
        *   mat glsaccum XWX = wei len mpg, group(id) glsmat(e2) row(id)
        *   我们必须设定 glsmat() 选项，以便指定权重矩阵，
        *   其中，e2 是一个 NXN 矩阵，
        *   然而，当 N=11000，或更大的数值时，我们是无法够造出 e2 矩阵的
        *
        *-解决方法：
        *   使用如下替代命令：
        *   mat accum H = wei len mpg [pw=e2], noc
        *   此处，e2 是一个变量，所以可以避免上述问题
        *
        *-示例检验：
          sysuse auto, clear
          reg price wei len mpg
          predict e, res
          gen e2 = e^2      // 权重序列
        *-方法1：mat glsaccum 命令 
          mkmat wei len mpg, mat(X)
          mkmat e2, mat(B)
          mat B = diag(B)
          mat S = X'*B*X
          mat list S
        *-方法2：mat accum 命令，附加 [pw] 副指令
          mat accum H = wei len mpg [pw=e2], noc
          mat list H
               
               
  *-4.2.6.3  特殊加权交乘矩阵    -mat opaccum-
  
    * 同样用于生成 GLS 估计中的相关矩阵
    * mat opaccum 可以视为 mat glsaccum 的特例
    *
    * mat glsaccum 的定义方式：
    *
    *   A = X'BX = X1'W1X1 + X2'W2X2 + ... + X_k'*W_k*X_k 
    *
    * 这里的权重矩阵 Wi 具有一般化的定义方式（想想异方差和序列相关情形）
    * 在很多情况下，Wi 具有比较特殊的形式，如某个变量的外积(outer product):
    *
    *       Wi = e_i*e_i'    
    *
    * 其中，e_i 是一个 n_iX1 矩阵, n_i 是第 i 个公司的样本数
	
	*     N  [                    ]                
	*    SUM [ (X_i)'e_i(e_i)'X_i ]
    *    i=1 [                    ]
	
    *-eg:
      use maccumxmpl.dta, clear
      xtdes
      mat opaccum A = x1 x2, opvar(e) group(id)
      mat list A
   


   
   
   
   
   
   
   

          *     -------------------------------------
          *     -------- 计量分析与STATA应用 ---------
          *     -------------------------------------
                    
          *        主讲人：连玉君 博士

          *        单  位：中山大学岭南学院金融系
          *        电  邮: arlionn@163.com
          *        主  页: http://blog.cnfol.com/arlion 

          *             ::第一部分::
          *              Stata 操作
          *         =====================
          *            第四讲  矩阵操作
          *         =====================
		  *            -4.3- 矩阵的解析

*---------------------
*-4.3    矩阵的解析
*---------------------

     *           ==本节目录==
     
     *     4.3.1  线性相关、线性独立和正交向量
     *     4.3.2  矩阵的秩
     *     4.3.3  特征根和特征向量
     *     4.3.4  正定矩阵和负定矩阵
     *     4.3.5  裘氏分解

*                          本节命令
*-------------------------------------------------------
* rank(), mat symeigen, mat eigenvalues, cholesky()
*-------------------------------------------------------


*_____________________________________
*-4.3.1  线性相关、线性独立和正交向量

 * 线性相关和独立
 
   * 矩阵 A = [A1, A2, ..., An]
   
   * 对于 c1*A1 + c2*A2 + ... + cn*An = 0 (ci为常数)
   
   * 若存在一组系数 c1,c2,...,cn 使得上式成立，则称 A1,A2,...,An线性相关；
   
   * 反之，称其线性独立。
   
 * 正交向量
   
   * 若 Ai'*Aj = 0,(i!=j),则称向量 Ai 与 Aj 正交  

   

*______________________
*-4.3.2  矩阵的秩(rank)

 * rank(A) = min(行向量中线性独立的个数，列向量中线性独立的个数)
 
 * 含义：彼此线性相关的两个变量并不能提供更多的信息，
 *       如，薪水、基本工资、奖金，给定任意两个变可计算出第三个
 
   mata
     A = (1,2,3 \ 3,2,1)'
     A
     rank(A)
     B = (1,2,3 \ 3,2,1 \ 4,4,4)'
     B
     rank(B)
   end
   
   *- 由于 matrix 环境下没有直接计算 rank() 的函数，
   *  这里使用了 mata 语句

   

*__________________________
*-4.3.3  特征根和特征向量

  *=定义： 
  *
  *   给定方阵 A，若能找到行向量 h 和一个单值 e, 使得
  *                      A*h = e*h
  *   成立，则称 h 为 A 的特征向量，而 e 为 A 的特征根。

  *=含义：
  *
  *   相当于把矩阵的一个方向分解出来，而 A 可能包含 n 个方向
  *   即，特征根：Lamda=(e1,e2,...,en); 特征向量：H=(h1,h2,...,hn)

  *=性质：
  *
  *  (1) rank(A) = 非零特征值的个数(如果有一个特征值为0，则矩阵非满秩)
  *
  *  (2) det(A)  = 特征值的乘积 = e1*e2*...*en
  *
  *  (3) trace(A)= 特征值的和 = e1+e2+...+en
  *
  *  (4) inv(A) 的特征值为 1/e1, 1/e2, ..., 1/en

  *=Stata操作： 
  *
  * -语法格式： 
  *
  *   非对称方阵：mat eigenvalues 特征根实部 特征根虚部 = 矩阵名
  *   对称方阵：  mat symeigen    特征向量名 特征根名   = 矩阵名 

  *-eg1：非对称矩阵
    matrix A = (23,12,-9 \ 2,4,-6 \ 5,1,3)
    dis det(A)
    mat eigenvalues H Lamda = A
    mat list H        // 特征根实部
    mat list Lamda    // 特征根虚部

  *-eg2：非满秩对称矩阵
    mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
      mat list A
      dis det(A)
	  
    mata   // 矩阵 A 的 rank
      A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
      rank(A)
    end
	
    mat symeigen H Lamda = A
      mat list H,format(%6.2f)      // 特征向量
    mat Lamda = diag(Lamda)
      mat list Lamda
      mat list Lamda,format(%5.4f)  // 特征根
    
 
  *-eg3：满秩对称矩阵
    mat A = (12,35,-13 \ 35,108,0.3 \ -13,0.3,42)
      mat list A
    mat symeigen H L = A
      mat list L       // 特征根
      mat list H       // 特征向量


   *-验证上述性质：
 
    *-秩(rank) 3
      mata
	    A = (12,35,-13 \ 35,108,0.3 \ -13,0.3,42)
	    rank(A)
	  end
   
    *-横列式(determine)
      dis det(A)
      dis L[1,1] * L[1,2] * L[1,3]
     
    *-对角和(trace)
      dis trace(A)
      dis L[1,1] + L[1,2] + L[1,3]
     
    *-逆矩阵的特征根：练习一下吧

 
*__________________________   
*-4.3.4 正定矩阵、负定矩阵

  *-定义：
  *   给定 n*n 正方矩阵 A 和`任意' n*1 向量 x，矩阵的二次型定义为：
  *             x'Ax  (一个单值)
  *  A 正定：  若 x'Ax > 0
  *  A 负定：  若 x'Ax < 0 
  *  A 半正定：若 x'Ax >= 0
  *  A 半负定：若 x'Ax <= 0
 
    sysuse auto, clear
	reg price wei len fore 
	mat V  = e(V)     // 正定
	mat NV = -V       // 负定
	mat list V
	
	mat x = matuniform(4,1)   // 验证 V
	mat xVx = x'*V*x
	mat list x
	mat list xVx
	
	mat x = matuniform(4,1)   // 验证 NV
	mat xNVx = x'*NV*x
	mat list x
	mat list xNVx	
	
	
	
*__________________   
*-4.3.5 裘氏分解

  *-裘氏分解(cholesky factorization) 
  * 相当于矩阵开根号
  * ！只有正定对称矩阵才可进行此分解
  
    mat A = (23,12,-9 \ 2,4,-6 \ 5,1,3) // 非对称
    mat chA = cholesky(A)
    mat A = (1,2,3,4,5 \ 2,3,4,5,6 \ 3,4,5,6,7 \ 4,5,6,7,8 \ 5,6,7,8,9)
    mat chA = cholesky(A)               // 非正定

    mat A = J(4,4,1) + 3*I(4)   // 正定且对称
    mat B = cholesky(A)         //  A=B*B'          
	mat BT = B'
    mat list A             
    mat list B       // B
	mat list BT      // B'
    mat AA = B*B'       
    mat list AA
 
 *- 应用实例：OLS 估计值的标准误
    sysuse auto, clear
    reg price wei len
    mat list e(b)
    mat list e(V)
    *- Q: 如何利用方差-协方差矩阵 e(V) 计算出各个系数的标准误？
    *- A: s.e. 其实就是 e(V) 矩阵中对角线元素的开方
       mat V = e(V)
         mat list V
       mat se2 = vecdiag(V)
         mat list se2
       mat se2 = diag(se2)
         mat list se2
       mat se = cholesky(se2)
         mat list se
       reg, nohead    // 检验一下
    *- 一条命令即可搞定：
       mat ss = cholesky(diag(vecdiag(e(V))))
         mat list ss
    
    *- 练习：如何根据 e(b) 矩阵和 se 矩阵求取 t 值？
    *- 提示：t[j] = b[j] / se[j]
	   mat b = e(b)
	   mat t = diag(b)*inv(se)
	   mat list t
       



*---------------------------
*-4.4  有关矩阵的进一步说明
*---------------------------

     *       ==本节目录==

     *     4.4.1  矩阵函数
     *     4.4.2  返回系统中的矩阵
     *     4.4.3  定义约束矩阵
     *     4.4.4  矩阵与暂元的相关操作
     *     4.4.5  矩阵对内存的需求
     
     
  *_________________   
  *-4.4.1 矩阵函数
  
    help matrix functions


  *_________________
  *-4.4.2 返回系统中的矩阵     -matrix get-
  
    help matrix get
    
    sysuse auto, clear
    regress price weight mpg
    matrix list e(b)
    matrix list e(V)

    matrix b = get(_b)     // 估计系数向量
    matrix V = get(VCE)    // 方差-协方差矩阵
    matrix list b
    matrix list V

    test weight = 1, notest
    test mpg = 40, accum
    matrix rxtr = get(Rr)  // 约束条件矩阵
    matrix list rxtr


  *__________________________________
  *-4.4.3 定义约束矩阵(用于假设检验)
  
    *-Wald 检验中，约束条件通常表示为
    *
    *   R*b = r
    *
    * 如，对于模型 y = [x1 x2 x3 x4]*(b1 b2 b3 b4)' 
    *    x1-x3 = 2.8
    *    x2-x3 = 0
    * 这两个约束条件可表示如下：
    *
    *  [ 1  0  -1  0 0  ] [b1]    | 2.8 |     
    *  [ 0  1  -1  0 0  ] |b2|  = |  0  | 
    *                     |b3|  
    *                     [b4]
    *
    * -mat_put_rr- 命令用于定义矩阵 z = [R b]
    
      sysuse auto, clear
      regress price  wei len mpg foreign
      mat z = (1,0,-1,0,0,2.8 \ 0,1,-1,0,0,0)
      mat_put_rr z
      test
	  
	  *-等价于
		test wei - mpg = 2.8
		test len = mpg, accum

		

  *______________________________
  *-4.4.4  矩阵与暂元的相关操作

    help matmacfunc
  
    sysuse auto, clear
    mkmat price wei len turn, mat(A)
    local rnames: rowfullnames A
    local cnames: colfullnames A
    dis "`rnames'"
    dis "`cnames'"

    sureg (price foreign weight length)   ///
          (mpg foreign weight turn)       ///
          (displ foreign weight)
    mat b = get(_b)
    local rn: rownames b
    local cn: colnames b
    dis "`rn'"
    dis "`cn'"
	
	*-应用：参见第二讲 A2_data 第 2.7.4 小节：样本的堆砌 (Line:1986)
	


  *-4.4.5 矩阵对内存的需求
                                                                         /*   
                            表4-1 不同版本下参数的设定
      +-------------------------------------------------------------------+
      |           |  -- Intercooled Stata --  |  ------- Stata/SE ------  |
      | Parameter |  Default     min     max  |  Default     min     max  |
      |-----------+---------------------------+---------------------------|
      | maxvar    |    2,047   2,047   2,047  |    5,000   2,047  32,766  |
      | matsize   |      200      10     800  |      400      10  11,000  |
      | memory    |       1M    500K     ...  |      10M    500K     ...  |
      +-------------------------------------------------------------------+

                         表4-2 矩阵大小对内存的需求
                       +--------------------------+
                       |  matsize  |  memory use  |
                       |-----------+--------------|
                       |      400  |      1.254M  |
                       |      800  |      4.950M  |
                       |    1,600  |     19.666M  |
                       |    3,200  |     78.394M  |
                       |    6,400  |    313.037M  |
                       |   11,000  |    924.080M  |
                       +--------------------------+
                                                                           */
  
  *-设定矩阵的默认尺寸
                                                                          
    set matsize 200
    mat a = J(300,1,0)   // 错误
    set matsize 400
    mat a = J(300,1,0)   // 正确



* --------------------- over --------------------


