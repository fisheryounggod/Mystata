
 sysuse uslifeexp, clear

 gen diff = le_wmale - le_bmale
 label var diff "��������"

 #delimit ;  
   twoway (line le_wmale year, yaxis(1 2) xaxis(1 2))
          (line le_bmale year)
          (line diff  year)
           ,
             ylabel(0 20(10)80,     gmax angle(horizontal))
             ylabel(0(5)20, axis(2) gmin angle(horizontal))
             xlabel(1918, axis(2)) 
               title("ͼ2�����˺ͺ���Ԥ������")
               subtitle("����, 1900-1999")
               ytitle("Ԥ������ (��)")
               xtitle("���")
               ytitle("", axis(2))
               xtitle("", axis(2))
             note("������Դ:  ����������Ҫͳ�����ϱ���, ��5��-��6��"
                  "(1918 �޽� Դ��1918��ȫ�������и�ð)",linegap(1.2))
             legend(label(1 "��������") label(2 "��������") 
                     rows(1) size(small));
      
         #delimit cr




















