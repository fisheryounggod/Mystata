      
   *- ��ϰ01
   *- ĳ��ĳ�µ�ĳһ��
      
     cap log close
     log using mylog01.log, replace
      
       sysuse nlsw88, clear
       desc
       summ
       regress wage hours ttl_exp
      
     log close
     exit
