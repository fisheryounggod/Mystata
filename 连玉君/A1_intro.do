



          *     -------------------------------------
          *     -------- ����������STATAӦ�� --------
          *     -------------------------------------
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *           ��һ��  STATA���
          *         =====================
	  
		  
   * cd D:\stata11\ado\personal\Net_course_A\A1_intro
   
	 cd `c(sysdir_personal)'Net_course_A\A1_intro
  
  
*----------------
*    ����Ŀ¼
*----------------
* 1.1  ���γ̼��
* 1.2  STATA��ò
* 1.3  ����͵������� 
* 1.4  �洢�͵�������  
* 1.5  �������     
* 1.6  ִ��ָ��
* 1.7  �޸�����
* 1.8  log �ļ�: ��¼��ķ������� 
* 1.9  do �ĵ�: ��Ч��ݵ�ִ������
* 1.10 stata��Excel��Word��LaTeX�����ܽӴ�  
* 1.11 Stata �趨



































          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
          *         -1.1-  ���γ̼��

		  
   
          
*------------------------
*->  Stata �Ǻη���ʥ��
*------------------------

   * ��С����

   * �����ٶȼ���

   * ��ͼ����׿Խ

   * ���ºͷ�չ�ٶȾ���


   
*--------------------
*-> 1.1  ���γ̼��
*--------------------

          *     ==����Ŀ¼==

          *     1.1.1 �γ̸�Ҫ
          *     1.1.2 �γ��ص�
          *     1.1.3 �γ���������
		  *     1.1.4 �γ��������ϵ�ʹ�÷���
          *     1.1.5 ���ۺͽ���
 
		  
*__________________
*  1.1.1 �γ̸�Ҫ

                                             /*
  ��һ���֣�Stata ����
    1��Stata���
    2�����ݴ���
    3��STATA��ͼ
    4����������
    5��STATA��̳���

  �ڶ����֣�����������StataӦ��(STATA�߼��࣬�ѷ���)
    1����ͨ��С���˷���OLS��
    2��������С���˷���GLS��
    3����������С���˷���NLS��
    4�������Ȼ���ƣ�MLE��
    5�����߱������� GMM
    6��ʱ�����з���
    7���������ģ��
    8. Stata�߼�����
    9. Monte Carloģ���� Bootstrap(�Գ���)

  �������֣�Stata Ӧ��ר��(��������)
    1�� Mata ���߼�����
    2.  Logit/Probit ģ��
    3.  Tobit ģ��
    4.  Duration ģ��
    5.  �¼��о���
    6.  Treatment ЧӦģ��(Heckman, DID, PSM ��)
    7.  ��λ���ع�ģ��
    8.  һ�㻯���Իع�ģ��(GLM)
    9.  ��Ԫ�б����(discrim)
    10. ���ӷ����;������
	11. �������
	12. ����ع��� GMM ���
	13. Panel Data B(�ż����\Panel VAR\Panel�������̵�)
                                             */

*__________________
*  1.1.2 �γ��ص�

   * ϵͳ����Ľṹ���ţ����������ٽ���Stata��ѧϰ�ܹ�
   
   * ע����ʵ��Ӧ������
   
   * ��ʵ����������
    
	 *-������� do-file �Լ� PDF ��ʽ 



*______________________
*  1.1.3 �γ���������

   *-���γ���ʹ�õ� do �ĵ��� ado �ĵ�
   
     *-stata do-file ��ʽ���ɹ���ϰ����
	   cd D:\stata11\ado\personal\Net_course_A
	   doedit A1_intro.do
	  *-or
	   doedit D:\stata11\ado\personal\Net_course_A\A1_intro.do
	 
	 *-PDF ��ʽ���ɹ���ӡ
	   cd D:\stata11\ado\personal\Net_course_A\pdf_dofiles
	   shellout  A1_intro.pdf 
	   
	 *-�γ̵���ϸĿ¼�����ٲ�ѯ
	   shellout  Course_A_contents.pdf
	   
   
   *-��������
     cd D:\stata11\ado\examples  \\�������ڴ˴�
	 cdout
   
   * ���ڵ�½�����������ѵ�ѧԱ���ṩSTATA�ٷ��������ݰ�
   
   * STATA�ⲿ�������plus(500����)
     ado  // �����Ѿ���װ���ⲿ����
   
		 
*________________________________
*  1.1.4 �γ��������ϵ�ʹ�÷���

   *-1.1.4.1 �γ��������ϵĴ��λ��
   
     *-�����ṩ��ѹ������ֻ���ѹ������� D �̸�Ŀ¼�¼���
	 * ע�⣺D:\stata11 ���� D:\stata11\stata11
	 
	 *-�����Լ���stata��������������趨:
	 
	 * (1) profile.do �ļ�������stata��װĿ¼�£�
	 *     �� D:\stata11\profile.do
	 *     ע�������Ѿ������趨�˸��ļ���
	 *         �뽫�ҵ�profile�ļ��ϲ�������ļ���
	 
	 * (2) ���´� stata���������ļ��趨���������ʾ
	 *     ��running D:\stata11\profile.do ...��
	 
	 * (3) ���� sysdir �������ʾ������Ϣ
	 *
     *      STATA:  D:\stata11\
     *    UPDATES:  D:\stata11\ado\updates\
     *       BASE:  D:\stata11\ado\base\
     *       SITE:  D:\stata11\ado\site\
     *       PLUS:  D:\stata11\ado\plus\     // ��ź������ⲿ�����λ��
     *   PERSONAL:  D:\stata11\ado\personal\ // �����ļ���
     *   OLDPLACE:  D:\stata11\ado\myado\    // �Լ���д�ĳ���


   *-1.1.4.2 ��δ��������� (do-files)
     
	 *-����1�����ε�� 
	 *   "New do-file editor"-->File-->Open ָ������·��
	 *    ������ doedit��Ȼ���� File-->Open
	 *     D:\stata11\ado\personal\Net_course_A
	 *     ˫�� A1_intro ����
          
     *-����2������������������
        cd D:\stata11\ado\personal  //����Ļ���·���ʾ��·�����ڴ˴�����ʡ��
	    cd Net_course_A
        doedit A1_intro.do 
	  *-or
	   doedit D:\stata11\ado\personal\Net_course_A\A2_data.do
	   
	 
   *-1.1.4.3 ���ڷ�������
     
	 *-stata�ٷ��ķ�������
	 
	   help dta_contents  // (File-->Example Datasets)
	   
	   *-ע�������Ѿ����أ������ D:\stata11\ado\Examples
	   * �򿪷�ʽ�FFile-->Open-->D:\stata11\ado\Examples
	   
     *-���γ̵ķ�������
        cd D:\stata11\ado\personal\Net_course_A\A1_intro
		cdout
		dir *.dta
   
   
*______________________
*  1.1.5 ���ۺͽ���

   *-�˴���̳�������桿֮��STATAר�桿��
     view browse "http://www.pinggu.org/bbs/forum-67-1.html"
	  
   *-�˴���̳��ͳ�������ѵ��VIP���ߴ�������
   *       http://www.pinggu.org/bbs/forum-114-1.html
     view browse "http://www.pinggu.org/bbs/forum-114-1.html"
      
   * ��Arlion �Ĳ��͡�http://blog.cnfol.com/arlion
   *       �ڰٶ��������ؼ��� ������� ���͡�
     view browse "http://blog.cnfol.com/arlion"
	 
   * ��E-mail��: arlionn@163.com
   
   * ���������ҳ����
     view browse   ///
	 "http://www.lingnan.net/intranet/teachinfo/dispuser.asp?name=lianyj"
   
   *-�������μ� 1.11.1 С��
   
 



   






   

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
          *        -1.2- STATA ��ò
		  *        -1.3- ����͵�������
          *        -1.4- �洢�͵�������
  
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	  
	  
*-------------------
*-> 1.2  STATA ��ò 
*-------------------

              *     ==����Ŀ¼==

              *     1.2.1 stata����       
              *     1.2.2 �״�ʹ��STATA��һЩ�����趨

			  
*__________________________
* 1.2.1 STATA����

   * �ĸ����ڣ�����˵���

   *_____________________
   * ����ִ������ķ�ʽ
     
     * ��һ�֣��˵�
	 
     * �ڶ��֣�����
      
     * ʵ�� 1->
     *   һ�ݼ򵥵� do �ĵ�
         doedit L1_intro_log_cs.do
		 
		 *-�� do�ĵ���ִ������Ŀ�ݷ�ʽ��Ctrl+D
     
     * ʵ�� 2->
     *   �����,�Ӿ���.�й����й�˾�ʱ��ṹ��̬���������о�.
	 *                               �Ϸ�����,2007(1):23-38.
         doedit L1_intro_NFJJ.do
	  
		  
*____________________________________        
*- 1.2.2 �״�ʹ��STATA��һЩ�����趨  

   *-����ʹ��ʱ����ƫ�õ��趨 
   
      help window manage
	  
   * -�趨����  
   *    Edit-->Preference-->General Preference ��ϲ���趨
   *    ע���ɽ�һ���趨ͼ��ƫ�á�do-editor�ķ���
   
   * -�����趨
   *    Edit-->Preference-->Save...-->New... ��������һ�����ƣ��� song12
       window manage prefs save song_12
	
	
   * -�������еĽ���ƫ���趨�� 
   *    Edit-->Preference-->Load...-->ѡ����ϲ�����趨
       window manage prefs load song_12
	   
	   
   *-stata11 �����ĵ�֧������
   
   *  -[Results]����
   *    Edit-->Preference-->General Preference Results Color 
   *    ѡ�� "Classic"
   *    ��˿��Ա�֤-Results-�����е������ַ�����������ʾ
   
   *  -[help viewer]����
   *    Edit-->Preference-->General Preference Viewer Color 
   *    ѡ�� "Custom 1"
   *    ȥ������ "Bold" ǰ��ĶԹ�����˿ɱ�֤help�ļ�������ʾ
   
   
   *-Stata11 �ֲ���趨
   *    �뽫stata11�ֲ�(16��pdf�ĵ�)������ D:\stata11\utilities
   *    ʹ�÷���1��Help > PDF Documentation �ɴ�����PDF����
   *    help regress --> [section]Also see --> Manual:[R] regress
        help regress 
		

   *-�ļ�Ŀ¼
      pwd                          // ��ʾstata��ǰ������·��
      cd D:\stata11\ado\personal   // ����ָ���ļ���
	  sysdir                       // stata�ٷ��ļ���·��
	  doedit D:\stata11\profile.do // ÿ������ʱ��Ҫ����ִ�е�����
	  * �����1.11.2 С��
	  
	  
	  
	  
   

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
		  *        -1.3- ����͵�������
          *        -1.4- �洢�͵�������
		  
* ʵ֤�����ĵ�һ�������ݴ���
* �ռ����ݡ��洢���޸ġ�������������
		  
*----------------------
*-> 1.3 ����͵�������  
*----------------------

     *     ==����Ŀ¼==

     *     1.3.1 �ֶ�����
     *     1.3.2 �� .txt, excel �����ճ��
     *     1.3.3 ʹ��stata���infile, insheet, infix
     *         1.3.3.1  ��-tab-�ָ������ݣ�  -insheet- ����
     *         1.3.3.2  �� �ո� �ָ������ݣ� -infile- ����
     *         1.3.3.3  ����STATA��ʽ�����ݣ�-use- ����
     *         1.3.3.4  ����Excel��ʽ�����ݣ�-xmluse-����
     *         1.3.3.5  ���жԵ�������
     *     1.3.4 ʱ���������� 
     *     1.3.5 �������
     *     1.3.6 STATA�ٷ��ṩ������
     *     1.3.7 ��������е�����


*                  =��������=  
* ================================================
* input, infile, insheet, type, rename, xpose, cd
* dataout
* ================================================


*____________
* ���ַ�ʽ��

  *   �ֶ�����
  *   �� txt �� Excel �ĵ���ճ��
  *   ʹ�� Stata ����


*__________________________
*-1.3.1 �ֶ����� (����ʹ��) 

   clear
   input x y z
         1 2 3
         4 5 6
   end
   save mydata, replace  // ��������
   use  mydata, clear    // ��������
   
   
  *-1.3.1.1  -clear- �����ʹ�� (stata11 �������书��)
    
	*-stata�����ԭ��(�ڴ��ʹ��)
	
	*-�ڴ��д洢������
	  sysuse auto, clear
	  des
	  label list
	     clear             // ע��Variables���ڵı仯
	     label list
	  
	  sysuse auto, clear   // clear ����Ӱ��Ӳ���ϴ洢������
	  
	  sum price weigh turn
	  return list          // �ڴ��д洢��ͳ�ƽ��
	  
	  reg price weight turn foreign
	  ereturn list         // �ڴ��д洢�Ļع���
	  
	     clear results
		 ret  list
		 eret list
	
	  matrix A = I(5)
	  mat list A
	  mat dir
	     clear matrix
		 mat dir
		  


*_________________________________      
*-1.3.2 �� .txt, excel �����ճ��     

* ����Ҫ��������-Tab-���ָ���

    shellout d1.txt  // -tab-���ָ������ݣ�����ֱ��copy-paste
    shellout d1.xls  // Excel��ʽ�����ݣ������ֱ��copy-paste 
    
	edit             // �����ݱ༭���������ɱ���֮
    

*___________________________________________________________
*-1.3.3 ʹ��stata���infile, insheet, infix, use, xmluse

  *-1.3.3.1 �� -tab- �ָ������ݣ� -insheet-
  
    type d1.txt                  // �鿴ԭʼ���ϵ���̬
    type d1.txt, showtabs
    shellout d1.txt
    insheet using d1.txt, clear

    type d11.txt                 // һ��û�б������Ƶ�����
    insheet using d11.txt, clear
    rename v1  price
    rename v2  weight 
    rename v3  length

    * �������������ʱ��ָ����������
      insheet price weight length  using d11.txt, clear
    

  *-1.3.3.2 �� �ո� �ָ������ݣ� -infile- 
  
    shellout d21.txt
    insheet using d21.txt, clear     
                      //�ո� �ָ��������޷�ֱ����-insheet-�����
    insheet using d21.txt, clear delimiter(" ") 
                      //��Ҫͨ�� delimiter ѡ��ָ�����ָ����š�
    infile v1 v2 v3 using d21.txt, clear  
                      //�ո� �ָ���������-infile-�����ȽϷ���*/

    * �������ֱ���������
      shellout d2.txt
      infile using d2.txt, clear        // ����ķ�ʽ
      infile v1-v5 using d2.txt, clear  // ���ֱ���ȫ�������ȱ©ֵ
      browse                            // ָ����������(����)
      infile str30 v1  int v2  int v3  int v4  str10 v5 ///
             using d2.txt, clear  
      browse                                  

    * ���� �ָ�������
      type d3.txt
      shellout d3.txt
      infile str30 v1 int v2 int v3 int v4 str10 v5 using d3.txt, clear


  *-1.3.3.3 ����STATA��ʽ������
  
    use d3.dta, clear
    use "D:\stata11\ado\Examples\XTFiles\invest2.dta", clear
    sysuse auto, clear
    
    *-˵����ʹ�� STATA9 �޷��� STATA10\11 �汾�´洢�����ݣ�
    *       ��ʱ�ɲ����ⲿ���� -use10- ��stata10�洢�����ݡ�


  *-1.3.3.4 ����Excel��ʽ�����ݣ�-xmluse-����
  
    *-ע�⣺��Ҫ�� file.xls ���Ϊ file.xml (�������ѡ��"XML���")
	
    dir *.xls
    shellout d1.xls
	
    xmluse d1.xls, doctype(excel) clear firstrow  // ����.xls ����
	
    shellout d1.xls    // "���Ϊ" -->XML��� �����ļ��Ĵ洢����
	
    dir d1.*   // ��ʾ��ǰĿ¼���� d1. ��ͷ�������ļ�
	
    xmluse d1.xml, doctype(excel) clear firstrow  // ��ȷ��.xml ����
	
    browse    // ��һ�����ݺܿ�Ϊʲô��
    des       // make �������Զ��洢Ϊ str244
	
    compress  // �������ϵĴ洢�ṹ
    des
    browse
	
	*-xmluse ������ѡ��
	  help xmluse


  *-1.3.3.5 ���жԵ�������   
  
    shellout d5.txt       // ��������    
    shellout d51.txt      // �Ե�����
	
    insheet using d51.txt, clear 
    browse
    xpose, clear          // �Ե�
    browse
	
    rename v1 year        // ������������
    rename v2 invest
    rename v3 income
    rename v4 consume


*_____________________
* 1.3.4 ʱ����������

  help tsset
  
  sysuse gnp96.dta, clear
  
  tsset date                         // ָ��ʱ�����
  
  gen gg = (gnp96-L.gnp96)/L.gnp96   // ������
  
  tsset, clear                       // ���ʱ�����
  
  gen gg2 = (gnp96-L.gnp96)/L.gnp96  // ����!


*_____________________
* 1.3.5 �������

  type d6_panel.txt
  insheet using d6_panel.txt, clear
  tsset code year    // stata8.0 ���°汾����
  xtset code year    // stata9.0 ���ϰ汾����
  
* xpose ����ͬ�������������������
  shellout d6_pdpose.txt 
  insheet using d6_pdpose.txt, clear
  xpose, clear
  list, sepby(v1)


*____________________________
* 1.3.6 STATA�ٷ��ṩ������

  help dta_contents
  help dta_examples
  help dta_manuals
  use http://www.stata-press.com/data/r9/educ99gdp.dta,clear
  webuse lifeexp, clear    // ��stata������ȡ����(�ȼ�����������)
  use http://www.stata-press.com/data/r10/lifeexp,clear


*________________________
* 1.3.7 �������������

  * -Stat/Transfer- �������ݵ��ڲ�ͬ������ݸ�ʽ֮��ת��
  * ��stata�ڲ�������ʹ�� -stcmd- ������� Stat/Transfer����������ݵ�ת��
  * ������Ҫת���������ݵ��û����ԣ���������ܺã��Ҿ��п��ظ���
  * �ɲ��� findit �����������������������
  
    findit usespss
  
  * -usespss- �� SPSS ��ʽ�����ݵ��� STATA
  
  * -fdasave- Save and use datasets in FDA (SAS XPORT) format
  
  * -usesas- �� SAS ��ʽ�����ݵ��� STATA 
  
  * -bugsdat- convert a Stata datafile into the S-plus format used in Winbugs

  * -Stata2mplus- Convert Stata files to Mplus files
  
  * -outdat- module to export data to other statistical packages
  *             such as LIMDEP, RATS, and SPSS
  
  * -dta2ras-, -ras2dta- ArcView/ArcInfo �� stata ����֮����໥ת��
    
  *-How do I convert among SAS, Stata and SPSS files?
  * http://www.ats.ucla.edu/stat/stata/faq/convert_pkg.htm


  
   
*----------------------
*-> 1.4 �洢�͵�������  
*----------------------   

    *     ==����Ŀ¼==

    *  1.4.1 �洢����
    *  1.4.2 ������ת��
    *      1.4.2.1 -outfile-��� ����Ϊ .raw �ı���ʽ
    *      1.4.2.2 -outsheet-�������Ϊ -Tab- �ָ����ı��ļ�
    *      1.4.2.3 -xmlsave-��� ����Ϊ XML ��ʽ
    *      1.4.2.4 -dataout-��� ����Ϊ Word,Excel,Tex
    *      1.4.2.5 -outdat- ��� ����Ϊ spss, rats, limdep ��ʽ  

  
*__________________
*- 1.4.1 �洢����

    shellout d3.txt
    infile str30 v1 int v2 int v3 int v4 str10 v5 using d3.txt, clear  
    save d3.dta, replace 
	
    * ע�⣺ͨ��ֻ���ڳ��ε�������ʱ������Ҫ����֮��
    *       �˺�Ĵ�����do-file�н��У�ֻ�豣��do-file���ɡ�
	

*___________________________________  
*- 1.4.2 ������ת��(���Ϊ������ʽ)

  *-1.4.2.1 -outfile-�������Ϊ .raw �ı���ʽ
  
      sysuse auto, clear
      outfile using myauto,replace 
	                         // ��Ϊ�ı���ʽ,�ո�ָ�,80�ַ�/��
      dir myauto*
      winexec notepad myauto.raw // ��������ı��ĵ���.raw��ʽ
	  
      *-ѡ���趨 [wide] ѡ��  
      outfile using myauto, wide replace 
	                       // ÿ���۲�ֵһ�У�û��80/�е����� 
      dir myauto*
      winexec notepad myauto.raw 
	  
      *-�������ֱ��� 
      outfile price-trunk foreign using myauto, wide replace 
      dir myauto*
      winexec notepad myauto.raw  
 	  
      
  *-1.4.2.2 -outsheet-�������Ϊ -Tab- �ָ����ı��ļ�
  
      sysuse auto, clear
      keep in 1/10
      outsheet price wei len using myauto, replace
      dir myauto*
      winexec notepad myauto.out
         
		 
  *-1.4.2.3 -xmlsave-�������ΪXML��ʽ
  
      sysuse auto, clear
      xmlsave auto, doctype(excel) replace 
      shellout auto.xml
	  
 
  *-1.4.2.4 -dataout-�������Ϊ Word,Excel,Tex
  
    *-������ǰ���� 
      sysuse auto, clear
      dataout, save(dataout01) excel replace
      dataout, save(dataout01) word replace
	  
	  keep make price weight rep78 gear foreign 
	  keep in 1/30
      dataout, save(dataout01) tex replace
    
	*-���������ļ���ת��
      shellout d1.txt 
      dataout using d1.txt, excel save(d1_excel) replace
      
      
	  
  *-1.4.2.5 -outdat- �������Ϊ .spss, .rats, .limdep ��ʽ    
      
	  help outdat





	  
	  
	  
	  

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
          *         -1.5-  �������

  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	  
	  
*-------------------
*-> 1.5   �������
*-------------------

         *     ==����Ŀ¼==
         
         *     1.5.1 ����������
         *     1.5.2 �鿴���ϵĽṹ
         *         1.5.2.1 ���ı����Ĵ洢����
         *         1.5.2.2 -list- �����ʹ��
         *         1.5.2.3 �����������ʾ��ʽ
         *         1.5.2.4 ���ݺͱ����ı�ǩ 
         *         1.5.2.5 ����˵������
         *         1.5.2.6 ��������
         *     1.5.3 ����ͳ����
         *         1.5.3.1 -summarize- ����
         *         1.5.3.2 -codebook- ����
         *         1.5.3.3 -inspect- ����
         *         1.5.3.4 �б�ͳ��(table, tabulate)
         *         1.5.3.5 ���ĸ�ʽ��ͳ�Ʊ��(tabstat)  
         *         1.5.3.6 ��ͳ�ƽ�������txt�ĵ���
   
   
*                    =��������=  
* ==================================================
* sysuse, use, describe, compress, label, summarize
* codebook, inspect, histogram, kdensity
* help, search, findit, recast, format
* ==================================================


*__________________
*-1.5.1 ����������

  *-��������
    * (1) ��ӢΪ��ĸ�����ֻ� _ ��ɣ����಻���� 32 ����
    * (2) ����ĸ����Ϊ ��ĸ �� _ ��
    * (3) Ӣ����ĸ�Ĵ�д��Сд���в�ͬ�ĺ��壻
  
  *-ʾ����  
    *  abc_1 a1 _a2 _Gdp_ ���Ǻ���ı�����
    *  5gdp 2invest ���ǣ�
  
  *-�ر�ע�⣺
    *  ���鲻Ҫʹ�� ��_�� ��Ϊ�����ĵ�һ����ĸ��
    *  ��Ϊ���stata���ڲ����������� _ ��ͷ�ģ�
    *  �磬_n, _N, _cons, _b �ȵȡ�
	
       help _variables


*_______________________
*-1.5.2 �鿴���ϵĽṹ

  sysuse auto, clear
  describe
  describe, detail
  
  * ��һ�����Ƶ�����
    help ds
    sysuse nlsw88.dta, clear
    ds
    ds, has(type int)
    
    ds, not(type byte)
    ret list
    dis "`r(varlist)'"  // ���ʱ���������ô˷���ֵ
    browse `r(varlist)'

    ds, detail
    

  *-1.5.2.1 ���ı����Ĵ洢����
  
    sysuse auto, clear
    list gear_ratio in 1/5
    d gear_ratio
    recast int gear_ratio, force
    d gear_ratio
    list gear_ratio in 1/5
    compress                // �Զ��������ϵĴ洢��ʽ 
  
  
  *-1.5.2.2 -list- �����ʹ��      -list-
  
    list price, sep(10)
    list price in 1/30, sep(0)
    sort rep78
    list make price rep78 in 1/20, sepby(rep78)
    list price weight length, noobs
    list price weight length, noobs clean
    

  *-1.5.2.3 �����������ʾ��ʽ     -format-
    
    * ��飺
      * str18    �����ͱ�����ÿ���۲�ֵռ��18���ո�
      * %-18s    ������ӡ����Ļ�ϣ���  %18s��������ӡ��
	  *                            �� %~18s, �������ӡ
      * %8.0g    �� `8.0' ��ԭ���£��Ծ��������Чλ���г�
      * %6.2f    �ܹ�ռ6���ո�С��λռ�����ո�
	  
    * ʾ����
      list price gear in 1/5
      format price %6.1f
      format gear  %6.4f
      list price gear in 1/5


  *-1.5.2.4 ���ݺͱ����ı�ǩ        -label-
      
    *-a ������ǩ
      sysuse auto, clear
      des 
      label data "����һ�������۸�����"
      des
      
    *-b �����ı�ǩ
      label var price    �����۸�
      label var foreign  "��������(1 ����; 2 ����)"
      des
      
    *-c �����������ֱ�ǩ(����-���ֶ�Ӧ��)  -label define-
      * label define ��ǩ��
      * label values ������ ��ǩ��  //������ֵ�ͱ�ǩ��ϵ����
      browse
      label define repair  1 "��" 2 "�Ϻ�" 3 "��" 4 "�ϲ�" 5 "��"
      label values rep78 repair
      browse
      
    *-d ��ǩ�Ĺ���  -labelbook-
      label dir
      label list
      label drop repair
      label list
      labelbook      // �Ƽ�ʹ��
      * ��һ������
        sysuse nlsw88, clear
        labelbook


  *-1.5.2.5 ����˵������   -notes-
  
    sysuse auto, clear
    note: Wang:��ȷ��-rep78-������ȱ©ֵ��ԭ��        
	                          // Ϊ�������ݼ�˵��
    notes
    note weight: Su, ע�⣬�ñ�����length�߶ȹ����ԣ� 
	                          // Ϊ����������˵��
    notes

  
  *-1.5.2.6 ��������   -lookfor-
  
    use nlswork_simple.dta, clear
    lookfor code
    lookfor wage
    lookfor married
    lookfor code married
    
    use d_lookfor.dta, clear  // ���ڴ������ݷǳ�����
    lookfor "�̶��ʲ�"
    lookfor "�ֽ���������" 
    lookfor "���"


*_____________________
*-1.5.3  ����ͳ����
  
  *-1.5.3.1 -summarize- ����
  
    sysuse auto, clear
    summarize 
    format price %6.2f
    sum price, format
    su  price wei, detail

	
  *-1.5.3.2 -codebook- ����
  
    codebook price weight
	
    codebook rep78        // ��һ�������еķ��ظ�ֵС��9��ʱ��
                          // Stata����Ӵ˱���Ϊ�����������б�ͳ��֮
				
				
  *-1.5.3.3 -inspect- ����
  
    inspect price weight length  // ����� codebook ����������һ�����Ƴ�ֱ��ͼ��
                                 // �Ա�������ķֲ��и�ֱ�۵��˽�
                             
							 
  *-1.5.3.4 �б�ͳ�� -table-, -tabulate-
  
    sysuse auto,clear
	
    tabulate foreign
	
    tab      rep78
	
    table    rep78
	
    tab   foreign rep78
	
    table foreign rep78, c(mean price) f(%9.2f) center row col

	
	
  *-1.5.3.5 ���ĸ�ʽ��ͳ�Ʊ��  -tabstat-
  
    sysuse auto, clear
	
    tabstat price weight length
	
    tabstat price weight length, stats(mean p50 min max) 
	
    tabstat price weight length, stats(mean med min max) ///
	                             col(s) format(%6.2f)
	
    tabstat price weight length, s(mean p25 med p75 min max) ///
	                             c(s) f(%6.2f)
	
    tabstat price weight length, s(mean sd p25 med p75 min max) ///
                                 c(s) f(%6.2f) by(foreign)

								 
  *-1.5.3.6 ��ͳ�ƽ�������txt�ĵ���   -tabexport-
  
    sysuse auto, clear
	
    tabexport turn trunk length using results.txt, ///
	      s(mean sd) replace
    shellout results.txt
	
    tabexport turn trunk length using results.txt,  ///
          s(mean sd) by(foreign) noreshape replace
		  
    tabexport turn trunk length using results.txt,  ///
          s(count mean sd) by(foreign) replace format(%3.0f %9.2f)
		  
    *-˵����format() ѡ���� s() ѡ�����Ӧ
      type results.txt
      shellout results.txt


*_____________________
*-1.5.4 ����ͼ�η���

  *-1.5.4.1 ֱ��ͼ: ����������ֲ����
  
    sysuse nlsw88.dta, clear
	
    histogram wage
	
    gen ln_wage = ln(wage)
    histogram ln_wage          // ����ת����������������̬�ֲ�
	
    histogram hours,frequency  // ������Ϊ��Ӧ�������������Ǳ���
    histogram ttl_exp, normal  // ������ñ��� N(u,s2) ����ֵ��ͬ����̬�ֲ�ͼ
	
    histogram grade      
    histogram grade, discrete  // ��ɢ������ֱ��ͼ���븽�� discrete ѡ��

	
	
	
  *-1.5.4.2 �ܶȺ���ͼ 
  
    kdensity wage              // ����ֱ��ͼ��ƽ������
    kdensity ln_wage, normal
	
 
  *-1.5.4.3 ɢ��ͼ
  
    sysuse auto, clear
    twoway scatter price wei
    scatter mpg turn
  
  
  *-1.5.4.4 ���ϵ������
  
    sysuse auto, clear
    graph matrix price wei len mpg



	
	
	

	
	

          *===================================
          *        ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
          *          -1.6-  ִ������ 
		  *          -1.7-  �޸�����
  
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	            
          
*-------------------
*-> 1.6   ִ������
*-------------------

         *     ==����Ŀ¼==
         
         *     1.6.1 ����
         *     1.6.2 ��������÷�Χ
         *         1.6.2.1 �оٶ������
         *         1.6.2.2 ������Χ������
         *     1.6.3 �������õ�������ʹ��ѡ��
         
         
*______________
*-1.6.1  ����
  
    * stata�����ͨ�ø�ʽ: command varlist [if] [in] [ , options] 
    * [if] [in] ��������������Χ 
    * [options] ����ѡ�������������ĵ���
  
       help sum                // ��������ļ�
     
       sysuse nlsw88, clear
       sum wage hours ttl_exp if race==2, detail
       list wage grade race in 1/100, sepby(race)
       
    *-�ر����ѣ�
      * (1) "[ ]" Ϊ��ѡ����Բ��������[]�е����ݶ�������д
      * (2) ���������¶���Ķ���ֻ��һ������ǰΪ�������壬�˺�Ϊѡ��
      *     ��Ȼѡ���п�������ѡ�����ѡ��ǰ�Ķ��Ų�δ����¶��
      * ���磺
        sysuse sp500, clear
        twoway line close date, title("���̼�", place(left))


*______________________
*-1.6.2 ��������÷�Χ

  *-1.6.2.1 �оٶ������
  
    sum age race married never_married grade
    sum age-grade
    sum s*           // "*" ������գ����Ա�ʾ`�κ�'���ȵ���ĸ������
    sum ?a?e         // "?" ����˽䣬ֻ�����`һ��'���ȵ���ĸ������ 

  *-1.6.2.2 ������Χ������
  
    sum in 10/20                       // ��10����20���۲�ֵ֮��Ĺ۲�ֵ
    sum wage in -5/-1                  // ����...
    sum wage hours if race == 1        // ����
    sum wage if race ~= 3              // ������
    sum wage if (race==2)&(married==1) // ��
    sum wage if (race==3)|(married==0) // ��
    sum wage if hours >= 40            // �����



*_________________________________
*-1.6.3 �������õ�������ʹ��ѡ��

    sum wage , d
    
    *-˵����stata֧�ֶ��������ѡ�����д��
    *       �����ļ��д��»��ߵĲ��ֱ�ʾ������д�ĳ̶�
    
    sysuse sp500, clear
    replace volume = volume/1000
    #delimit ;
        twoway (rspike hi low date)
               (line   close  date)
               (bar    volume date, barw(.25) yaxis(2))
                in 1/57
          , yscale(axis(1) r(900 1400))
            yscale(axis(2) r(  9   45))
            ylabel(, axis(2) grid)
            ytitle("�ɼ� -- ���, ���, ����",place(top))
            ytitle("������ (�����)", axis(2) bexpand just(left))
            xtitle(" ")
            legend(off)
            subtitle("S&P 500", margin(b+2.5))
            note("������Դ: �Ż��ƾ���");
    #delimit cr


	  
	
	
*-------------------
*-> 1.7  �޸�����
*-------------------

* Ŀ�ģ� 
*   (1) �����б�������������ת��
*   (2) �����µı���

         *     ==����Ŀ¼==
         
         *     1.7.1 ��ѧ���ʽ
         *     1.7.2 �����Ĵ������޸�
         *         1.7.2.1 �����Ĵ洢����
         *         1.7.2.2 �����±���
         *         1.7.2.3 �޸ľɱ���
         *         1.7.2.4 ɾ������������ֵ
         *         1.7.2.5 �ƶ����������б�����λ��
         *         1.7.2.6 ��¡���б���
         *         1.7.2.7 ��ֱ���
         *     1.7.3 ����ֵ������


*                     =��������=  
* =====================================================
* gen, replace, drop, order, aorder, move, sort, gsort, 
* assert, count, compare, encode, decode, recode, 
* note, notes, notes drop, char, char list
* =====================================================

*___________________
*-1.7.1 ��ѧ���ʽ

  * ���ࣺ��ϵ���㣻�߼����㣻��������

  * ��ϵ�����  ==;  >;  <;  >=;  <=;  !=;  ~=
    sysuse auto,clear
    list price if foreign == 0
    sum price  if foreign != 1

  * �߼�������� & -->(��) ;  | -->(��)
    sysuse auto, clear
    sum price wei if (foreign==1 & rep78<=3)
    sum price wei if (rep78==1) | (rep78==5) | (foreign !=0)
    sum price wei if (rep78>2 & rep78<5) | (price>10000)

  * �����������+ - * / ^(��)
    display 5^2
    dis     1 - 3*2 + 4/5 - 9^3 
    dis     2*_pi 


*_________________________
*-1.7.2 �����Ĵ������޸�

  *-1.7.2.1 �����Ĵ洢����

    *- �����Ĵ洢����
       * byte     �ֽ���     (-100, +100)
       * int      һ�������� (-32000, +32000)
       * long     ��������   (-2.14*10^10, +2.14*10^10)����������21�� 
	   
    *- С���Ĵ洢����
       * float    ������   8  λ��Ч����
       * double   ˫����   16 λ��Ч����
	   
    *- �ַ��ͱ���
       * str#     �� str20 ��ʾ�ñ��������� 20 ���ַ�
       *          ÿ������ռ�����ַ�
       sysuse auto, clear
       des 
       gen x = "�й�"     // һ������ռ�����ַ�
       des x
      
      
  *-1.7.2.2 �����±���      -generate-
  
    *-������ʽ
      sysuse auto, clear
	  
      generate price2  = price^2    // �ɼ�дΪ gen
      gen      price2f = price^2 if foreign==1
      gen      wlratio = weight/length 

	  
    *-��ѧ����ת��
	
       help math functions
	   
       sysuse nlsw88.dta, clear
	   
       gen ln_wage    = ln(wage)      // ȡ����
       gen sqrt_hours = sqrt(hours)   // ������
	   
       gen int_wage   = int(wage)     // ȡ��
       gen floor_wage = floor(wage)   // �ȼ���ȡ��
       gen ceil_wage  = ceil(wage)    // ȡ��������
	   
       list *wage in 1/5

	   
  *-1.7.2.3 �޸ľɱ���   -rename-, -renvars-,  -replace-
    
    *-��������������   -rename-
      rename displacement  disp
   
    *-�����޸ı������� -renvars-
      help renvars
	  sysuse auto, clear
      renvars price weight length  /  p wei len
      renvars p-wei, postfix(_new)  // �������Ӻ�׺
      renvars mpg , prefix(old_)       // ��������ǰ׺
      
	  
    *-�޸Ĺ۲�ֵ       -replace-
	
      sysuse auto, clear
      replace price = 10000 if (price>10000)
      gen byte  bad = 0      // ����ָ�����������Ǹ������ϰ��
      replace bad = 1 if (rep78>3)
      list rep78 bad
	  
      *-��Ϊ����Ķ��巽ʽ
        replace bad=. if (rep78==.)
        list rep78 bad
		
      *-���ֱ����۲�ֵ���޸�
         des make 
         list make in 50/59
         replace make="���� 320i" if (make=="BMW 320i") //Ҫ��˫����!
         list make in 50/59
      

  *-1.7.2.4 ɾ������������ֵ -drop-
  
    *- Stata�ٷ����� -drop-
       drop price2             // ɾ��һ������
       drop wlratio-bad2       // ɾ��һ�����
       list price in 1/5
       drop in 1/3             // ɾ��ָ������Ĺ۲�ֵ
       drop if (rep78==.)      // ɾ�������ض������Ĺ۲�ֵ
       list price in 1/5
       drop _all               // ɾ���ڴ��е����б���
  
  
    *- һЩ���õ��ⲿ����  -cap drop-; -dropvars-; -safedrop-
	
       *-cap drop-
         help capture
		          
		 capture drop price2
         gen price2 = price^2
         cap drop prcie wlratio bad2    // �ܷ�ɾ��������������
         gen wlratio = weight/length
    
       *-dropvars- 
         dropvars price2 wlratio bad2   // �ȼ���������������
           * cap drop price2
           * cap drop wlratio
           * cap drop bad2
         gen wlratio = wei/len
     
       *-safedrop-
         sysuse auto, clear
         drop forei
         sysuse auto, clear
         safedrop forei
         safedrop foreign gear_ratio
      

  *-1.7.2.5 �ƶ����������б�����λ�� -order- -aorder- -move-
     
     sysuse auto, clear
	 
     order price weight length foreign
	 
	 order trunk, before(weight) // ��trunk�Ƶ�weight֮ǰ
	    sysuse auto, clear
	    move trunk weight        // ����ͬ��,stata11��ǰ�汾����
		
	 order _all, alpha           // ����ĸ�Ա�������
        aorder                   // ����ͬ��,stata11��ǰ�汾����
		
     
  *-1.7.2.6 ��¡���б���  -clonevar-
    
    * �����б����ı�ǩ������-���ֶ�Ӧ����������ݶ����ƹ�ȥ
      help clonevar 
	  
      sysuse auto, clear
	  
      clonevar foreign_c = foreign
	  
      gen foreign_g = foreign
      sort mpg
      list foreign* in 1/10
      browse


  *-1.7.2.7 ��ֱ���      -separate-
      
      sysuse auto, clear
      separate mpg, by(foreign)
   
      * �ȼ۷�ʽ����û�б�����ǩ
        gen mpg_f = mpg if (foreign==1)
        gen mpg_d = mpg if (foreign==0)
        
        browse


*____________________
*-1.7.3 ����ֵ������    -sort-  -gsort- 

      sysuse nlsw88.dta, clear
	  
      sort wage                 // Ĭ��Ϊ��������
         list wage in 1/10
         dis "max = " wage[_N]
         sum wage
		 gen nag_wage = -wage
		 sort nag_wage          // ��������
		 
      gsort -wage               // ��������
         list wage in 1/10
		 
      gsort wage, gen(numb)     // ����������
         list numb wage in 1/10 
   

  
  
  
  
  
  
  
  
          *===================================
          *      ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
          *          -1.8- log �ļ� 
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	

*----------------------------------
*-> 1.8 log �ļ�: ��¼��ķ�������
*----------------------------------

         *     ==����Ŀ¼==
         
         *     1.8.1 log �ļ����
         *     1.8.2 �� log �ļ�ת��Ϊ��ҳ
         *         1.8.2.1 -log2html- �����������ҳ����ҳ
         *         1.8.2.2 -hyperlog- �������������͡���ҳ 
         *         1.8.2.3 �������� 
         
*____________________
*-1.8.1 log �ļ����

  * ��¼��ķ�������: log �ļ� 

    help log

    *- ʾ�� 1��
       doedit L1_intro_log_cs.do
       dir *.log
       shellout paper01.log
    
    *- ʾ�� 2��
	*
    *---------��¼��ʼ---------
	*
      cd D:\stata11\ado\personal\Net_course_A\A1_intro
      sysuse auto, clear
      
      log using mylog1.log, text replace // _mylog1.log_-begin-__ 
         dis "Part I��ͳ�Ʒ���"
         sum price weight length
      log close                          // _mylog1.log_-over-__   
      
         tab rep78  // ��Щ���������� log �ļ�
         des, detail
 
      log using mylog2.log, text replace // _mylog2.log_-begin-__ 
         tab rep78 foreign
         des price rep78 foreign, d
      log close                          // _mylog2.log_-over-__   
     *
	 *--------��¼����---------

	 shellout mylog1.log
	 
	 shellout mylog2.log


	 
*____________________________
*-1.8.2 �� log �ļ�ת��Ϊ��ҳ   

  *-  -log2html-, -hyperlog-, -autolog-, -logout-, -slog-
    
  *-1.8.2.1 -log2html- �����������ҳ����ҳ
    
    help log2html
    
    *-ʾ����
      cap log close
      log using mylog, replace
        sysuse nlsw88, clear
        desc
        summ
        regress wage hours ttl_exp
      log close
    
      *-ת��Ϊ��ҳ  
        log2html mylog, replace        // ת�� log --> ��ҳ
        shellout mylog.html            // ����ҳ 
        * ��Ҳ���Ե���ǰ�Ŀ¼�´� mylog.html �ļ�
     
      *-������ҳ����
        log2html mylog, replace title("������Ů����Ӱ�������о�")
        shellout mylog.html
        * ע�⣺
          * Ϊ���ܹ���ȷ��ʾ�����ַ������ڴ���ҳ�����ε����
          * "�鿴(V)"-->"����(D)"-->��������(GB2312) 
        
      *-�趨��ҳ���
        log2html mylog, replace input(ff3300) result(003333) bg(grey)
        shellout mylog.html
     

  *-1.8.2.2 -hyperlog- �������������͡���ҳ          
  
    help hyperlog
    
    doedit mylog.do         
    do mylog.do                             // ���� log �ļ�
    
    hyperlog mylog.do mylog01.log, replace  // ת��Ϊ��ҳ
    
    shellout mylog_hlog.html                // ע���ļ����ı仯


  *-1.8.2.3 ��������
  
    * -slog-     ���ɿ�Ƕ�׵� log �ļ������ڳ�����Ժʹ��� log �ļ�����д
    * -logout-   ��stata�����������Word��Excel��TeX�У�������
    * -autolog-  ��Ϊ��ݶ��� log �ļ������ڶ��� profile.do �����ļ�
    *            ���Լ������ profile.do �ļ��У�
	*            �Ѿ�������������ܣ��ʲ��ٽ���



	
	
  
  
          *===================================
          *      ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
		  *          -1.9- do  �ĵ�	
		  
	 cd `c(sysdir_personal)'Net_course_A\A1_intro
	
	
*------------------------------------
*-> 1.9  do �ĵ�: ��Ч��ݵ�ִ������
*------------------------------------

         *     ==����Ŀ¼==

         *     1.9.1 do �ĵ����
         *         1.9.1.1 �� do �ĵ��༭��
         *         1.9.1.2 ����͹ر�
         *         1.9.1.3 ִ�� do �ĵ�
         *     1.9.2 ����滮���do�ĵ�
         *         1.9.2.1 һЩ��������
         *         1.9.2.2 ע�����
         *         1.9.2.3 ����
         *         1.9.2.4 ���� do �ĵ����趨
         *     1.9.3 ��ӡ����
         *         1.9.3.1 -display-���� 
         *         1.9.3.2 ��ӡ����ɫ  
         *         1.9.3.3 ��ӡ��λ��  
         *     1.9.4  ���ڱ༭��
         *     1.9.5  do �ļ���ת��(������ҳ�̳�) 


      
*_______________________   
*-1.9.1 do �ĵ���� 


*-> ==����==

   *- do �ĵ�ʵ������Stata����ļ��ϣ���������һ����ִ�ж���stata����;
   
   *- do �ĵ���ʹ��ʹ���ǵķ����������п��ظ��ԣ�
   
   *- ��һƪ���µ�ʵ֤���������У�����ͨ�������ݵķ�������д�� do �ĵ���
   
   
  *-1.9.1.1 �� do �ĵ��༭��
  
    *- ���� 1��
       doedit             // �� do-editor
       doedit mylog.do    // ��һ���Ѵ��ڵ� do �ĵ�����ָ������·��        

    *- ���� 2��
    *  ���Rusults�����Ϸ�������������ť            
    
    *- �������ԣ�
       * Edit --> Preferences 
       * ����ѡ�� [Auto-indent] �� [Save before do/run]

	   
  *-1.9.1.2 ����͹ر�


  *-1.9.1.3 ִ�� do �ĵ�
    
    *-Case1��ִ��һ��������  
      *  ѡ����Ҫִ�е�������doedit�����еڶ��е�����һ��ͼ�ꡣ 
      *  ����ݼ�����Ctrl+D
      
         doedit L1_intro_do.do
    
    *-Case2������ִ��
         do L1_intro_do.do
         
  
    
*_________________________   
*-1.9.2 ����滮���do�ĵ�
   
  *-1.9.2.1 һЩ��������
   
    *-A. ��� do �ĵ��Ŀɶ���
    *
    *  gen z = z + y    is better than   gen z=z+y
    *
    *  gen z = x^2      is better than   gen z = x ^ 2
    *
    *  gen t = hours + minutes/60 + seconds/3600  
	*  is better than 
    *  gen t = hours + minutes / 60 + seconds / 3600
    *
    *  list price if (foreign==1) & (rep78>3)  
	*  is better than
    *  list price if foreign==1&rep78>3
   
    *-B. �Ͼ�Ͷ���
	*
    *  ÿһ�е���䲻Ҫ̫���������϶��·������������Ķ���
    *  ���δ������һ���������м��Էָ���
   
   
  *-1.9.2.2 ע�����
    
     help comments
    
    *-ʾ����
        * ��һ��ע�ͷ�ʽ
        sum price weight    /* �ڶ���ע�ͷ�ʽ */
        gen x = 5           // ������ע�ͷ�ʽ
    
    
   *-1.9.2.3 ���� 
     
     *-���ַ�ʽ�� ��///�� �� ��/* */�� �� #delimit ����
     
       *-��һ�ֶ��з�ʽ�� ///
         sysuse auto, clear 
         twoway (scatter price weight)       ///
                (lfit price weight),         ///
                title("ɢ��ͼ���������ͼ")
               
       *-�ڶ��ֶ��з�ʽ�� /* */
         twoway   (scatter price weight)      /*
               */ (lfit price weight),        /*
               */ title("ɢ��ͼ���������ͼ")   
              
       *-�����ֶ��з�ʽ�� #delimit ����
         #delimit ;
           twoway (scatter price wei)
                  (lfit price wei),
                  title("ɢ��ͼ���������ͼ");
         #delimit cr
         
         *-��һ��ϰ�ߣ�
           sysuse auto, clear
           #delimit ;
             des price wei;  sum price wei len;  reg price wei;
           #delimit cr
        
        
   *-1.9.2.4 ���� do �ĵ����趨 
   
     * �趨һ�����ļ������� N �����ļ����ֱ���ĳһ���ַ�������
     * ������ͬһ���ļ�����
     
           doedit L1_main.do    

    
*___________________
*-1.9.3  ��ӡ����
     
  *-1.9.3.1 -display-����
    
    dis 3 + 5*7 + sqrt(20)
	
    dis in g sin(_pi*0.5) + cos(0.9)
	
    dis _n(2) _dup(3) "I Love This GAME! "
    
    * ���������� " " �� `" "' ֮��
       display "This is a pretty girl!"
       dis     `"This is a "pretty" girl!"'
  
  *-1.9.3.2 ��ӡ����ɫ
    
    * ��ɫ1��red green yellow white
      dis in green "I like stata!"
      dis in w     "This " in y "is " in g "a " in red "pretty" in g " girl"
    
    * ��ɫ2��as text(��ɫ)| as result(��ɫ)| as error(��ɫ)| as input(��ɫ)
      dis as result "Stata is Good !"
     
     
  *-1.9.3.3 ��ӡ��λ��
  
     * ------------------------------------------
     *   ������  |             ����                   
     * ------------------------------------------             
     *   _col(#) | �ӵ� # ��ʼ��ӡ
     *   _s(#)   | ���� # ��ʼ��ӡ
     *   _n(#)   | �ӵ� # �п�ʼ��ӡ
     *   _c      | �´���ӡ������ӡ���������һ��
     *   _dup(#) | �ظ���ӡ # ��
     * ------------------------------------------
     
       display "Stata is good"
       display _col(12) "Stata is good"
       display "Stata is good" _s(8) "I like Stata"
       display _dup(3) "Stata is good�� "
       display "Stata is good","I like it"
       display "Stata is good",,"I like it"
       display _n(3) "Stata is good"
     
     * ����������ӡ��ʽ
       help smcl        // �����ڸ߼����ֻ�Դ�����ϸ����
       
     * -display-��һ�����ã�����
       display _newline(100)  
       
       
*___________________
*-1.9.4  ���ڱ༭��

    * �����ĵ���ϸ��������ΰ��ⲿ�༭����stata��ϵ����
      * http://fmwww.bc.edu/repec/bocode/t/textEditors.html#disclaim 
    * stata11
      * ��������(��LaTeX���)


*____________________________________
*-1.9.5 do �ļ���ת��(������ҳ�̳�)
 
   * -do2htm-   �ŵ����ڿ����Զ�����ͼƬ

     doedit L1_do2htm_test.do         // ����ִ��
     do2htm L1_do2htm_test, replace   
	              // �� do �ļ����� log ���ת��Ϊ html ��ҳ
   
   * ����ҳ
     dir *.htm
     shellout L1_do2htm_test.htm
     * ע�⣺
     *     Ϊ���ܹ���ȷ��ʾ�����ַ������ڴ���ҳ�����ε����
     *     "�鿴(V)"-->"����(D)"-->��������(GB2312) 
    
    
  
  
  
  
  
  
  
  
  
  
  
  
  
          *===================================
          *      ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *               ::��һ����::
          *                Stata ����
          * ============================================
          *             ��һ��  STATA���
          * ============================================
          *  1.10  stata��Excel��Word��LaTeX�����ܽӴ�
  
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro    
	
	
*---------------------------------------------
*-> 1.10  stata��Excel��Word��LaTeX�����ܽӴ�
*---------------------------------------------

         *     ==����Ŀ¼==

         *     1.10.1 ͳ�Ʊ�񡢾�������
         *          1.10.1.1  �������ͳ���� 
         *          1.10.1.2  ������ϵ������
         *          1.10.1.3  �������  
         *          1.10.1.4  ����˵��
         *     1.10.2 ���ƽ�������
         *          1.10.2.1  esttab ���ع����ĳ���
         *          1.10.2.2  logout ����� ��Excel��Word��TeX�ĵ���
         *          1.10.2.3  xml_tab��רҵ��� ��Excel �ĵ���
         *          1.10.2.4  outreg2��רҵ�����Word��Excel�ĵ���
         
  
  
*_____________________________
*-1.10.1 ͳ�Ʊ�񡢾�������       -logout-

  *-�����趨
    *  logout, save(filename) word(excel,tex) [options]:  ///
    *          ���ͳ�Ʊ�����ʾ���������
  
  
  *-1.10.1.1  �������ͳ���� 
  
            sysuse auto, clear 
            tabstat price wei len mpg rep78,        ///
            stats(mean sd min p50 max) c(s) f(%6.2f)   
    
    *- ��Word���ĵ�           
    logout, save(mytable) word replace:       ///  
            tabstat price wei len mpg rep78,  ///
            stats(mean sd min p50 max) c(s) f(%6.2f) 
            
    *- ��Excel���ĵ�        
    logout, save(mytable) excel replace:      ///
            tabstat price wei len mpg rep78,  ///
            stats(mean sd min p50 max) c(s) f(%6.2f) 
            
            
  *-1.10.1.2  ������ϵ������      
  
    logout, save(mytable) word replace:       ///
            pwcorr price wei len mpg rep78  
    logout, save(mytable) word replace:       ///
            pwcorr_a price wei len mpg rep78
            *-˵���� -pwcorr_a-������ Arlion ��д
  
 
  *-1.10.1.3  �������                

    mat a = I(10) 
    mat list a                                 
    logout, save(mytable) word replace:  ///
            mat list a, nohalf       
      
  
 *-1.10.1.4  ����˵��
      
   *- -logout- ż�����е�С����(�ո�)
      sysuse nlsw88, clear
      logout, save(mytable) word replace: tab occup 

   *- ��������
      * tabout �Ƚ�����������word�ĵ�Ϊ-tab-�ָ���
      *        ����ʹ�ñ���Զ����ù���
      * tabexport, mkcorr, tabform, tablemat, tabone 
      *        �����Ǻܺ���


	  
*________________________  
*-1.10.2  ���ƽ������� 
  
*         -esttab-, -logout-, -xml_tab-, -outreg2-
     
	 
  *-1.10.2.1  -esttab- ����ع����ĳ���
    
    sysuse auto, clear   
    reg price wei
      est store m1
    reg price wei len
      est store m2
    reg price wei len mpg foreign
      est store m3
      
   *-�����÷�    
     esttab m1 m2 m3 
    
   *-�޸�����ˮƽ�����յķ�ʽ���ֽ��
     esttab m1 m2 m3, ar2 compress nogap  ///
             star(* 0.1 ** 0.05 *** 0.01) 
            
   *-���� p-value������ "[]" ��    
     esttab m1 m2 m3, ar2 compress nogap  ///
             star(* 0.1 ** 0.05 *** 0.01) ///
             b(%6.3f) brackets p 
             
   *-���ֱ�׼��ϵ��
     esttab m1 m2 m3, beta
    
   *-��ʾ�����ı�ǩ�����Ǳ�����
     label var weight "��������"
     esttab m1 m2 m3, label
    
   *-���ֵ���ϵ��
     esttab m1 m2 m3, margin         // Ĭ������£���ȥ Constant
     esttab m1 m2 m3, margin constant
    
   *-����ļ���������ʽ
     esttab m1 m2 m3 using myout.html, replace // ��ҳ
	 
     esttab m1 m2 m3 using myout.tex, replace  // TeX �ĵ�
       * ����ĵ�����ֱ�Ӳ��� TeX �У����� \input{}
	     shellout mypdf.tex   // һ��ģ��
		 
     * ����������ͣ�smcl, fixed, tab, csv, scsv, 
	 *               rtf, html, tex, and booktabs
    
	
   *-����� Excel
     esttab m1 m2 m3 using myout.csv, replace
     esttab m1 m2 m3 using myout.csv, replace   ///
           compress nogap nonotes               ///
		   addnotes("*** 1% ** 5% * 10%" "" "")
     * ˵����
     *   (1) -esttab- �����Excel�ĵ�ʱ����ע������ˮƽ���ÿ������޸�֮
     *   (2) -addnotes()- ѡ���еĺ����� "" �ǿ����е���˼�����ں���׷��
    
     * �������ļ��Ļ�����׷���½��
       reg price wei, robust
         est store rob01
       reg price wei len, robust
         est store rob02
       reg price wei len mpg foreign, robust
         est store rob03
		 
       esttab rob01 rob02 rob03 using myout.csv, append    ///
            compress nogap b(%6.3f) scalars(r2_a N F)      /// 
            star(* 0.1 ** 0.05 *** 0.01) obslast           ///
            title(Robust check of the main results)        ///
            addnotes("The White(1980) robust regression" "" "") 
			
       * ˵����
       *   (1) �������о��ֳɶ�����֣����������׷�ӣ�
       *   (2) �����Ľ����Excel��ճ����Word������򵥵�������
       *   (3) using file.csv ����ָ���ļ��洢�ľ���·��
    


  *-1.10.2.2  -logout- ������ ��Excel��Word��TeX�ĵ���  
          
    *-�����趨
    *  logout, save(filename) word(excel,tex) [options]:  ///
    *          esttab ����
                      
    *-ʾ��
      sysuse auto, clear
	  
      * Excel �ĵ�
        logout, save(myreg) excel dec(3) replace:   ///
                reg price weight mpg rep78 foreign
				
      * Word �ĵ�
        logout, save(myreg) word dec(3) replace:    ///
                reg price weight mpg rep78 foreign
    
    *______________________________һ������������_________________________
    * 
      *-Step1������ģ�Ͳ��洢���
        sysuse auto, clear   
        reg price wei
          est store m1
        reg price wei len
          est store m2
        reg price wei len mpg foreign
          est store m3
        
      *-Step2��logout�������ֱ�������Word�ĵ���
        logout, save(mylogout) word replace fix(3):     /// //ע��ð��
             esttab m1 m2 m3, mtitle(ģ��1 ģ��2 ģ��3) ///
                    b(%6.3f) se(%6.2f)                  /// //ϵ������׼��
                    star(* 0.1 ** 0.05 *** 0.01)        /// //����ˮƽ�ı�ע
                    scalar(r2 r2_a N F) compress nogap  
    *_____________________________________________________________________                                             
      * ˵����
      *  (1) -fix(#)- ѡ�������ת�������жȣ������У�fix(3)Ч����� 
      *  (2) ���� -word- ѡ���������� Excel(-excel-) �� LaTeX ��(-tex-)
      *  (3) ���ƣ������-Word-�ĵ��Ƚ�����
      *  (4) ȱ�ݣ��޷�׷���µĽ����
	  *      ��Ҫ�������ֱ�洢����ͬ��-Word-�ļ��С�
    
	  *-������� TeX �ĵ��
        logout, save(mylogout) tex replace fix(3):     /// 
             esttab m1 m2 m3, mtitle(ģ��1 ģ��2 ģ��3) ///
                    b(%6.3f) se(%6.2f)                  /// 
                    star(* 0.1 ** 0.05 *** 0.01)        /// 
                    scalar(r2 r2_a N F) compress nogap  
        
       
  *-1.10.2.3  -xml_tab- ���רҵ��� ��Excel �ĵ���
  
    sysuse nlsw88, clear   
    reg wage hours married
      est store m1
    reg wage hours married ttl_exp south
      est store m2
    xi:reg wage hours married ttl_exp south i.race
      est store m3
    xi:reg wage hours married ttl_exp south i.race i.occupation
      est store m4  
          
    *-�����趨  
      xml_tab m1 m2 m3 m4, replace
	  
      * ˵����
      *   (1) Ĭ�ϴ洢�ڵ�ǰ�Ŀ¼�£�����Ϊ stata_out.xml��
      *   (2) Ĭ����ʾ������ǩ�����Ǳ������ƣ�������ǩ��֧������
    
	
    *-��������
      xml_tab m1 m2 m3 m4, save(result) sheet(OLS) replace  ///
                           tstat below stats(r2 r2_a N)  
          
		  
    *-��һ������
      xml_tab m1 m2 m3 m4, save(result) sheet(OLS) replace     ///
                           tstat below stats(r2 r2_a N)        ///
              drop(_Ioccup*) font("Times New Roman" 10)        ///
              title(Table 1 Basic Regression of US women wage) ///
              tblank(1) format(NCCR3)                          ///
              note("Occupation dummies are not presented")
      
	  * ˵����
      *   (1) �����ֱ��������ı�ǩ����Ҫ�����޸ģ��򸽼� -nolabel- ѡ�
      *   (2) �й� -format()- ѡ�����д������İ����ļ���
      *   (3) save() ѡ���п���д����Ĵ洢·��
      *   (4) ���ƣ�������һ��-Excel-�ļ��洢���-sheet-       
       
	   
   *-��������׷��
     * ������Ů�Ƿ���빤���Ӱ������
       logit union wage ttl_exp
       est store a1
       xi: logit union wage ttl_exp i.race i.occupation   
       est store a2
       xml_tab a1 a2, save(result) sheet(Logit) append  ///  //ע��˴��ı仯
                          tstat below stats(r2 r2_a N)  ///
             drop(_Ioccup*) font("Times New Roman" 10)  ///
             title(Table 2 Determinants of being a Union member) ///
             tblank(1) format(NCCR3)                             ///
             note("Occupation dummies are controlled, but not presented")      
       
	   * ˵����
       *   (1) ��ͬ����ͬ�׶εĻع��������Էֱ���벻ͬ�� sheet���� �У�
       *   (2) ����һ�� sheet ʹ�� -replace- ѡ���⣬
	   *       ����׷�ӵ� sheet ʹ�� -append- ѡ��
       *   (3) ���������������������-Word-��
	   *       ����ʹ��-Word-����Զ���������
     

  
  *-1.10.2.4 -outreg2- ���רҵ�����Word��Excel�ĵ��� 
   
    sysuse nlsw88, clear
    tab race, gen(d_race)
      drop d_race1
    tab occu, gen(d_occu)
      drop d_occu1
    reg wage hours ttl_exp married 
      est store m1
    reg wage hours ttl_exp married d_race*
      est store m2
    reg wage hours ttl_exp married d_race* d_occu*   
      est store m3
  
    *-�����÷��������ݴ����г��ֽ��     
      outreg2 [m1 m2 m3] using tab01, seeout replace   
       
    *-��� Word �� Excel �ĵ�
      outreg2 [m1 m2 m3] using tab01, word  replace 
      outreg2 [m1 m2 m3] using tab01, excel replace 
    
    *-ͬʱ���Word��Excel�ĵ�(������� tex ѡ���� tex �ĵ�)   
      outreg2 [m1 m2 m3] using tab01, word excel replace      
    
    *-ʹ�ñ�����ǩ
      label var hours "ÿ�ܹ���ʱ��"
      label var married "�ѻ�==1��δ��==0"
      outreg2 [m1 m2 m3] using tab01, word replace label
      outreg2 [m1 m2 m3] using tab01, word replace label(insert)  
	                                       // ͬʱ���ֱ����ͱ�ǩ
    
    *-s.e., tֵ, �� pֵ
      outreg2 [m1 m2 m3] using tab01, word replace tstat   
	                                     // ���� t-value
      outreg2 [m1 m2 m3] using tab01, word replace pvalue  
	                                     // ���� p-value 
    
    *-С������ʾ��ʽ  -tdec()-, -rdec()- ѡ��
      outreg2 [m1 m2 m3] using tab01, word replace tstat tdec(2)  
	                                      // t-valueС�������λ 
      outreg2 [m1 m2 m3] using tab01, word replace tstat rdec(3)  
	                                      // R2С�������λ  
    
    *- "()", "[]", �� " "
      outreg2 [m1 m2 m3] using tab01, word replace pvalue bracket tdec(3)
      outreg2 [m1 m2 m3] using tab01, word replace tstat tdec(2) noparen 
    
    *-�½����׷��  
      logit union wage married wage d_race* d_occu*
      est store logit
      outreg2 [logit] using tab01, word append      
  
    *-����ϵ������׼��ϵ���ͱ߼�Ч��
      reg wage hours ttl_exp married 
      mfx, eyex                              // ���㵯��ϵ��
      outreg2 using tab02_mfx, word replace  // -replace- �½�word�ĵ�
        
      reg wage hours ttl_exp married d_race*
      mfx, eyex
      outreg2 using tab02_mfx, word append   // ׷�ӽ��
        
	  reg wage hours ttl_exp married d_race* d_occu*
      mfx, eyex  
      outreg2 using tab02_mfx, word append   // ��һ��׷�ӽ��
             
    *-��ѡ��س��ֱ���
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              drop(d_occu*)                                     
      * ˵����
      *   (1) ���ʹ�� keep() ѡ��ɸѡ��Ҫ���ֵı�����
      *   (2) ʹ�� order() ѡ����Ըı�������Ⱥ�˳�� 
       
    *-���ı���
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("��1: ������Ů���ʾ������ع��ƽ��") 

    *-���һ�е�ͳ����: adj-R2, Fֵ
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("��1: ������Ů���ʾ������ع��ƽ��")  ///
              drop(d_occu*)                               ///
              adjr2 e(F ll)                                     
             
    *-���¶���ע��
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("��1: ������Ů���ʾ������ع��ƽ��")  ///
              drop(d_occu*)  nonote                       /// 
              addnote("ע��(1)***,**,*�ֱ��ʾ��1%,5%��10%ˮƽ������;",  ///
                          "(2)������Ϊ��׼��;",                          ///
                          "(3)m3�п�����ְҵ������� d_occu2-d_occu13��")  
      * ˵����
	  *
      *  (1) -nonote-  ѡ�
	  *      ����ʾԭ��Ӣ��ע�� "Standard errors in parentheses" 
      *      �� "*** p<0.01, ** p<0.05, * p<0.1"  
	  *
      *  (2) -addnote-  ѡ�addnote("ע��1", "ע��2", "ע��3")    
      

	  
    *__-<-<-<-<- ��һ��ģ�塿 ->->->->-__
    *   
    *- ����: 
    *   (T1) ���ӱ����⣻
    *   (T2) ������������ʾ˳��Ͷ�� -drop()-, -sortvar()-
    *   (T3) t-value С�������ʾ��λ��adj-R2  С�������ʾ��λ��
    *   (T4) �޸ı��ע�ͣ�
    *
    *________________________________outreg2ģ��____________________________  
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("��1: ������Ů���ʾ������ع��ƽ��")  ///   // (T1)
              drop(d_occu*) sortvar(married hours)        ///   // (T2)
              tdec(2) rdec(3)  adjr2 e(F)                 ///   // (T3)
              nonote                                      ///   // (T4)
              addnote("ע��(1)***,**,*�ֱ��ʾ��1%,5%��10%ˮƽ������;",  ///
                          "(2)������Ϊ��׼��;",                          ///
                          "(3)����ע����䡣")    
    *_______________________________________________________________________                            
            
            
    *-�෽��ģ�ͽ���ĳ���
      *-ʾ��1��SURģ��
        use invest2.dta, clear
        sureg (invest1 market1 stock1)  ///
              (invest2 market2 stock2)  ///
              (invest3 market3 stock3)  ///
              (invest4 market4 stock4)  ///
              (invest5 market5 stock5), corr  
        outreg2 using table2, word replace       
		                         // ����ģ�͵ĳ��֣�����est store 
        outreg2 using table2, word replace long  // ��������ʾ���
     
      *-ʾ��2��Multinomial Logit ģ�� -mlogit-
        use fullauto, clear
        replace wei = wei/1000
        replace price = price/1000
        mlogit rep77 mpg wei price rseat foreign
        outreg2 using table2, word replace
     
        
*- ������

*  (1) ������ԣ�-outreg2- ������Ϊ���ã�
*      ����ͬʱʵ�ֶ� Word, Excel, LaTeX ��֧��

*  (2) -esttab-, -xml_tab- ������Ҳ�ȽϷ���


 
 
  
  
  
  
  

  
  
          *===================================
          *      ����������STATAӦ��
          *===================================

          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *           ::��һ����::
          *            Stata ����
          *       =====================
          *         ��һ��  STATA���
          *       =====================
          *         -1.11- Stata �趨

      cd `c(sysdir_personal)'Net_course_A\A1_intro  
	  
		  
*--------------------
*-> 1.11 Stata �趨
*--------------------

         *     ==����Ŀ¼==

         *     1.11.1 Stata����
         *     1.11.2 �ļ�Ŀ¼
         *     1.11.3 Stata �ⲿ����Ļ�ȡ
         *          1.11.3.1 �ⲿ����Ĵ洢·�� 
         *          1.11.3.2 �ⲿ����Ļ�ȡ��ʽ
         *          1.11.3.3 �ⲿ����Ĺ���͸���
         *     1.11.4 Stata ��ϵͳ����  
         *     1.11.5 �ļ����ļ��еĲ���
         *          1.11.5.1  �ļ��Ļ������������ҡ����ơ��༭��ɾ��
         *          1.11.5.2  ʹ��stata��txt, Word, Excel, ��ҳ�ļ�
         *          1.11.5.3  �ļ��еĲ���
         *     1.11.6  ÿ������ʱ����ִ�е�����(profile)
         *     1.11.7  ���ÿ�ݼ�
         *     1.11.8  �˳�stata(exit)
         
         
*__________________
*-1.11.1 Stata����    -help-, -search-, -hsearch-, -findit-

  * -help-����
  * -search-����   searches the [keywords] of the help files; 
  * -hsearch-����  searches the help files [themselves].
  * -findit-����   ����-search-��������Խ�һ�����������ϵ���Ϣ
  
    help regress
    search panel data, net
    hsearch "fixed effect"
    findit panel unit root

  * -view- ����  �¿�������ʾ
  
    view search panel data, net        // �¿�������ʾ�������
    view news                          // ��ʾstata�������̬
    view browse http://www.baidu.com   // ����ҳ
    viewsource winsor.ado              // �鿴 ado �ļ�Դ�ļ���ֻ��
    viewsource xtreg_fe.ado
    viewsource xtbalance.ado
  
  
  *-����İ���������
  
    *- ����������FAQ  
       view browse http://www.stata.com/support/statalist/faq 
	   
    *- ����STATA�û��ʼ��б�
       view browse http://www.stata.com/statalist/
	   
    *- �˴󾭼���̳��stataר�桿
       view browse http://www.pinggu.org/bbs/forum-67-1.html
	   
    *- �˴󾭼���̳��VIP����ר����
       view browse http://www.pinggu.org/bbs/forum-114-1.html  



*___________________
*-1.11.2  �ļ�Ŀ¼      -help sysdir-

  *-1.11.2.1 stata ϵͳĿ¼���趨
  
    sysdir        // ��ʾ��ǰϵͳĿ¼���趨

    *- ���壺
       *    STATA:  D:\stata11\			     stata ��װ��Ŀ¼
       *  UPDATES:  D:\stata11\ado\updates\	�������ļ����Ĵ洢��ַ
       *     BASE:  D:\stata11\ado\base\	���ٷ�����洢��ַ
       *     SITE:  D:\stata11\ado\site\	���Ա�����洢��ַ
       *     PLUS:  D:\stata11\ado\plus\	���ⲿ����Ĵ����ַ
       * PERSONAL:  D:\stata11\ado\personal\�������ļ��С��״ΰ�װʱ����Ҫ�Խ�			
  
    *- �鿴
	   pwd             // ��ǰ����·��
       personal        // ��ʾ·��(�����ļ���)
       personal dir    // �鿴����
       
    *- �趨   help sysdir  
       sysdir set PLUS      "D:\stata11\ado\plus"      // �ⲿ����Ĵ�ŵ�ַ
       sysdir set PERSONAL  "D:\stata11\ado\personal"  // �����ļ��� 
       
       adopath + "D:\mypaper\my_ado"      // �����µĲ�ѯĿ¼
       adopath - "D:\mypaper\my_ado"      // ȡ���ض���ѯĿ¼
       

	   
*______________________________
*-1.11.3  Stata �ⲿ����Ļ�ȡ   

*         -findit-, -ssc-, -net-, -adoupdate-, -mypkg-

  *-1.11.3.1 �ⲿ����Ĵ洢·��  
  
    *-˵����
    *  (1) Ĭ������£�stata���� "...\stata11\ado\plus" �ļ����´洢�ⲿ����
    *  (2) ��ͨ�� -sysdir set- �������֮
    *  (3) ��һ�������ⲿ����ʱ��stata���Զ����� \plus �ļ���
    
    sysdir

    
  *-1.11.3.2 �ⲿ����Ļ�ȡ��ʽ

    *-findit-���ģ����ѯ
      findit panel data
      findit normal test
 
    *-ssc-�����װ(ж��)��Դ�� ssc ������
	*           ssc: Statistical Software Components
      help ssc             // http://www.repec.org/
      ssc whatsnew
      * �鿴��Դ�� SSC ���ⲿ�����б�
        ssc describe b    // ��ʾ�� -b- ��ͷ�����������Ϊ a-z,�Լ� "_"
        ssc describe x
        ssc des winsor      
      * ���ذ�װ ssc ����              
        ssc install winsor, replace

    *-net-����
      help net
      *
      *-ʾ��
              net search hausman test
         view net search hausman test
              net from http://fmwww.bc.edu/RePEc/bocode/m/   
			                            // [result]������ʾSSC����
         view net from http://fmwww.bc.edu/RePEc/bocode/m/   
		                                // �¿�������ʾ
      *
      *-Stata Journal(SJ) ����ĵ�
        view net from "http://www.stata-journal.com/" 
        view net from "http://www.stata-journal.com/software/"
        net cd software  // ���粻��ʱ�������޷�����
        net cd sj9-2 
      *   
      *-Stata Technical Bulletin(STB) ����ĵ�    
        net from "http://www.stata.com/stb/"


  *-1.11.3.3 �ⲿ����Ĺ���͸���
  
    *-��ѯ�Ѱ�װ���ⲿ����  -ado-, -mypkg-, -which-
	   ado
       ado, find(winsor)
       ado, find(panel unit)
       mypkg                      // ���ֱ������Ѱ�װ���ⲿ���� net findit ssc
       mypkg xt*
       mypkg *lorenz*
       mypkg xtbalance
       which xtbalance  
       which outreg2              // ��ʾ����Ļ�����Ϣ  
	   
    *-�ⲿ����ĸ���     -adoupdate-
       adoupdate                  // ���±����ϵ��ⲿ ado ����
       adoupdate outreg2, update  // �����ض������� 

    *-�����Լ��� stata ����
	  help usersite
	

	
*___________________________
*-1.11.4  Stata ��ϵͳ����
   
   query                   // ���ֵ�ǰϵͳ�������趨���
   
 * ���ڰ汾
   about
   
 * ��֤�Ƿ���ȷ��װ
   verinst
   
 * ϵͳ������Χ
   help limits
   
 * һЩ���õ��趨
   clear
   set obs 200             // �趨�۲�ֵ�ĸ���
   set memory 40m 
  *------------------------------------------ 
   set more on             // ���� ������ʾ
    sysuse auto, clear
    list price
   set more off            // ��ֹ ������ʾ
    list price
  *------------------------------------------ 
    clear 
    set memory 40m         // �趨�ڴ�Ĵ�С
    set matsize 3000       // �趨��������ά��
  *------------------------------------------  
    set trace on           // ���ٵ���
      sysuse auto, clear
      reg price wei 
    set trace off
  *------------------------------------------ 
    set seed 1357923       // ���������ʱ������
     matrix a = matuniform(2,2)
     matrix list a
  *------------------------------------------
    help set_defaults      // �ָ�ϵͳ������Ĭ��ֵ
    set_defaults memory    // ���ָ� memory �� 
    set_defaults _all      // ȫ���ָ�


*_____________________________  
*-1.11.5  �ļ����ļ��еĲ���

* ������shell, shellout, findfile, erase, 
*           mkdir, rmdir, copysource, winexec
 
  *-1.11.5.1  �ļ��Ļ������������ҡ��鿴�����ơ��༭��ɾ��
    
    findfile xtreg_fe.ado         // �����ļ�
    copysource xtreg_fe.ado       // ��adopath·���²���,���Ƶ���ǰ����Ŀ¼��
    dir xt*.ado                   // ��ʾ��ǰ����Ŀ¼�µ��ļ�
    viewsource xtreg_fe.ado       // �鿴ָ���� ado �ĵ�(ֻ��)
    doedit `c(pwd)'\xtreg_fe.ado  // �༭ָ���� ado �ĵ�
    erase  `c(pwd)'\xtreg_fe.ado  // ɾ���ļ�
    
    copysource xtreg_fe.ado
    shell rename xtreg_fe.ado FE.do  // �ļ�����
    dir *.do
    shell                            // �� dos �����²���
       
    copy d1.txt  new_d1.txt,replace  // �����ļ� 
      dir *d1.txt 
    copy http://www.stata.com/examples/simple.dta  simple.dta, replace
      dir *.dta
      erase new_d1.txt 
      erase simple.dta       


  *-1.11.5.2  ʹ��stata��-.txt-, -Word-, -Excel-, -iexplorer- �ļ�
  
    * �﷨�� 
    * shellout �����ļ���        // help shellout
      
    *-�򿪼��±�  
        shellout d1.txt 
        
    *-��-Word-�ĵ�  
        shellout mypaper.doc        
    
    *-��-Excel-�ĵ� 
        shellout  d1.xls
      
    *-����ҳ
        shellout myhome.mht
        shellout my_log.html
      
    *-��-PPT-�ĵ�          // ��������һ�°� 
    *-��-PDF-�ĵ�

	
	*-�Ѱ����ļ�ת��Ϊ pdf ��ʽ
	  help hlp2winpdf 
	  hlp2winpdf, cdn(xtreg)
	  shellout xtreg.pdf
	  
	  hlp2winpdf, cdn(xtbalance xtabond) replace
	  shellout xtbalance.pdf
	  shellout xtabond.pdf
	  
	  *-˵������Ҫ��װ Ghostscript �� WinEdt ��װ
	  * �ɵ�������ַ���أ�
	  *  http://www.ctex.org/HomePage
	  
	  

  *-1.11.5.3  �ļ��еĲ���
    
    *-stata�ٷ�����  -dir-, -mkdir-, -rmdir-
    
      dir               // ��ʾ��ǰĿ¼�µ������ļ�
      dir *.txt         // ��ʾ��׺Ϊ ".txt" �������ļ�
      dir xt*           // ��ʾ�� "xt" ��ͷ�������ļ�
         
      mkdir `c(pwd)'\mystata   // �½��ļ���
      rmdir mystata            // ɾ���ļ��� 
      
                    
    *-dirtools- ����: ��Ч�����ļ����ⲿ����

      cd  `c(sysdir_personal)'Net_course_A
      lall              // ��ʾ�����ļ�
      cd  A1_intro
      ldta              // ��ʾ .dta �����ļ�
      cd `c(sysdir_stata)'ado\base\x
      lado              // ��ʾ .ado �ļ�

     
	*-cdout- ����򿪵�ǰ����·�����ڵ��ļ���
	  cd D:\stata11\utilities
	  cdout
	  cd  `c(sysdir_personal)'Net_course_A
	  cdout 
	  
	  
	  
*___________________________________  
*-1.11.6  ÿ������ʱ����ִ�е�����     -profile-

  help profile

  * ����һ�� profile.do �ĵ������� D:\stata11\ ��

  * --------begin profile.do------------
  *
  *   ���������趨
      set type double
      set memory 50m
      set matsize 2000
      set scrollbufsize 50000   // �趨��Ļ�������ʾ����
      set more off,perma
	  
  *   log �ļ��趨
      log using    D:\stata11\ado\personal\stata.log, text replace
      cmdlog using D:\stata11\ado\personal\command.log, append
	  
  *   �ļ�Ŀ¼�趨
      sysdir set PLUS     "D:\stata11\ado\plus"     //�ⲿ����Ĵ�ŵ�ַ
      sysdir set OLDPLACE "D:\ado"
      sysdir set PERSONAL "D:\stata11\ado\personal" //�����ļ���
	  
  *   ado�ĵ�����·��  
      adopath + "D:\stata11\ado\personal"
      adopath + "D:\stata11\ado\personal\_Myado"
	  
  *   ��ǰ����·��
      cd D:\stata11\ado\personal
	  
  * --------end profile.do------------


  *- Arlion �� profile.do �ĵ�
  
    *doedit D:\stata11\profile.do
     doedit `c(sysdir_stata)'profile.do
    
	*-�ҵ���־�ļ�
	  cd D:\stata11\do
	  cdout


*_____________________  
*-1.11.7  ���ÿ�ݼ�    
    
                                        /*
	  F-key 	Definition
	---------------------------
	  F1 		help
	  F2 		#review;
	  F3 		describe;  (*)
	  F7 		save
	  F8 		use
	---------------------------
	
	
	  Ctrl-key 		Definition
	-------------------------------------------------
	  Ctrl+D 		ִ��(Do)ѡ�е����� (*)
	  Ctrl+R        ���г���(Run)      (*)
	  Ctrl+F		��do-editor�������ض��Ĺؼ���
	  Ctrl+O		��do�ĵ�
	  Ctrl+N		�½�do�ĵ�
	  Ctrl+S		����do�ĵ�         (*)
	  Ctrl+G        ��ת����#��        (*)
	  Ctrl+Shift+Y	ѡ�й�����ڵ���
	  Ctrl+Y		ɾ��������ڵ���
	  Ctrl+F2       ����С�ڱ�ǩ
	  Shift+F2      ��ת����һ��С�ڱ�ǩ
	  F2            ��ת����һ��С�ڱ�ǩ
	-------------------------------------------------	
	ע��������ݼ���������do-editor
	
                                        */
                                        
                                        
*_____________________  
*-1.11.8  �˳�stata��     -exit-
  
  *-������Ҫע�������:
   
    *- ���淽��
       * �����Źر�stata����������¶����豣�棻
       
    *- �����
       exit
       exit, clear



