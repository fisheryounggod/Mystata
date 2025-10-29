

*---------------------------
*- �й����й�˾�о����ݿ�
*---------------------------

*- ������Դ��CCER��GTA
*- �� �� �ߣ������
*- �����£�2009.08.30

*- ����ġ��й����й�˾�о����ݿ⡷˵���飨pdf�ĵ���


   cd D:\DATA\CCER\2008_new

   use D:\DATA\GTA\CSMAR_FS.dta, clear
   
   gen year = real(substr(accp, 1, 4))
   drop accper
   rename stkcd id
   order id year
   tsset id year   

   merge id using "D:\DATA\GTA\CSMAR_data\CG_Co.dta"
   drop _merge    // ��˾������Ϣ
   tsset id year
   
   merge id year using "D:\DATA\GTA\CSMAR_data\CG_Ybasic.dta" 
   drop _merge    // �����ۺ���Ϣ
   tsset id year

   merge id year using "D:\DATA\GTA\CSMAR_data\CG_Capchg.dta"
   drop _merge    // �ɱ��ṹ
   drop nshrttl
   rename a003101000 nshrttl
   tsset id year

 
*====================  Part II ======================       
*             == �ϲ������������ ==========
*====================================================
*  GTA_2008_CG

*- ��˾������Ϣ: CG_Co
   *use D:\DATA\GTA\CSMAR_data\CG_Co.dta, clear

    label var	stktype	"��Ʊ����"
    label var	crcd		"A/B/H�ɽ�����"
    label var	nindcd	"��ҵ����B(CSRC2001)"
    label var	indnme	"��ҵ����A(CSRC1999)"
    label var	indcd		"��ҵ����A(CSRC1999)"
    label var	regcap	"ע���ʱ�"

*- �����ۺ���Ϣ�ļ�: CG_Ybasic
   *use D:\DATA\GTA\CSMAR_data\CG_Ybasic.dta, clear
    label var	y0301b	"�ɱ��ṹ�Ƿ�仯(1-����, 2-��)"
    label var	y0401b	"�ɶ�����"
    label var	y0501b	"ǰʮ��ɶ��Ƿ���ڹ���"
    label var	y0601b	"Ա������"
    label var	y0701b	"������ְ������"
    label var	y0801b	"���³�����"
    label var	y0901b	"�ܾ�������"
    label var	y1001b	"���³����ܾ���������"
    label var	y1101a	"��������"
    label var	y1101b	"����-������������"
    label var	y1201a	"�����ܹ�ģ"
    label var	y1301b	"�߹�����"
    label var	y1401b	"��н��¶��ʽ"
    label var	y1501a	"���¡����¼��߹ܱ����ܶ�"
    label var	y1501b	"����-���¡����¼��߹ܽ����ܶ�"
    label var	y1501c	"���¡����¼��߹�ǰ����н���ܶ�"
    label var	y1501d	"����ǰ����н���ܶ�"
    label var	y1501e	"�߹�ǰ����н���ܶ�"
    label var	y1601a	"δ��ȡн��Ķ��¡����¼��߹�����"
    label var	y1601b	"����-δ��ȡн�궭������"
    label var	y1601c	"����-δ��ȡн���������"
    label var	y1701a	"ίԱ����������"
    label var	y1701b	"����-��ί��������"
    label var	y1701c	"����-����ίԱ����������"
    label var	y1801b	"�������������й�˾�����ص�һ����ͳ��"  
  

*- �ɱ��ṹ��Ϣ��CG_Capchg
   *use D:\DATA\GTA\CSMAR_data\CG_Capchg.dta, clear
    label var	id		"֤ȯ����"
    label var	year		"������"
    label var	nshrttl	"�ܹ���"
    label var	nshrnn	"δ��ͨ�ɷ�"
    label var	nshrstt	"����-���йɹ���"
    label var	nshrlpd	"����-���ڷ����˷��˹ɹ���"
    label var	nshrlpf	"����-���ⷢ���˷��˹ɹ���"
    label var	nshrlpn	"����-ļ�����˹ɹ���"
    label var	nshremp	"����-�ڲ�ְ���ɹ���"
    label var	nshrmf	"����-�������۹���"
    label var	nshrrot	"����-ת��ɹ���"
    label var	nshrprf	"����-���ȹɹ���"
    label var	nshrunl	"����-��ͨ���͹���δ��ͨ����"
    label var	nshrsms	"����-�߼�������Ա�ֹ���"
    label var	nshrglea	"����-һ�㷨��������"
    label var	nshrsina	"����-ս��Ͷ����������"
    label var	nshrlpo	"����-���������˹ɹ���"
    label var	nshrn		"����ͨ�ɷ�"
    label var	nshra		"����-A����ͨ����"
    label var	nshrb		"����-B����ͨ����"
    label var	nshrh		"����-H����ͨ����"
    label var	nshroft	"����-����������ͨ��"


preserve
   *= ��Ȩ�ṹ (������Դ:CCER)
   forvalues i = 1/4{
     insheet using CG_ccer_2008_0`i'.txt, clear
     qui tsset id year
     save CG_ccer_2008_0`i'.dta, replace
   }
   use CG_ccer_2008_01.dta, clear
   qui tsset id year
   forvalues i = 2/4{
     merge id using CG_ccer_2008_0`i'.dta
     qui tsset id year
     drop _merge
   } 
   save gc_2008, replace  
  *= �� 2000 ����ǰ�����ݺϲ�
    use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
    local v1 "rcontrol cr5index cr10index zindex herf5index herf10index"
    local n1 "d21 d22 d23 d24 d25 d26"
    local v2 "skhdr1 skhdr2 skhdr3 skhdr4 skhdr5"
    local n2 "d27 d28 d29 d30 d31"
    local v3 "skhdr6 skhdr7 skhdr8 skhdr9 skhdr10"
    local n3 "d32 d33 d34 d35 d36"
  *= ����������
    renvars `v1' `v2' `v3' \ `n1' `n2' `n3'
    keep id year `n1' `n2' `n3' 
    keep if year<2000
    save CCER_1999_gc, replace 
  *= ��2000-2007���ݺϲ� 
    use D:\DATA\CCER\2007_new\gc_2007.dta, clear
    append using gc_2008.dta 
  *= ��2000����ǰ�����ݺϲ�
    append using CCER_1999_gc.dta
  *= ���湫˾��������  
     tsset id year    
     save gc_1990_2008, replace
  *========================
restore
   merge id year using gc_1990_2008
   drop _merge    // �ϲ���˾������Ϣ
   tsset id year
  
  
preserve
   *= ���ӹɱ���Ϣ
    * 2006����ǰ����Ϣ
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year totalshr ntshr tshr ashr bshr hshr mv_total mv_atshr
       tsset id year
    * ���� 2007-2008 ����
       append using ccer_cap_2007_2008.dta
       tsset id year
       save ccer_cap_1990_2008, replace   
restore
    merge id year using ccer_cap_1990_2008
    drop _merge   // �ϲ� �ɱ��ṹ����ֵ ָ��
    tsset id year  
    
      
preserve  
*= ����Tobin's Qָ��
   use "D:\DATA\CCER\2007_new\ccer_data_2007.dta", clear
   keep id year a16
   tsset id year
   merge id year using ccer_tobin_9408.dta
   drop _merge
   tsset id year
   order id year
   save ccer_tobin_1994_2008, replace
restore
    merge id year using ccer_tobin_1994_2008
    drop _merge  // �ϲ�Tobin's Qָ�� 
    tsset id year


preserve      
    *= ���� sigma ϵ��ָ��
    * 2006����ǰ����Ϣ
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year  sigma
       tsset id year
   * ���� 2007-2008 ���� 
       append using ccer_sigma_2007_2008.dta
       tsset id year
       save ccer_sigma_1990_2008, replace 
restore
    merge id year using ccer_sigma_1990_2008
    drop _merge   // �ϲ� sigma ָ��
    tsset id year
  
  
preserve      
    *= ���� rr (���Ƿֺ��������)ָ��
    * 2006����ǰ����Ϣ
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year rr
       tsset id year
   * ���� 2007-2008 ���� 
       append using ccer_rr_2007_2008.dta
       tsset id year
       save ccer_rr_1990_2008, replace 
restore
    merge id year using ccer_rr_1990_2008
    drop _merge   // �ϲ� rr ָ��
    tsset id year  


preserve  
    *= �������տ�������Ϣ 2008��   
    * 1999 ������
       use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
       keep id year finalcontrol
       keep if year<2000
    * 2000-2007 ����
      append using "D:\DATA\CCER\2007_new\ccer_data_2007.dta",  ///
              keep(id year finalcontrol)
    * 2008 ����
      append using ccer_final_2008.dta  
      replace finalcontrol = 6 if final<0
      tsset id year
      save ccer_final_1999_2008, replace
restore
    merge id year using ccer_final_1999_2008
    drop _merge
    tsset id year  


preserve
    * ST/PT ��Ϣ  Ŀǰֻ������st��Ϣ��������������Ҫ��ʱ���������
    * 2005��ǰ
      use "D:\stata9\ado\data\newdata2006\newdata2006_m", clear
      keep id v370st-v379st
      keep if v370st!=""
     duplicates drop
     gen styear = real(substr(v370st,1,4))
     gen ptyear = real(substr(v375st,1,4))
     gen exyear = real(substr(v378st,1,4))     
     label var styear "STʱ��"
     label var ptyear "PTʱ��"
     label var exyear "����ʱ��"
     keep id styear
     sort id 
     merge id using st_2004_2008.dta
     drop _merge
     duplicates drop
     sort id
     save ccer_stpt, replace
restore
    merge id using ccer_stpt
    drop _merge
    tsset id year
     
preserve
   * �ֽ�ֺ���Ϣ�������� e04 ָ�꣬��������Ҫʱ����ȡ
   clear
   insheet using dividend_1992_2008.txt, clear
   label var	pubdate	"��������"
   label var	id		"��Ʊ����"
   label var	e01		"�Ǽ�����"
   label var	e02		"��Ϣ����"
   label var	e03		"֧������"
   label var	e04		"ÿ���ֽ�ֺ�"
   label var	e05		"����"
   label var	e06		"�������"
   label var	e07		"�Ƿ�˰"
   label var	e08		"�ֺ�����"
   label var	e09		"��ע"
   label define adiv_type 0 "��ȷֺ�" 1 "�б��ֺ�" 2 "���ȷֺ�" 9 "����(��ɸķֺ�)"
   label value e08 adiv_type
   label define adiv_tax 0 "����˰" 1 "��˰"
   label value e07 adiv_tax
   gen year = int(e03/10000)
   bysort id year: egen div_cash = total(e04)
   keep id year div_cash
   duplicates drop id year, force
   label var div_cash "ÿ���ֽ�ֺ�_CCER"
   tsset id year
   save div_1992_2008, replace
restore
   merge id year using div_1992_2008
   drop _merge
   tsset id year


preserve   // �ֺ�_2008_GTA
    insheet using GTA_Div_2008.csv, clear
     label var	stkcd	    "֤ȯ����"
     label var	stknme     "֤ȯ���"
     label var	finyear    "�������"
     label var	disye	     "�����ڱ�ʶ"
     label var	ppdadt     "Ԥ����������"
     label var	ppcont     "Ԥ������"
     label var	schedu     "����ʵʩ����"
     label var	odate	     "�ɶ�����ٿ�����"
     label var	pdadt	     "�ɶ���ṫ�淢������"
     label var	ammopub    "�ɶ���ṫ�濯��"
     label var	ddadt	     "ʵʩ������������"
     label var	annopub    "���䷽�����濯��"
     label var	annocont   "ʵʩ��������"
     label var	perspt     "�͹ɱ�"
     label var	pertran    "ת����"
     label var	btperdiv   "��Ϣ��˰ǰ"
     label var	atperdiv   "��Ϣ��˰��"
     label var	numsptr    "��ת����"
     label var	numdiv     "��Ϣ��"
     label var	regdt	     "��Ȩ�Ǽ���"
     label var	lastchgdt  "�������"
     label var	exdistdt   "��Ȩ��Ϣ��"
     label var	paydt	     "���ת����������"
     label var	divdt	     "��Ϣ��"
     label var	trfojb     "�������"
     label var	price1     "��Ȩ�Ǽ������̼�"
     label var	price2     "��Ȩ��Ϣ�����̼�"
   save GTA_DIV_2008, replace          // �Ա�����
     use GTA_DIV_2008, clear
     local vv "ddadt btperdiv"
     keep stkcd `vv'
     drop if btp==.
     rename stkcd id
     gen year = real(substr(ddadt,1,4))
     bysort id year: egen div_cash_GTA = total(btperdiv)
     label var div_cash_GTA "ÿ���ֽ�ֺ�_˰ǰ_GTA"     
     keep id year div_cash_GTA
     duplicates drop id year, force
     tsset id year
     save div_2008_GTA_temp, replace
restore
   merge id year using div_2008_GTA_temp
   drop _merge
   tsset id year
   
   
preserve
 * ����
   * ������ǩ
     use zengfa_vlist_temp.dta, clear
     mata
     a = st_sdata(. , .)
     b = a'
     b
     end
     * ����Excel�ĵ����д���
     insheet using zengfa_1998_2008.txt, clear
	label var	z01	"��������"
	label var	id	"��Ʊ����"
	label var	z02	"����������"
	label var	z03	"�������п�ʼʱ��"
	label var	z04	"�������н���ʱ��"
	label var	z05	"������Ȩ�Ǽ���"
	label var	z06	"�����¹�������"
	label var	z07	"�������ж���"
	label var	z08	"�����Ϲɶ��Ƿ��������Ϲ�Ȩ"
	label var	z09	"�����¹ɷ��з�ʽ"
	label var	z10	"�����عɹɶ�̬��"
	label var	z11	"����Ԥ��ļ���ʽ��ܶ�"
	label var	z12	"����ʵ��ļ���ʽ��ܶ�"
	label var	z13	"�������з��úϼ�"
	label var	z14	"�������м۸�"
	label var	z15	"��������ǰÿ�ɾ��ʲ�"
	label var	z16	"�������к�ÿ�ɾ��ʲ�"
	label var	z17	"����Ԥ�Ʒ��й�Ʊ����"
	label var	z18	"����ʵ�ʷ��й�Ʊ����"
	label var	z19	"������������"
	label var	z20	"�����������̳�������"
	label var	z21	"�����������̳�������"
	label var	z22	"����������ʽ"
	save zengfa_2008.dta, replace  // �Ա�����
	keep z01 id z11 z12 z17 z18 
	gen year = int(z01/10000)
	local j = 1
	foreach v of varlist z11 z12 z17 z18{
	  replace `v'=0 if `v'==-95
	  bysort id year: egen zf0`j++' = total(`v') 
	}
	drop z01 z11 z12 z17 z18
	label var	zf01	"����Ԥ��ļ���ʽ��ܶ�"
	label var	zf02	"����ʵ��ļ���ʽ��ܶ�"	
	label var	zf03	"����Ԥ�Ʒ��й�Ʊ����"
	label var	zf04	"����ʵ�ʷ��й�Ʊ����"  
	duplicates drop  
	gen zf_yes = 1
	label var zf_yes "1=����,0=������"  
	tsset id year
	save zengfa_2008_simple, replace 
restore  
      merge id year using zengfa_2008_simple
      drop _merge
      replace zf_yes=0 if zf_yes==.
      tsset id year 
              
 
preserve
  * ���
    * ������ǩ
     use peigu_vlist_temp.dta, clear
     mata
     a = st_sdata(. , .)
     b = a'
     b
     end
     * ����Excel�ĵ����д���
     insheet using peigu_1993_2008.txt, clear     
     	label var	p01	"��������"
	label var	id	"��Ʊ����"
	label var	p02	"��ɹ�����"
	label var	p03	"��ɽɿʼʱ��"
	label var	p04	"��ɽɿ����ʱ��"
	label var	p05	"��ɹ�Ȩ�Ǽ���"
	label var	p06	"��ɳ�Ȩ��"
	label var	p07	"����¹�������"
	label var	p08	"���Ԥ�Ʒ��й�Ʊ����"
	label var	p09	"���ʵ�ʷ��й�Ʊ����"
	label var	p10	"��ɿعɹɶ�̬��"
	label var	p11	"���Ԥ��ļ���ʽ��ܶ�"
	label var	p12	"���ʵ��ļ���ʽ��ܶ�"
	label var	p13	"��ɷ��з��úϼ�"
	label var	p14	"���ʵ��ÿ�ɷ��з���"
	label var	p15	"��ɷ���ǰÿ�ɾ��ʲ�"
	label var	p16	"��ɷ��к�ÿ�ɾ��ʲ�"
	label var	p17	"��ɷ��м۸�"
	label var	p18	"�����������"
	label var	p19	"����������̳�������"
	label var	p20	"����������̳�������"
	label var	p21	"��ɳ�����ʽ"
     save peigu_2008.dta, replace  // �Ա�����
	keep p01 id p08 p09 p11 p12 p13 p14
	gen year = int(p01/10000)
	duplicates drop id year, force
	gen pg_yes = 1
	label var pg_yes "1=���,0=�����"  
	tsset id year
	save peigu_2008_simple, replace 
restore 
      merge id year using peigu_2008_simple
      drop _merge
      replace pg_yes=0 if pg_yes==.
      tsset id year 
            
                                    
*= ���ӹ�˾����ʱ������ڵ���Ϣ
    merge id using ccer_province_2008.dta
    drop _merge
    tsset id year
    label var byear    "����ʱ��"
    label var pyear    "����ʱ��"
    label var province "����ʡ��"
      



*-���ӱ�����ǩ

*== ��ծ�� ==

    label var  id			"֤ȯ����"
    label var  year		"����ڼ�"
    label var  typrep		"��������"
    label var  a001101000	"�����ʽ�"
    label var  a0d1101101	"����:�ͻ��ʽ���"
    label var  a0d1102000	"���㱸����"
    label var  a0d1102101	"����:�ͻ�������"
    label var  a0b1103000	"�ֽ𼰴���������п���"
    label var  a0b1104000	"���ͬҵ����"
    label var  a0b1105000	"�����"
    label var  a0f1106000	"����ʽ𾻶�"
    label var  a001107000	"�����Խ����ʲ�"
    label var  a0f1108000	"���������ʲ�"
    label var  a001109000	"����Ͷ�ʾ���"
    label var  a001110000	"Ӧ��Ʊ�ݾ���"
    label var  a001111000	"Ӧ���˿��"
    label var  a001112000	"Ԥ�������"
    label var  a0i1113000	"Ӧ�ձ��Ѿ���"
    label var  a0i1114000	"Ӧ�շֱ��˿��"
    label var  a0i1115000	"Ӧ�մ�λ׷�����"
    label var  a0i1116000	"Ӧ�շֱ���ͬ׼���𾻶�"
    label var  a0i1116101	"����:Ӧ�շֱ�δ��������׼���𾻶�"
    label var  a0i1116201	"����:Ӧ�շֱ�δ�����׼���𾻶�"
    label var  a0i1116301	"����:Ӧ�շֱ���������׼���𾻶�"
    label var  a0i1116401	"����:Ӧ�շֱ����ڽ���������׼���𾻶�"
    label var  a001119000	"Ӧ����Ϣ����"
    label var  a001120000	"Ӧ�չ�������"
    label var  a001121000	"����Ӧ�տ��"
    label var  a0f1122000	"���뷵�۽����ʲ�����"
    label var  a001123000	"�������"
    label var  a001124000	"һ���ڵ��ڵķ������ʲ�"
    label var  a0d1126000	"�����֤��"
    label var  a001125000	"���������ʲ�"
    label var  a001100000	"�����ʲ��ϼ�"
    label var  a0i1224000	"������Ѻ�����"
    label var  a0i1225000	"���ڴ��"
    label var  a0b1201000	"���Ŵ������"
    label var  a001202000	"�ɹ����۽����ʲ�����"
    label var  a001203000	"����������Ͷ�ʾ���"
    label var  a001204000	"����Ӧ�տ��"
    label var  a001205000	"���ڹ�ȨͶ�ʾ���"
    label var  a001206000	"����ծȨͶ�ʾ���"
    label var  a001207000	"����Ͷ�ʾ���"
    label var  a0i1209000	"����ʱ���֤��"
    label var  a0i1210000	"�����˻��ʲ�"
    label var  a001211000	"Ͷ���Է��ز�����"
    label var  a001212000	"�̶��ʲ�����"
    label var  a001213000	"�ڽ����̾���"
    label var  a001214000	"��������"
    label var  a001215000	"�̶��ʲ�����"
    label var  a001216000	"�����������ʲ�����"
    label var  a001217000	"�����ʲ�����"
    label var  a001218000	"�����ʲ�����"
    label var  a0d1218101	"����:����ϯλ��"
    label var  a001219000	"����֧��"
    label var  a001220000	"��������"
    label var  a001221000	"���ڴ�̯����"
    label var  a001222000	"��������˰�ʲ�"
    label var  a001223000	"�����������ʲ�"
    label var  a001200000	"�������ʲ��ϼ�"
    label var  a0f1300000	"�����ʲ�"
    label var  a001000000	"�ʲ��ܼ�"
    label var  a002101000	"���ڽ��"
    label var  a0d2101101	"����:��Ѻ���"
    label var  a0b2102000	"���������н��"
    label var  a0b2103000	"���մ�ͬҵ���"
    label var  a0b2103101	"����:ͬҵ���������ڻ�����ſ���"
    label var  a0b2103201	"����:���մ��"
    label var  a0f2104000	"�����ʽ�"
    label var  a002105000	"�����Խ��ڸ�ծ"
    label var  a0f2106000	"�������ڸ�ծ"
    label var  a002107000	"Ӧ��Ʊ��"
    label var  a002108000	"Ӧ���˿�"
    label var  a002109000	"Ԥ�տ���"
    label var  a0f2110000	"�����ع������ʲ���"
    label var  a0i2111000	"Ӧ�������Ѽ�Ӷ��"
    label var  a002112000	"Ӧ��ְ��н��"
    label var  a002113000	"Ӧ��˰��"
    label var  a002114000	"Ӧ����Ϣ"
    label var  a002115000	"Ӧ������"
    label var  a0i2116000	"Ӧ���⸶��"
    label var  a0i2117000	"Ӧ����������"
    label var  a0i2118000	"��������Ͷ�ʿ�"
    label var  a0i2119000	"���պ�ͬ׼����"
    label var  a0i2119101	"����:δ��������׼����"
    label var  a0i2119201	"����:δ�����׼����"
    label var  a0i2119301	"����:��������׼����"
    label var  a0i2119401	"����:���ڽ���������׼����"
    label var  a002120000	"����Ӧ����"
    label var  a0i2121000	"Ӧ���ֱ��˿�"
    label var  a0d2122000	"��������֤ȯ��"
    label var  a0d2123000	"�������֤ȯ��"
    label var  a0i2124000	"Ԥ�ձ���"
    label var  a002125000	"һ���ڵ��ڵķ�������ծ"
    label var  a002126000	"����������ծ"
    label var  a002100000	"������ծ�ϼ�"
    label var  a002201000	"���ڽ��"
    label var  a0d2202000	"�����˻���ծ"
    label var  a002203000	"Ӧ��ծȯ"
    label var  a002204000	"����Ӧ����"
    label var  a002205000	"ר��Ӧ����"
    label var  a002206000	"���ڸ�ծ�ϼ�"
    label var  a002207000	"Ԥ�Ƹ�ծ"
    label var  a002208000	"��������˰��ծ"
    label var  a002209000	"������������ծ"
    label var  a002200000	"��������ծ�ϼ�"
    label var  a0f2300000	"������ծ"
    label var  a002000000	"��ծ�ϼ�"
    label var  a003102000	"�ʱ�����"
    label var  a003102101	"����:����"
    label var  a003103000	"ӯ�๫��"
    label var  a0f3104000	"һ�����׼��"
    label var  a003105000	"δ��������"
    label var  a003106000	"��ұ���������"
    label var  a003107000	"δȷ�ϵ�Ͷ����ʧ"
    label var  a003100000	"������ĸ��˾������Ȩ��ϼ�"
    label var  a003200000	"�����ɶ�Ȩ��"
    label var  a003000000	"������Ȩ��ϼ�"
    label var  a004000000	"��ծ��������Ȩ���ܼ�"


*== ����� ==

    label var  b001100000	"Ӫҵ������"
    label var  b001101000	"Ӫҵ����"
    label var  bbd1102000	"��Ϣ������"
    label var  bbd1102101	"��Ϣ����"
    label var  bbd1102203	"��Ϣ֧��"
    label var  b0i1103000	"��׬����"
    label var  b0i1103101	"����ҵ������"
    label var  b0i1103111	"����:�ֱ�������"
    label var  b0i1103203	"��:�ֳ�����"
    label var  b0i1103303	"��:��ȡδ��������׼����"
    label var  b0d1104000	"�����Ѽ�Ӷ������"
    label var  b0d1104101	"����:��������֤ȯҵ������"
    label var  b0d1104201	"����:֤ȯ����ҵ������"
    label var  b0d1104301	"����:���пͻ��ʲ�����ҵ������"
    label var  b0d1104401	"�����Ѽ�Ӷ������"
    label var  b0d1104501	"�����Ѽ�Ӷ��֧��"
    label var  b0f1105000	"����ҵ������"
    label var  b001200000	"Ӫҵ�ܳɱ�"
    label var  b001201000	"Ӫҵ�ɱ�"
    label var  b0i1202000	"�˱���"
    label var  b0i1203000	"�⸶֧������"
    label var  b0i1203101	"�⸶֧��"
    label var  b0i1203203	"��:̯���⸶֧��"
    label var  b0i1204000	"��ȡ��������׼���𾻶�"
    label var  b0i1204101	"��ȡ��������׼����"
    label var  b0i1204203	"��:̯�ر�������׼����"
    label var  b0i1205000	"��������֧��"
    label var  b0i1206000	"�ֱ�����"
    label var  b001207000	"Ӫҵ˰�𼰸���"
    label var  b0f1208000	"ҵ�񼰹����"
    label var  b0i1208103	"��:̯�طֱ�����"
    label var  b001209000	"���۷���"
    label var  b001210000	"�������"
    label var  b001211000	"�������"
    label var  b001212000	"�ʲ���ֵ��ʧ"
    label var  b0f1213000	"����ҵ��ɱ�"
    label var  b001301000	"���ʼ�ֵ�䶯����"
    label var  b001302000	"Ͷ������
    label var  b001302101	"����:����Ӫ��ҵ�ͺ�Ӫ��ҵ��Ͷ������"
    label var  b001303000	"�������"
    label var  b001304000	"����ҵ������"
    label var  b001300000	"Ӫҵ����"
    label var  b001400000	"Ӫҵ������"
    label var  b001500000	"Ӫҵ��֧��"
    label var  b001500101	"����:�������ʲ����þ�����"
    label var  b001000000	"�����ܶ�"
    label var  b002100000	"����˰����"
    label var  b002200000	"δȷ�ϵ�Ͷ����ʧ"
    label var  b002300000	"Ӱ�쾻�����������Ŀ"
    label var  b002000000	"������"
    label var  b002000101	"������ĸ��˾�����ߵľ�����"
    label var  b002000201	"�����ɶ�����"
    label var  b003000000	"����ÿ������"
    label var  b004000000	"ϡ��ÿ������"


* == �ֽ�������(ֱ�ӷ�) ==

    label var  c001001000	"������Ʒ���ṩ�����յ����ֽ�"
    label var  c0b1002000	"�ͻ�����ͬҵ��ſ�����Ӷ�"
    label var  c0b1003000	"���������н����Ӷ�"
    label var  c0b1004000	"���������ڻ��������ʽ����Ӷ�"
    label var  c0i1005000	"�յ�ԭ���պ�ͬ����ȡ�õ��ֽ�"
    label var  c0i1006000	"�յ��ٱ���ҵ���ֽ𾻶�"
    label var  c0i1007000	"��������Ͷ�ʿ���Ӷ�"
    label var  c0d1008000	"���ý����Խ����ʲ������Ӷ�"
    label var  c0f1009000	"��ȡ��Ϣ�������Ѽ�Ӷ����ֽ�"
    label var  c0d1010000	"�����ʽ����Ӷ�"
    label var  c0d1011000	"�ع�ҵ���ʽ����Ӷ�"
    label var  c001012000	"�յ���˰�ѷ���"
    label var  c001013000	"�յ��������뾭Ӫ��йص��ֽ�"
    label var  c001014000	"������Ʒ����������֧�����ֽ�"
    label var  c0b1015000	"�ͻ���������Ӷ�"
    label var  c0b1016000	"����������к�ͬҵ������Ӷ�"
    label var  c0i1017000	"֧��ԭ���պ�ͬ�⸶������ֽ�"
    label var  c0f1018000	"֧����Ϣ�������Ѽ�Ӷ����ֽ�"
    label var  c0i1019000	"֧�������������ֽ�"
    label var  c001020000	"֧����ְ���Լ�Ϊְ��֧�����ֽ�"
    label var  c001021000	"֧���ĸ���˰��"
    label var  c001022000	"֧�������뾭Ӫ��йص��ֽ�"
    label var  c001000000	"��Ӫ��������ֽ���������"
    label var  c002001000	"�ջ�Ͷ���յ����ֽ�"
    label var  c002002000	"ȡ��Ͷ�������յ����ֽ�"
    label var  c002003000	"���ù̶��ʲ��������ʲ������������ʲ��ջص��ֽ𾻶�"
    label var  c002004000	"�����ӹ�˾������Ӫҵ��λ�յ����ֽ𾻶�"
    label var  c002005000	"�յ���������Ͷ�ʻ�йص��ֽ�"
    label var  c002006000	"�����̶��ʲ��������ʲ������������ʲ�֧�����ֽ�"
    label var  c002007000	"Ͷ��֧�����ֽ�"
    label var  c0i2008000	"��Ѻ������Ӷ�"
    label var  c002009000	"ȡ���ӹ�˾������Ӫҵ��λ֧�����ֽ𾻶�"
    label var  c002010000	"֧��������Ͷ�ʻ�йص��ֽ�"
    label var  c002000000	"Ͷ�ʻ�������ֽ���������"
    label var  c003008000	"����Ͷ���յ����ֽ�"
    label var  c003001000	"����Ȩ����Ͷ���յ����ֽ�"
    label var  c003001101	"����:�ӹ�˾���������ɶ�Ͷ���յ����ֽ�"
    label var  c003003000	"����ծȯ�յ����ֽ�"
    label var  c003002000	"ȡ�ý���յ����ֽ�"
    label var  c003004000	"�յ���������ʻ�йص��ֽ�"
    label var  c003005000	"����ծ��֧�����ֽ�"
    label var  c003006000	"�������������򳥸���Ϣ֧�����ֽ�"
    label var  c003006101	"����:�ӹ�˾֧���������ɶ��Ĺ���������"
    label var  c003007000	"֧����������ʻ�йص��ֽ�"
    label var  c003000000	"���ʻ�������ֽ���������"
    label var  c004000000	"���ʱ䶯���ֽ��ֽ�ȼ����Ӱ��"
    label var  c007000000	"�������ֽ��Ӱ��"
    label var  c005000000	"�ֽ��ֽ�ȼ��ﾻ���Ӷ�"
    label var  c005001000	"�ڳ��ֽ��ֽ�ȼ������"
    label var  c006000000	"��ĩ�ֽ��ֽ�ȼ������"


* == �ֽ�������(��ӷ�) ==

    label var  d000101000	"������"
    label var  d000117000	"δȷ�ϵ�Ͷ����ʧ"
    label var  d000102000	"�ʲ���ֵ׼��"
    label var  d000103000	"�̶��ʲ��۾ɡ������ʲ��ۺġ������������ʲ��۾�"
    label var  d000104000	"�����ʲ�̯��"
    label var  d000105000	"���ڴ�̯����̯��"
    label var  d000106000	"���ù̶��ʲ��������ʲ������������ʲ�����ʧ(�����Լ������У�"
    label var  d000107000	"�̶��ʲ�������ʧ(�����Լ�������)"
    label var  d000108000	"���ʼ�ֵ�䶯��ʧ(�����Լ�������)"
    label var  d000109000	"�������(�����Լ�������)"
    label var  d000110000	"Ͷ����ʧ(�����Լ�������)"
    label var  d000111000	"��������˰�ʲ�����(�����Լ�������)"
    label var  d000112000	"��������˰��ծ����(�����Լ�������)"
    label var  d000113000	"����ļ���(�����Լ�������)"
    label var  d000114000	"��Ӫ��Ӧ����Ŀ�ļ���(�����Լ�������)"
    label var  d000115000	"��Ӫ��Ӧ����Ŀ������(�����Լ�������)"
    label var  d000116000	"����"
    label var  d000100000	"��Ӫ��������ֽ���������"
    label var  d000201000	"ծ��תΪ�ʱ�"
    label var  d000202000	"һ���ڵ��ڵĿ�ת����˾ծȯ"
    label var  d000203000	"�������޹̶��ʲ�"
    label var  d000204000	"�ֽ����ĩ���"
    label var  d000205000	"�ֽ���ڳ����"
    label var  d000206000	"�ֽ�ȼ������ĩ���"
    label var  d000207000	"�ֽ�ȼ�����ڳ����"
    label var  d000200000	"�ֽ��ֽ�ȼ��ﾻ���Ӷ�"
   
     
             
*== ���մ���

    compress
    
  *= ����ȱ©ֵ   
      mvdecode _all, mv(-95 -97 -99)  
       
    replace nshrn=tshr if nshrn==.  // ��̩����nshrn�Ƚ�׼ȷ����ӳ�˹ɸ�
                                    // ��ȱ��1999����ǰ�����ϣ��ɲ���CCER���ݸ���֮
    drop totalshr tshr    
    rename province pp
    encode pp, gen(province) label(province_lab)
    drop pp
    
    * �ֺ�����  
    *  �ȶ�CCER��GTA���ݺ󣬷��ֽ���639/7727�һ��,�ʺϲ�֮
      replace div_cash = div_cash_GTA if div_cash==.
      drop div_cash_GTA
      gen div_yes = (div_cash!=.)
      label var div_yes "1=�������,0=��"
    
     label define final_lab 0 "����" 1 "��Ӫ" 2 "����" ///
           3 "����" 4 "�������" 5 "ְ���ֹɻ�" 6 "����"
     label value finalcontrol final_lab
     label value d21 final_lab  // d21��finalcontrol�Ķ�����ͬ
     
     label define y0501b_lab 1 "�޹���" 2 "�й���" 3 "��ȷ��"
     label value y0501b y0501b_lab
     
     replace y1001b=0 if y1001b==2
     label define y1001b_lab 1 "����" 0 "�Ǽ���"
     label value y1001b y1001b_lab
     
     label define y1401b_lab 1 "׼ȷ��¶" 2 "��������¶" 3 "׼ȷ+����" 4 "����"
     label value y1401b y1401b_lab
     
     replace y1801b=0 if y1801b==2
     label define y1801b_lab 1 "һ��" 0 "��һ��" 2 "�޷�ȷ��"
     label value y1801b y1801b_lab
     
     label drop heyi
     label define heyi_lab 1 "��ְ��һ" 2 "�����³�,���¼����ܾ�"  3 "��ְ��ȫ����" 11 "����"
     label value d07 heyi_lab
     
     * ��ҵ����
       * 2001��ҵ����ָ��
       gen sicmen_str = substr(nindcd,1,1)
       encode sicmen_str, gen(sicmen) label(sicmen_lab)
       gen sicda_str = substr(nindcd,1,3)
       encode sicda_str, gen(sicda) label(sicda_lab)
       label var sicmen_str "��ҵ�������(����)"
       label var sicmen     "��ҵ�������"
       label var sicda_str  "��ҵ�������(����)"
       label var sicda      "��ҵ�������"
       drop nindcd
       * 1999��ҵ����ָ��
         encode indnme, gen(sic99) label(sic99_lab)
         rename indnme sic99_str
         drop indcd
     
     
     drop if typrep == ""

     order  id year typrep stktype crcd sic* div* ///
            pyear byear styear province   /// 
            regcap  finalcontrol rr sigma ///
            ntshr ashr bshr hshr mv_total mv_atshr ///
            a* b* c* d* n* y*
     tsset id year
    
    
    save _GTA2008.dta, replace
    save D:\stata10\ado\personal\data\_GTA2008.dta, replace





