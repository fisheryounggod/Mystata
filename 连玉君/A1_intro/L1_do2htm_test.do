
* Ӧ�� -do2htm- ����������ҳ

   cd `c(sysdir_personal)'Net_course_A\A1_intro

   sysuse auto, clear      // -> Note1: ��������

   sum                     // ����ͳ����

   d,d                     // �����ſ�����
  
*- ����һ��ͼ��
     #delimit ;            // -> ע��˴��Ķ��з���
      grss twoway (scatter price wei)
           (lfit price wei),
           title("ɢ��ͼ���������ͼ");
     #delimit cr

*- �ٻ���һ��ͼ��
     sysuse nlsw88, clear
     gen lnwage = ln(wage)
     grss histogram lnwage, normal
     
