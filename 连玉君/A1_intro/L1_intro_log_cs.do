

      
*- �����й�˾�ʱ��ṹӰ�����ص�ʵ֤������һ�ĵ����ݴ����ģ�͹���
*- 2008.10.10 (with Zoufan)     
      
  *cd D:\stata11\ado\personal\Net_course_A\A1_intro
  cd `c(sysdir_personal)'Net_course_A\A1_intro
  
  cap log close
  log using paper01, text replace 
      
      
  *- �����й�˾�ʱ��ṹӰ�����ص�ʵ֤������ 
  *- 2008.10.10
      
  *--------------
  * -1- ���ݴ���
  *--------------
     use xtcs.dta, clear
     tsset code year
     xtdes
     winsor tl, gen(tl_w) p(0.01)
     winsor tobin, gen(tobin_w) p(0.01)
         
  *----------------
  * -2- ����ͳ����
  *----------------
     local xx "tl sl size ndts-tobin"
     tabstat `xx', stat(mean sd min p50 max) format(%6.3f) c(s)
      
  *--------------
  * -3- �ع����
  *--------------  
    *- Pooled OLS
       reg tl size ndts tang npr tshr tobin, robust
       est store ols
    *- FE
       xtreg tl size ndts tang npr tshr tobin, fe robust
       est store fe
    *- RE
       xtreg tl size ndts tang npr tshr tobin, re robust
       est store re    
       
    *- ���ֽ��
       local m "ols fe re"
       esttab `m', mtitle(`m') compress nogap b(%6.3f)  ///
              scalars(r2_a N F) star(* 0.1 ** 0.05 *** 0.01) 
    
	*- ����� Excel �ĵ� 
       local m "ols fe re"
       esttab `m' using R.csv, replace                  ///
	          mtitle(`m') compress nogap b(%6.3f)       ///
              scalars(r2_a N F) star(* 0.1 ** 0.05 *** 0.01) 
			  
  log close
  exit
  
  
  
* �д����ƵĹ�����
  * (1) ģ��ɸѡ��
  * (2) �Ƚ��Լ��飻
  * (3) ����ʹ�ö�̬ģ�ͽ��з���
       
       
       
