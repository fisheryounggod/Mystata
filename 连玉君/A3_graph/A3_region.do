
    sysuse auto, clear
 
    scatter mpg weight,  ///
       graphregion(fcolor(green*0.8)) ///
       graphregion(ifcolor(yellow))   ///
       plotregion(fcolor(black*0.3))  ///  
       plotregion(ifcolor(white))     ///
       title("Title��ȫͼ���� (inner graph region)") ///
       xtitle("Xtitle����������")      ///
       ytitle("Ytitle: ��������")      ///
       note("Note��(1) ��ɫ���ֳ�Ϊ����ͼ������(outer plot region)"   ///
      "            (2) ��ɫ���ֳ�Ϊ��ȫͼ������(outer graph region)") ///
       caption("Caption��������������������ʾģʽ(scheme)�����ݵĶ���")    ///
       text(30 3500 "��ͼ���� (inner plot region)", ///
            color(blue)  size(*1.5)) 
