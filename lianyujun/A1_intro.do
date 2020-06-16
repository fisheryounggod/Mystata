



          *     -------------------------------------
          *     -------- ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ --------
          *     -------------------------------------
                    
          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *             ::µÚÒ»²¿·Ö::
          *              Stata ²Ù×÷
          *         =====================
          *           µÚÒ»½²  STATA¼ò½é
          *         =====================
	  
		  
   * cd D:\stata11\ado\personal\Net_course_A\A1_intro
   
	 cd `c(sysdir_personal)'Net_course_A\A1_intro
  
  
*----------------
*    ±¾½²Ä¿Â¼
*----------------
* 1.1  ±¾¿Î³Ì¼ò½é
* 1.2  STATA¸ÅÃ²
* 1.3  ÊäÈëºÍµ¼ÈëÊı¾İ 
* 1.4  ´æ´¢ºÍµ¼³öÊı¾İ  
* 1.5  ä¯ÀÀ×ÊÁÏ     
* 1.6  Ö´ĞĞÖ¸Áî
* 1.7  ĞŞ¸Ä×ÊÁÏ
* 1.8  log ÎÄ¼ş: ¼ÇÂ¼ÄãµÄ·ÖÎö¹ı³Ì 
* 1.9  do ÎÄµµ: ¸ßĞ§¿ì½İµØÖ´ĞĞÃüÁî
* 1.10 stataÓëExcel¡¢Word¡¢LaTeXµÄÇ×ÃÜ½Ó´¥  
* 1.11 Stata Éè¶¨



































          *===================================
          *        ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
          *         -1.1-  ±¾¿Î³Ì¼ò½é

		  
   
          
*------------------------
*->  Stata ÊÇºÎ·½ÉñÊ¥£¿
*------------------------

   * ¶ÌĞ¡¾«º·

   * ÔËËãËÙ¶È¼«¿ì

   * »æÍ¼¹¦ÄÜ×¿Ô½

   * ¸üĞÂºÍ·¢Õ¹ËÙ¶È¾ªÈË


   
*--------------------
*-> 1.1  ±¾¿Î³Ì¼ò½é
*--------------------

          *     ==±¾½ÚÄ¿Â¼==

          *     1.1.1 ¿Î³Ì¸ÙÒª
          *     1.1.2 ¿Î³ÌÌØµã
          *     1.1.3 ¿Î³ÌÅäÌ××ÊÁÏ
		  *     1.1.4 ¿Î³ÌÅäÌ××ÊÁÏµÄÊ¹ÓÃ·½·¨
          *     1.1.5 ÌÖÂÛºÍ½¨Òé
 
		  
*__________________
*  1.1.1 ¿Î³Ì¸ÙÒª

                                             /*
  µÚÒ»²¿·Ö£ºStata ²Ù×÷
    1£®Stata¼ò½é
    2£®Êı¾İ´¦Àí
    3£®STATA»æÍ¼
    4£®¾ØÕóÔËËã
    5£®STATA±à³Ì³õ²½

  µÚ¶ş²¿·Ö£º¼ÆÁ¿·ÖÎöÓëStataÓ¦ÓÃ(STATA¸ß¼¶°à£¬ÒÑ·¢²¼)
    1£®ÆÕÍ¨×îĞ¡¶ş³Ë·¨£¨OLS£©
    2£®¹ãÒå×îĞ¡¶ş³Ë·¨£¨GLS£©
    3£®·ÇÏßĞÔ×îĞ¡¶ş³Ë·¨£¨NLS£©
    4£®×î´óËÆÈ»¹À¼Æ£¨MLE£©
    5£®¹¤¾ß±äÁ¿·¨Óë GMM
    6£®Ê±¼äĞòÁĞ·ÖÎö
    7£®Ãæ°åÊı¾İÄ£ĞÍ
    8. Stata¸ß¼¶³ÌĞò
    9. Monte CarloÄ£ÄâÓë Bootstrap(×Ô³éÑù)

  µÚÈı²¿·Ö£ºStata Ó¦ÓÃ×¨Ìâ(¼´½«·¢²¼)
    1£® Mata Óï¾ä¸ß¼¶³ÌĞò
    2.  Logit/Probit Ä£ĞÍ
    3.  Tobit Ä£ĞÍ
    4.  Duration Ä£ĞÍ
    5.  ÊÂ¼şÑĞ¾¿·¨
    6.  Treatment Ğ§Ó¦Ä£ĞÍ(Heckman, DID, PSM µÈ)
    7.  ·ÖÎ»Êı»Ø¹éÄ£ĞÍ
    8.  Ò»°ã»¯ÏßĞÔ»Ø¹éÄ£ĞÍ(GLM)
    9.  ¶àÔªÅĞ±ğ·ÖÎö(discrim)
    10. Òò×Ó·ÖÎöºÍ¾ÛÀà·ÖÎö
	11. ¼ÙÉè¼ìÑé
	12. ¹ãÒå¾Ø¹À¼Æ GMM ±à³Ì
	13. Panel Data B(ÃÅ¼÷Ãæ°å\Panel VAR\PanelÁªÁ¢·½³ÌµÈ)
                                             */

*__________________
*  1.1.2 ¿Î³ÌÌØµã

   * ÏµÍ³ÓĞĞòµÄ½á¹¹°²ÅÅ£¬°ïÖúÄú¿ìËÙ½¨Á¢StataµÄÑ§Ï°¼Ü¹¹
   
   * ×¢ÖØÓëÊµ¼ÊÓ¦ÓÃÏà½áºÏ
   
   * ÏèÊµµÄÅäÌ××ÊÁÏ
    
	 *-±¾½²ÒåµÄ do-file ÒÔ¼° PDF ¸ñÊ½ 



*______________________
*  1.1.3 ¿Î³ÌÅäÌ××ÊÁÏ

   *-±¾¿Î³ÌÖĞÊ¹ÓÃµÄ do ÎÄµµºÍ ado ÎÄµµ
   
     *-stata do-file ¸ñÊ½£¬¿É¹©Á·Ï°²Ù×÷
	   cd D:\stata11\ado\personal\Net_course_A
	   doedit A1_intro.do
	  *-or
	   doedit D:\stata11\ado\personal\Net_course_A\A1_intro.do
	 
	 *-PDF ¸ñÊ½£¬¿É¹©´òÓ¡
	   cd D:\stata11\ado\personal\Net_course_A\pdf_dofiles
	   shellout  A1_intro.pdf 
	   
	 *-¿Î³ÌµÄÏêÏ¸Ä¿Â¼£¬¿ìËÙ²éÑ¯
	   shellout  Course_A_contents.pdf
	   
   
   *-·¶ÀıÊı¾İ
     cd D:\stata11\ado\examples  \\½¨Òé´æ·ÅÓÚ´Ë´¦
	 cdout
   
   * ¶ÔÓÚµÇÂ½¹ú¼ÊÍøÓĞÀ§ÄÑµÄÑ§Ô±£¬Ìá¹©STATA¹Ù·½·¶ÀıÊı¾İ°ü
   
   * STATAÍâ²¿ÃüÁî°ü£ºplus(500ÓÚÌõ)
     ado  // ³ÊÏÖÒÑ¾­°²×°µÄÍâ²¿ÃüÁî
   
		 
*________________________________
*  1.1.4 ¿Î³ÌÅäÌ××ÊÁÏµÄÊ¹ÓÃ·½·¨

   *-1.1.4.1 ¿Î³ÌÅäÌ××ÊÁÏµÄ´æ·ÅÎ»ÖÃ
   
     *-ÎÒÃÇÌá¹©µÄÑ¹Ëõ°ü£ºÖ»Ğè½âÑ¹ºó·ÅÖÃÓÚ D ÅÌ¸ùÄ¿Â¼ÏÂ¼´¿É
	 * ×¢Òâ£ºD:\stata11 ¶ø·Ç D:\stata11\stata11
	 
	 *-ÈôÓÃ×Ô¼ºµÄstataÈí¼ş£¬Ğè×öÈçÏÂÉè¶¨:
	 
	 * (1) profile.do ÎÄ¼ş·ÅÖÃÓÚstata°²×°Ä¿Â¼ÏÂ£¬
	 *     Èç D:\stata11\profile.do
	 *     ×¢£ºÈôÄãÒÑ¾­×ÔĞĞÉè¶¨ÁË¸ÃÎÄ¼ş£¬
	 *         Çë½«ÎÒµÄprofileÎÄ¼şºÏ²¢µ½ÄãµÄÎÄ¼şÖĞ
	 
	 * (2) ÖØĞÂ´ò¿ª stata£¬ÈôÉÏÊöÎÄ¼şÉè¶¨ÎŞÎó£¬Ôò»áÏÔÊ¾
	 *     ¡°running D:\stata11\profile.do ...¡±
	 
	 * (3) ÊäÈë sysdir ÃüÁî£¬»áÏÔÊ¾ÈçÏÂĞÅÏ¢
	 *
     *      STATA:  D:\stata11\
     *    UPDATES:  D:\stata11\ado\updates\
     *       BASE:  D:\stata11\ado\base\
     *       SITE:  D:\stata11\ado\site\
     *       PLUS:  D:\stata11\ado\plus\     // ´æ·ÅºÍÏÂÔØÍâ²¿ÃüÁîµÄÎ»ÖÃ
     *   PERSONAL:  D:\stata11\ado\personal\ // ¸öÈËÎÄ¼ş¼Ğ
     *   OLDPLACE:  D:\stata11\ado\myado\    // ×Ô¼º±àĞ´µÄ³ÌĞò


   *-1.1.4.2 ÈçºÎ´òÀ´±¾½²Òå (do-files)
     
	 *-·½·¨1£ºÒÀ´Îµã»÷ 
	 *   "New do-file editor"-->File-->Open Ö¸ÏòÈçÏÂÂ·¾¶
	 *    »òÊäÈë doedit£¬È»ºóµã»÷ File-->Open
	 *     D:\stata11\ado\personal\Net_course_A
	 *     Ë«»÷ A1_intro ¼´¿É
          
     *-·½·¨2£ºÒÀ´ÎÊäÈëÈçÏÂÃüÁî
        cd D:\stata11\ado\personal  //ÈôÆÁÄ»×óÏÂ·½ÏÔÊ¾µÄÂ·¾¶ÒÑÔÚ´Ë´¦£¬¿ÉÊ¡ÂÔ
	    cd Net_course_A
        doedit A1_intro.do 
	  *-or
	   doedit D:\stata11\ado\personal\Net_course_A\A2_data.do
	   
	 
   *-1.1.4.3 ¹ØÓÚ·¶ÀıÊı¾İ
     
	 *-stata¹Ù·½µÄ·¶ÀıÊı¾İ
	 
	   help dta_contents  // (File-->Example Datasets)
	   
	   *-×¢£º¶àÊıÒÑ¾­ÏÂÔØ£¬´æ·ÅÓÚ D:\stata11\ado\Examples
	   * ´ò¿ª·½Ê½£FFile-->Open-->D:\stata11\ado\Examples
	   
     *-±¾¿Î³ÌµÄ·¶ÀıÊı¾İ
        cd D:\stata11\ado\personal\Net_course_A\A1_intro
		cdout
		dir *.dta
   
   
*______________________
*  1.1.5 ÌÖÂÛºÍ½¨Òé

   *-ÈË´óÂÛÌ³¡¾¼ÆÁ¿°æ¡¿Ö®¡¾STATA×¨°æ¡¿£º
     view browse "http://www.pinggu.org/bbs/forum-67-1.html"
	  
   *-ÈË´óÂÛÌ³¡¾Í³¼ÆÈí¼şÅàÑµ°àVIPÔÚÏß´ğÒÉÇø¡¿
   *       http://www.pinggu.org/bbs/forum-114-1.html
     view browse "http://www.pinggu.org/bbs/forum-114-1.html"
      
   * ¡¾Arlion µÄ²©¿Í¡¿http://blog.cnfol.com/arlion
   *       ÔÚ°Ù¶ÈÖĞËÑË÷¹Ø¼ü´Ê ¡°Á¬Óñ¾ı ²©¿Í¡±
     view browse "http://blog.cnfol.com/arlion"
	 
   * ¡¾E-mail¡¿: arlionn@163.com
   
   * ¡¾Á¬Óñ¾ıÖ÷Ò³¡¿£º
     view browse   ///
	 "http://www.lingnan.net/intranet/teachinfo/dispuser.asp?name=lianyj"
   
   *-ÆäËü£º²Î¼û 1.11.1 Ğ¡½Ú
   
 



   






   

          *===================================
          *        ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
          *        -1.2- STATA ¸ÅÃ²
		  *        -1.3- ÊäÈëºÍµ¼ÈëÊı¾İ
          *        -1.4- ´æ´¢ºÍµ¼³öÊı¾İ
  
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	  
	  
*-------------------
*-> 1.2  STATA ¸ÅÃ² 
*-------------------

              *     ==±¾½ÚÄ¿Â¼==

              *     1.2.1 stata½çÃæ       
              *     1.2.2 Ê×´ÎÊ¹ÓÃSTATAµÄÒ»Ğ©»ù±¾Éè¶¨

			  
*__________________________
* 1.2.1 STATA½çÃæ

   * ËÄ¸ö´°¿Ú£¬Á½×é²Ëµ¥Ìõ

   *_____________________
   * Á½ÖÖÖ´ĞĞÃüÁîµÄ·½Ê½
     
     * µÚÒ»ÖÖ£º²Ëµ¥
	 
     * µÚ¶şÖÖ£ºÃüÁî
      
     * ÊµÀı 1->
     *   Ò»·İ¼òµ¥µÄ do ÎÄµµ
         doedit L1_intro_log_cs.do
		 
		 *-ÔÚ doÎÄµµÖĞÖ´ĞĞÃüÁîµÄ¿ì½İ·½Ê½£ºCtrl+D
     
     * ÊµÀı 2->
     *   Á¬Óñ¾ı,ÖÓ¾­·®.ÖĞ¹úÉÏÊĞ¹«Ë¾×Ê±¾½á¹¹¶¯Ì¬µ÷Õû»úÖÆÑĞ¾¿.
	 *                               ÄÏ·½¾­¼Ã,2007(1):23-38.
         doedit L1_intro_NFJJ.do
	  
		  
*____________________________________        
*- 1.2.2 Ê×´ÎÊ¹ÓÃSTATAµÄÒ»Ğ©»ù±¾Éè¶¨  

   *-³õ´ÎÊ¹ÓÃÊ±½çÃæÆ«ºÃµÄÉè¶¨ 
   
      help window manage
	  
   * -Éè¶¨·½·¨  
   *    Edit-->Preference-->General Preference °´Ï²ºÃÉè¶¨
   *    ×¢£º¿É½øÒ»²½Éè¶¨Í¼ĞÎÆ«ºÃ¡¢do-editorµÄ·ç¸ñµÈ
   
   * -±£´æÉè¶¨
   *    Edit-->Preference-->Save...-->New... ÈÎÒâÊäÈëÒ»¸öÃû³Æ£¬Èç song12
       window manage prefs save song_12
	
	
   * -µ÷ÈëÒÑÓĞµÄ½çÃæÆ«ºÃÉè¶¨£º 
   *    Edit-->Preference-->Load...-->Ñ¡ÔñÄãÏ²»¶µÄÉè¶¨
       window manage prefs load song_12
	   
	   
   *-stata11 ¶ÔÖĞÎÄµÄÖ§³ÖÎÊÌâ
   
   *  -[Results]´°¿Ú
   *    Edit-->Preference-->General Preference Results Color 
   *    Ñ¡Ôñ "Classic"
   *    Èç´Ë¿ÉÒÔ±£Ö¤-Results-´°¿ÚÖĞµÄÖĞÎÄ×Ö·ûµÃÒÔÕı³£ÏÔÊ¾
   
   *  -[help viewer]´°¿Ú
   *    Edit-->Preference-->General Preference Viewer Color 
   *    Ñ¡Ôñ "Custom 1"
   *    È¥µôËùÓĞ "Bold" Ç°ÃæµÄ¶Ô¹´£¬Èç´Ë¿É±£Ö¤helpÎÄ¼şÕı³£ÏÔÊ¾
   
   
   *-Stata11 ÊÖ²áµÄÉè¶¨
   *    Çë½«stata11ÊÖ²á(16¸öpdfÎÄµµ)·ÅÖÃÓÚ D:\stata11\utilities
   *    Ê¹ÓÃ·½·¨1£ºHelp > PDF Documentation ¿É´ò¿ªÕû¸öPDF°ïÖú
   *    help regress --> [section]Also see --> Manual:[R] regress
        help regress 
		

   *-ÎÄ¼şÄ¿Â¼
      pwd                          // ÏÔÊ¾stataµ±Ç°¹¤×÷µÄÂ·¾¶
      cd D:\stata11\ado\personal   // ½øÈëÖ¸¶¨ÎÄ¼ş¼Ğ
	  sysdir                       // stata¹Ù·½ÎÄ¼şµÄÂ·¾¶
	  doedit D:\stata11\profile.do // Ã¿´ÎÆô¶¯Ê±ĞèÒªÁ¢¿ÌÖ´ĞĞµÄÃüÁî
	  * Ïê¼û£º1.11.2 Ğ¡½Ú
	  
	  
	  
	  
   

          *===================================
          *        ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
		  *        -1.3- ÊäÈëºÍµ¼ÈëÊı¾İ
          *        -1.4- ´æ´¢ºÍµ¼³öÊı¾İ
		  
* ÊµÖ¤·ÖÎöµÄµÚÒ»²½£ºÊı¾İ´¦Àí£¡
* ÊÕ¼¯Êı¾İ¡¢´æ´¢¡¢ĞŞ¸Ä¡¢·ÖÎö¡¢Êä³ö½á¹û
		  
*----------------------
*-> 1.3 ÊäÈëºÍµ¼ÈëÊı¾İ  
*----------------------

     *     ==±¾½ÚÄ¿Â¼==

     *     1.3.1 ÊÖ¶¯ÊäÈë
     *     1.3.2 ´Ó .txt, excel ±í¸ñÖĞÕ³Ìù
     *     1.3.3 Ê¹ÓÃstataÃüÁî£ºinfile, insheet, infix
     *         1.3.3.1  ÒÔ-tab-·Ö¸ôµÄÊı¾İ£º  -insheet- ÃüÁî
     *         1.3.3.2  ÒÔ ¿Õ¸ñ ·Ö¸ôµÄÊı¾İ£º -infile- ÃüÁî
     *         1.3.3.3  µ÷ÈëSTATA¸ñÊ½µÄÊı¾İ£º-use- ÃüÁî
     *         1.3.3.4  µ÷ÈëExcel¸ñÊ½µÄÊı¾İ£º-xmluse-ÃüÁî
     *         1.3.3.5  ĞĞÁĞ¶Ôµ÷µÄÊı¾İ
     *     1.3.4 Ê±¼äĞòÁĞ×ÊÁÏ 
     *     1.3.5 Ãæ°å×ÊÁÏ
     *     1.3.6 STATA¹Ù·½Ìá¹©µÄ×ÊÁÏ
     *     1.3.7 ÆäËüÈí¼şÖĞµÄÊı¾İ


*                  =±¾½ÚÃüÁî=  
* ================================================
* input, infile, insheet, type, rename, xpose, cd
* dataout
* ================================================


*____________
* ÈıÖÖ·½Ê½£º

  *   ÊÖ¶¯ÊäÈë
  *   ´Ó txt »ò Excel ÎÄµµÖĞÕ³Ìù
  *   Ê¹ÓÃ Stata ÃüÁî


*__________________________
*-1.3.1 ÊÖ¶¯ÊäÈë (¼«ÉÙÊ¹ÓÃ) 

   clear
   input x y z
         1 2 3
         4 5 6
   end
   save mydata, replace  // ±£´æÊı¾İ
   use  mydata, clear    // µ÷ÈëÊı¾İ
   
   
  *-1.3.1.1  -clear- ÃüÁîµÄÊ¹ÓÃ (stata11 ¸üĞÂÁËÆä¹¦ÄÜ)
    
	*-stataÔËËãµÄÔ­Àí(ÄÚ´æµÄÊ¹ÓÃ)
	
	*-ÄÚ´æÖĞ´æ´¢µÄÄÚÈİ
	  sysuse auto, clear
	  des
	  label list
	     clear             // ×¢ÒâVariables´°¿ÚµÄ±ä»¯
	     label list
	  
	  sysuse auto, clear   // clear ²¢²»Ó°ÏìÓ²ÅÌÉÏ´æ´¢µÄÊı¾İ
	  
	  sum price weigh turn
	  return list          // ÄÚ´æÖĞ´æ´¢µÄÍ³¼Æ½á¹û
	  
	  reg price weight turn foreign
	  ereturn list         // ÄÚ´æÖĞ´æ´¢µÄ»Ø¹é½á¹û
	  
	     clear results
		 ret  list
		 eret list
	
	  matrix A = I(5)
	  mat list A
	  mat dir
	     clear matrix
		 mat dir
		  


*_________________________________      
*-1.3.2 ´Ó .txt, excel ±í¸ñÖĞÕ³Ìù     

* »ù±¾ÒªÇó£ºÊı¾İÊÇ-Tab-¼ü·Ö¸ôµÄ

    shellout d1.txt  // -tab-¼ü·Ö¸ôµÄÊı¾İ£¬¿ÉÒÔÖ±½Ócopy-paste
    shellout d1.xls  // Excel¸ñÊ½µÄÊı¾İ£¬Òà¿ÉÒÔÖ±½Ócopy-paste 
    
	edit             // ´ò¿ªÊı¾İ±à¼­Æ÷£¬ÌùÈëºó¿É±£´æÖ®
    

*___________________________________________________________
*-1.3.3 Ê¹ÓÃstataÃüÁî£ºinfile, insheet, infix, use, xmluse

  *-1.3.3.1 ÒÔ -tab- ·Ö¸ôµÄÊı¾İ£º -insheet-
  
    type d1.txt                  // ²é¿´Ô­Ê¼×ÊÁÏµÄĞÎÌ¬
    type d1.txt, showtabs
    shellout d1.txt
    insheet using d1.txt, clear

    type d11.txt                 // Ò»·İÃ»ÓĞ±äÁ¿Ãû³ÆµÄÊı¾İ
    insheet using d11.txt, clear
    rename v1  price
    rename v2  weight 
    rename v3  length

    * Òà¿ÉÔÚÊäÈëÊı¾İÊ±£¬Ö¸¶¨±äÁ¿Ãû³Æ
      insheet price weight length  using d11.txt, clear
    

  *-1.3.3.2 ÒÔ ¿Õ¸ñ ·Ö¸ôµÄÊı¾İ£º -infile- 
  
    shellout d21.txt
    insheet using d21.txt, clear     
                      //¿Õ¸ñ ·Ö¸ôµÄÊı¾İÎŞ·¨Ö±½ÓÓÃ-insheet-ÃüÁîµ¼Èë
    insheet using d21.txt, clear delimiter(" ") 
                      //ĞèÒªÍ¨¹ı delimiter Ñ¡ÏîÖ¸¶¨¡°·Ö¸ô·ûºÅ¡±
    infile v1 v2 v3 using d21.txt, clear  
                      //¿Õ¸ñ ·Ö¸ôµÄÊı¾İÓÃ-infile-ÃüÁîµ¼Èë±È½Ï·½±ã*/

    * °üº¬ÎÄ×Ö±äÁ¿µÄÇéĞÎ
      shellout d2.txt
      infile using d2.txt, clear        // ´íÎóµÄ·½Ê½
      infile v1-v5 using d2.txt, clear  // ÎÄ×Ö±äÁ¿È«²¿±ä³ÉÁËÈ±Â©Öµ
      browse                            // Ö¸¶¨±äÁ¿ÀàĞÍ(ÏÂÃæ)
      infile str30 v1  int v2  int v3  int v4  str10 v5 ///
             using d2.txt, clear  
      browse                                  

    * ¶ººÅ ·Ö¸ôµÄÊı¾İ
      type d3.txt
      shellout d3.txt
      infile str30 v1 int v2 int v3 int v4 str10 v5 using d3.txt, clear


  *-1.3.3.3 µ÷ÈëSTATA¸ñÊ½µÄÊı¾İ
  
    use d3.dta, clear
    use "D:\stata11\ado\Examples\XTFiles\invest2.dta", clear
    sysuse auto, clear
    
    *-ËµÃ÷£ºÊ¹ÓÃ STATA9 ÎŞ·¨´ò¿ª STATA10\11 °æ±¾ÏÂ´æ´¢µÄÊı¾İ£¬
    *       ´ËÊ±¿É²ÉÓÃÍâ²¿ÃüÁî -use10- ´ò¿ªstata10´æ´¢µÄÊı¾İ¡£


  *-1.3.3.4 µ÷ÈëExcel¸ñÊ½µÄÊı¾İ£º-xmluse-ÃüÁî
  
    *-×¢Òâ£ºĞèÒª°Ñ file.xls Áí´æÎª file.xml (Áí´æÀàĞÍÑ¡Ôñ"XML±í¸ñ")
	
    dir *.xls
    shellout d1.xls
	
    xmluse d1.xls, doctype(excel) clear firstrow  // ´íÎó£¡.xls ²»¿É
	
    shellout d1.xls    // "Áí´æÎª" -->XML±í¸ñ ¸ü¸ÄÎÄ¼şµÄ´æ´¢ÀàĞÍ
	
    dir d1.*   // ÏÔÊ¾µ±Ç°Ä¿Â¼ÏÂÒÔ d1. ¿ªÍ·µÄËùÓĞÎÄ¼ş
	
    xmluse d1.xml, doctype(excel) clear firstrow  // ÕıÈ·£¡.xml ¿ÉÒÔ
	
    browse    // µÚÒ»ÁĞÊı¾İºÜ¿í£¬ÎªÊ²Ã´£¿
    des       // make ±äÁ¿±»×Ô¶¯´æ´¢Îª str244
	
    compress  // ¾«¼ò×ÊÁÏµÄ´æ´¢½á¹¹
    des
    browse
	
	*-xmluse µÄÆäËüÑ¡Ïî
	  help xmluse


  *-1.3.3.5 ĞĞÁĞ¶Ôµ÷µÄÊı¾İ   
  
    shellout d5.txt       // ³£¹æÊı¾İ    
    shellout d51.txt      // ¶Ôµ÷Êı¾İ
	
    insheet using d51.txt, clear 
    browse
    xpose, clear          // ¶Ôµ÷
    browse
	
    rename v1 year        // ¸ø±äÁ¿ÖØÃüÃû
    rename v2 invest
    rename v3 income
    rename v4 consume


*_____________________
* 1.3.4 Ê±¼äĞòÁĞ×ÊÁÏ

  help tsset
  
  sysuse gnp96.dta, clear
  
  tsset date                         // Ö¸¶¨Ê±¼ä±äÁ¿
  
  gen gg = (gnp96-L.gnp96)/L.gnp96   // Ôö³¤ÂÊ
  
  tsset, clear                       // Çå³ıÊ±¼ä±äÁ¿
  
  gen gg2 = (gnp96-L.gnp96)/L.gnp96  // ´íÎó!


*_____________________
* 1.3.5 Ãæ°å×ÊÁÏ

  type d6_panel.txt
  insheet using d6_panel.txt, clear
  tsset code year    // stata8.0 ÒÔÏÂ°æ±¾ÊÊÓÃ
  xtset code year    // stata9.0 ÒÔÉÏ°æ±¾ÊÊÓÃ
  
* xpose ÃüÁîÍ¬ÑùÊÊÓÃÓÚÃæ°åÊı¾İ×ÊÁÏ
  shellout d6_pdpose.txt 
  insheet using d6_pdpose.txt, clear
  xpose, clear
  list, sepby(v1)


*____________________________
* 1.3.6 STATA¹Ù·½Ìá¹©µÄ×ÊÁÏ

  help dta_contents
  help dta_examples
  help dta_manuals
  use http://www.stata-press.com/data/r9/educ99gdp.dta,clear
  webuse lifeexp, clear    // ´Óstata¹ÙÍø»ñÈ¡Êı¾İ(µÈ¼ÛÓÚÈçÏÂÃüÁî)
  use http://www.stata-press.com/data/r10/lifeexp,clear


*________________________
* 1.3.7 ÆäËüÈí¼şÖĞÊı¾İ

  * -Stat/Transfer- Èí¼ş£º¿ì½İµØÔÚ²»Í¬Èí¼şÊı¾İ¸ñÊ½Ö®¼ä×ª»»
  * ÔÚstataÄÚ²¿£¬¿ÉÒÔÊ¹ÓÃ -stcmd- ÃüÁîµ÷ÓÃ Stat/Transfer£¬²¢Íê³ÉÊı¾İµÄ×ª»»
  * ¶ÔÓÚĞèÒª×ª»»´óÁ¿Êı¾İµÄÓÃ»§¶øÑÔ£¬Õâ¸ö·½·¨ºÜºÃ£¬ÇÒ¾ßÓĞ¿ÉÖØ¸´ĞÔ
  * ¿É²ÉÓÃ findit ÃüÁîËÑË÷²¢ÏÂÔØÈçÏÂÃüÁî£¬Èç
  
    findit usespss
  
  * -usespss- ½« SPSS ¸ñÊ½µÄÊı¾İµ¼Èë STATA
  
  * -fdasave- Save and use datasets in FDA (SAS XPORT) format
  
  * -usesas- ½« SAS ¸ñÊ½µÄÊı¾İµ¼Èë STATA 
  
  * -bugsdat- convert a Stata datafile into the S-plus format used in Winbugs

  * -Stata2mplus- Convert Stata files to Mplus files
  
  * -outdat- module to export data to other statistical packages
  *             such as LIMDEP, RATS, and SPSS
  
  * -dta2ras-, -ras2dta- ArcView/ArcInfo Óë stata Êı¾İÖ®¼äµÄÏà»¥×ª»»
    
  *-How do I convert among SAS, Stata and SPSS files?
  * http://www.ats.ucla.edu/stat/stata/faq/convert_pkg.htm


  
   
*----------------------
*-> 1.4 ´æ´¢ºÍµ¼³öÊı¾İ  
*----------------------   

    *     ==±¾½ÚÄ¿Â¼==

    *  1.4.1 ´æ´¢Êı¾İ
    *  1.4.2 µ¼³öºÍ×ª»»
    *      1.4.2.1 -outfile-ÃüÁî£º µ¼³öÎª .raw ÎÄ±¾¸ñÊ½
    *      1.4.2.2 -outsheet-ÃüÁî£ºµ¼³öÎª -Tab- ·Ö¸ôµÄÎÄ±¾ÎÄ¼ş
    *      1.4.2.3 -xmlsave-ÃüÁî£º µ¼³öÎª XML ¸ñÊ½
    *      1.4.2.4 -dataout-ÃüÁî£º µ¼³öÎª Word,Excel,Tex
    *      1.4.2.5 -outdat- ÃüÁî£º µ¼³öÎª spss, rats, limdep ¸ñÊ½  

  
*__________________
*- 1.4.1 ´æ´¢Êı¾İ

    shellout d3.txt
    infile str30 v1 int v2 int v3 int v4 str10 v5 using d3.txt, clear  
    save d3.dta, replace 
	
    * ×¢Òâ£ºÍ¨³£Ö»ÓĞÔÚ³õ´Îµ¼ÈëÊı¾İÊ±ÎÒÃÇĞèÒª±£´æÖ®£¬
    *       ´ËºóµÄ´¦Àí¶¼ÔÚdo-fileÖĞ½øĞĞ£¬Ö»Ğè±£´ædo-file¼´¿É¡£
	

*___________________________________  
*- 1.4.2 µ¼³öºÍ×ª»»(Áí´æÎªÆäËü¸ñÊ½)

  *-1.4.2.1 -outfile-ÃüÁî£ºµ¼³öÎª .raw ÎÄ±¾¸ñÊ½
  
      sysuse auto, clear
      outfile using myauto,replace 
	                         // ´æÎªÎÄ±¾¸ñÊ½,¿Õ¸ñ·Ö¸ô,80×Ö·û/ĞĞ
      dir myauto*
      winexec notepad myauto.raw // ´ò¿ªÊä³öµÄÎÄ±¾ÎÄµµ£¬.raw¸ñÊ½
	  
      *-Ñ¡ÏîÉè¶¨ [wide] Ñ¡Ïî  
      outfile using myauto, wide replace 
	                       // Ã¿¸ö¹Û²ìÖµÒ»ĞĞ£¬Ã»ÓĞ80/ĞĞµÄÏŞÖÆ 
      dir myauto*
      winexec notepad myauto.raw 
	  
      *-µ¼³ö²¿·Ö±äÁ¿ 
      outfile price-trunk foreign using myauto, wide replace 
      dir myauto*
      winexec notepad myauto.raw  
 	  
      
  *-1.4.2.2 -outsheet-ÃüÁî£ºµ¼³öÎª -Tab- ·Ö¸ôµÄÎÄ±¾ÎÄ¼ş
  
      sysuse auto, clear
      keep in 1/10
      outsheet price wei len using myauto, replace
      dir myauto*
      winexec notepad myauto.out
         
		 
  *-1.4.2.3 -xmlsave-ÃüÁî£ºµ¼³öÎªXML¸ñÊ½
  
      sysuse auto, clear
      xmlsave auto, doctype(excel) replace 
      shellout auto.xml
	  
 
  *-1.4.2.4 -dataout-ÃüÁî£ºµ¼³öÎª Word,Excel,Tex
  
    *-µ¼³öµ±Ç°Êı¾İ 
      sysuse auto, clear
      dataout, save(dataout01) excel replace
      dataout, save(dataout01) word replace
	  
	  keep make price weight rep78 gear foreign 
	  keep in 1/30
      dataout, save(dataout01) tex replace
    
	*-ÆäËüÊı¾İÎÄ¼şµÄ×ª»»
      shellout d1.txt 
      dataout using d1.txt, excel save(d1_excel) replace
      
      
	  
  *-1.4.2.5 -outdat- ÃüÁî£ºµ¼³öÎª .spss, .rats, .limdep ¸ñÊ½    
      
	  help outdat





	  
	  
	  
	  

          *===================================
          *        ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
          *         -1.5-  ä¯ÀÀ×ÊÁÏ

  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	  
	  
*-------------------
*-> 1.5   ä¯ÀÀ×ÊÁÏ
*-------------------

         *     ==±¾½ÚÄ¿Â¼==
         
         *     1.5.1 ±äÁ¿µÄÃû³Æ
         *     1.5.2 ²é¿´×ÊÁÏµÄ½á¹¹
         *         1.5.2.1 ¸ü¸Ä±äÁ¿µÄ´æ´¢ÀàĞÍ
         *         1.5.2.2 -list- ÃüÁîµÄÊ¹ÓÃ
         *         1.5.2.3 ¶¨Òå±äÁ¿µÄÏÔÊ¾¸ñÊ½
         *         1.5.2.4 Êı¾İºÍ±äÁ¿µÄ±êÇ© 
         *         1.5.2.5 ¸½¼ÓËµÃ÷ÎÄ×Ö
         *         1.5.2.6 ËÑË÷±äÁ¿
         *     1.5.3 »ù±¾Í³¼ÆÁ¿
         *         1.5.3.1 -summarize- ÃüÁî
         *         1.5.3.2 -codebook- ÃüÁî
         *         1.5.3.3 -inspect- ÃüÁî
         *         1.5.3.4 ÁĞ±íÍ³¼Æ(table, tabulate)
         *         1.5.3.5 ÂÛÎÄ¸ñÊ½µÄÍ³¼Æ±í¸ñ(tabstat)  
         *         1.5.3.6 ½«Í³¼Æ½á¹ûÊä³öµ½txtÎÄµµÖĞ
   
   
*                    =±¾½ÚÃüÁî=  
* ==================================================
* sysuse, use, describe, compress, label, summarize
* codebook, inspect, histogram, kdensity
* help, search, findit, recast, format
* ==================================================


*__________________
*-1.5.1 ±äÁ¿µÄÃû³Æ

  *-»ù±¾¹æÔò£º
    * (1) ÓÉÓ¢Îª×ÖÄ¸¡¢Êı×Ö»ò _ ×é³É£¬ÖÁ¶à²»³¬¹ı 32 ¸ö£»
    * (2) Ê××ÖÄ¸±ØĞëÎª ×ÖÄ¸ »ò _ £»
    * (3) Ó¢ÎÄ×ÖÄ¸µÄ´óĞ´ºÍĞ¡Ğ´¾ßÓĞ²»Í¬µÄº¬Òå£»
  
  *-Ê¾Àı£º  
    *  abc_1 a1 _a2 _Gdp_ ¶¼ÊÇºÏÀíµÄ±äÁ¿Ãû
    *  5gdp 2invest Ôò²»ÊÇ£»
  
  *-ÌØ±ğ×¢Òâ£º
    *  ½¨Òé²»ÒªÊ¹ÓÃ ¡°_¡± ×÷Îª±äÁ¿µÄµÚÒ»¸ö×ÖÄ¸£¬
    *  ÒòÎªĞí¶àstataµÄÄÚ²¿±äÁ¿¶¼ÊÇÒÔ _ ¿ªÍ·µÄ£¬
    *  Èç£¬_n, _N, _cons, _b µÈµÈ¡£
	
       help _variables


*_______________________
*-1.5.2 ²é¿´×ÊÁÏµÄ½á¹¹

  sysuse auto, clear
  describe
  describe, detail
  
  * ÁíÒ»¸öÏàËÆµÄÃüÁî
    help ds
    sysuse nlsw88.dta, clear
    ds
    ds, has(type int)
    
    ds, not(type byte)
    ret list
    dis "`r(varlist)'"  // ±à³ÌÊ±£¬¿ÉÒÔÀûÓÃ´Ë·µ»ØÖµ
    browse `r(varlist)'

    ds, detail
    

  *-1.5.2.1 ¸ü¸Ä±äÁ¿µÄ´æ´¢ÀàĞÍ
  
    sysuse auto, clear
    list gear_ratio in 1/5
    d gear_ratio
    recast int gear_ratio, force
    d gear_ratio
    list gear_ratio in 1/5
    compress                // ×Ô¶¯¾«¼ò×ÊÁÏµÄ´æ´¢¸ñÊ½ 
  
  
  *-1.5.2.2 -list- ÃüÁîµÄÊ¹ÓÃ      -list-
  
    list price, sep(10)
    list price in 1/30, sep(0)
    sort rep78
    list make price rep78 in 1/20, sepby(rep78)
    list price weight length, noobs
    list price weight length, noobs clean
    

  *-1.5.2.3 ¶¨Òå±äÁ¿µÄÏÔÊ¾¸ñÊ½     -format-
    
    * ¼ò½é£º
      * str18    ÎÄ×ÖĞÍ±äÁ¿£¬Ã¿¸ö¹Û²ìÖµÕ¼¾İ18¸ö¿Õ¸ñ
      * %-18s    ¿¿×óÁĞÓ¡ÓÚÆÁÄ»ÉÏ£»Èô  %18s£¬Ôò¿¿ÓÒÁĞÓ¡£»
	  *                            Èô %~18s, Ôò¾ÓÖĞÁĞÓ¡
      * %8.0g    ÔÚ `8.0' µÄÔ­ÔòÏÂ£¬ÒÔ¾¡Á¿¶àµÄÓĞĞ§Î»ÊıÁĞ³ö
      * %6.2f    ×Ü¹²Õ¼6¸ö¿Õ¸ñ£¬Ğ¡ÊıÎ»Õ¼Á½¸ö¿Õ¸ñ
	  
    * Ê¾Àı£º
      list price gear in 1/5
      format price %6.1f
      format gear  %6.4f
      list price gear in 1/5


  *-1.5.2.4 Êı¾İºÍ±äÁ¿µÄ±êÇ©        -label-
      
    *-a Ñù±¾±êÇ©
      sysuse auto, clear
      des 
      label data "ÕâÊÇÒ»·İÆû³µ¼Û¸ñ×ÊÁÏ"
      des
      
    *-b ±äÁ¿µÄ±êÇ©
      label var price    Æû³µ¼Û¸ñ
      label var foreign  "Æû³µ²úµØ(1 ¹úÍâ; 2 ¹úÄÚ)"
      des
      
    *-c Àà±ğ±äÁ¿µÄÎÄ×Ö±êÇ©(Êı×Ö-ÎÄ×Ö¶ÔÓ¦±í)  -label define-
      * label define ±êÇ©Ãû
      * label values ±äÁ¿Ãû ±êÇ©Ãû  //½«±äÁ¿ÖµºÍ±êÇ©ÁªÏµÆğÀ´
      browse
      label define repair  1 "ºÃ" 2 "½ÏºÃ" 3 "ÖĞ" 4 "½Ï²î" 5 "²î"
      label values rep78 repair
      browse
      
    *-d ±êÇ©µÄ¹ÜÀí  -labelbook-
      label dir
      label list
      label drop repair
      label list
      labelbook      // ÍÆ¼öÊ¹ÓÃ
      * ÁíÒ»¸öÀı×Ó
        sysuse nlsw88, clear
        labelbook


  *-1.5.2.5 ¸½¼ÓËµÃ÷ÎÄ×Ö   -notes-
  
    sysuse auto, clear
    note: Wang:ÇëÈ·ÈÏ-rep78-±äÁ¿ÖĞÈ±Â©ÖµµÄÔ­Òò        
	                          // ÎªÕû·İÊı¾İ¼ÓËµÃ÷
    notes
    note weight: Su, ×¢Òâ£¬¸Ã±äÁ¿Óëlength¸ß¶È¹²ÏßĞÔ£¡ 
	                          // Îªµ¥¸ö±äÁ¿¼ÓËµÃ÷
    notes

  
  *-1.5.2.6 ËÑË÷±äÁ¿   -lookfor-
  
    use nlswork_simple.dta, clear
    lookfor code
    lookfor wage
    lookfor married
    lookfor code married
    
    use d_lookfor.dta, clear  // ¶ÔÓÚ´óĞÍÊı¾İ·Ç³£·½±ã
    lookfor "¹Ì¶¨×Ê²ú"
    lookfor "ÏÖ½ğÁ÷Á¿¾»¶î" 
    lookfor "½è¿î"


*_____________________
*-1.5.3  »ù±¾Í³¼ÆÁ¿
  
  *-1.5.3.1 -summarize- ÃüÁî
  
    sysuse auto, clear
    summarize 
    format price %6.2f
    sum price, format
    su  price wei, detail

	
  *-1.5.3.2 -codebook- ÃüÁî
  
    codebook price weight
	
    codebook rep78        // µ±Ò»¸ö±äÁ¿ÖĞµÄ·ÇÖØ¸´ÖµĞ¡ÓÚ9¸öÊ±£¬
                          // Stata±ã»áÊÓ´Ë±äÁ¿ÎªÀà±ğ±äÁ¿£¬²¢ÁĞ±íÍ³¼ÆÖ®
				
				
  *-1.5.3.3 -inspect- ÃüÁî
  
    inspect price weight length  // Ïà¶ÔÓÚ codebook ÃüÁî£¬¸ÃÃüÁî»¹½øÒ»²½»æÖÆ³öÖ±·½Í¼£¬
                                 // ÒÔ±ã¶ÔÑù±¾µÄ·Ö²¼ÓĞ¸üÖ±¹ÛµÄÁË½â
                             
							 
  *-1.5.3.4 ÁĞ±íÍ³¼Æ -table-, -tabulate-
  
    sysuse auto,clear
	
    tabulate foreign
	
    tab      rep78
	
    table    rep78
	
    tab   foreign rep78
	
    table foreign rep78, c(mean price) f(%9.2f) center row col

	
	
  *-1.5.3.5 ÂÛÎÄ¸ñÊ½µÄÍ³¼Æ±í¸ñ  -tabstat-
  
    sysuse auto, clear
	
    tabstat price weight length
	
    tabstat price weight length, stats(mean p50 min max) 
	
    tabstat price weight length, stats(mean med min max) ///
	                             col(s) format(%6.2f)
	
    tabstat price weight length, s(mean p25 med p75 min max) ///
	                             c(s) f(%6.2f)
	
    tabstat price weight length, s(mean sd p25 med p75 min max) ///
                                 c(s) f(%6.2f) by(foreign)

								 
  *-1.5.3.6 ½«Í³¼Æ½á¹ûÊä³öµ½txtÎÄµµÖĞ   -tabexport-
  
    sysuse auto, clear
	
    tabexport turn trunk length using results.txt, ///
	      s(mean sd) replace
    shellout results.txt
	
    tabexport turn trunk length using results.txt,  ///
          s(mean sd) by(foreign) noreshape replace
		  
    tabexport turn trunk length using results.txt,  ///
          s(count mean sd) by(foreign) replace format(%3.0f %9.2f)
		  
    *-ËµÃ÷£ºformat() Ñ¡ÏîÓë s() Ñ¡ÏîÏà¶ÔÓ¦
      type results.txt
      shellout results.txt


*_____________________
*-1.5.4 »ù±¾Í¼ĞÎ·ÖÎö

  *-1.5.4.1 Ö±·½Í¼: Ñù±¾µÄ×ÜÌå·Ö²¼Çé¿ö
  
    sysuse nlsw88.dta, clear
	
    histogram wage
	
    gen ln_wage = ln(wage)
    histogram ln_wage          // ¶ÔÊı×ª»»ºóÍùÍù¸ü·ûºÏÕıÌ¬·Ö²¼
	
    histogram hours,frequency  // ×İ×ø±êÎª¶ÔÓ¦µÄÑù±¾Êı£¬¶ø·Ç±ÈÀı
    histogram ttl_exp, normal  // ¸½¼ÓÓë¸Ã±äÁ¿ N(u,s2) ²ÎÊıÖµÏàÍ¬µÄÕıÌ¬·Ö²¼Í¼
	
    histogram grade      
    histogram grade, discrete  // ÀëÉ¢±äÁ¿µÄÖ±·½Í¼±ØĞë¸½¼Ó discrete Ñ¡Ïî

	
	
	
  *-1.5.4.2 ÃÜ¶Èº¯ÊıÍ¼ 
  
    kdensity wage              // ËüÊÇÖ±·½Í¼µÄÆ½»¬ÇúÏß
    kdensity ln_wage, normal
	
 
  *-1.5.4.3 É¢µãÍ¼
  
    sysuse auto, clear
    twoway scatter price wei
    scatter mpg turn
  
  
  *-1.5.4.4 Ïà¹ØÏµÊı¾ØÕó
  
    sysuse auto, clear
    graph matrix price wei len mpg



	
	
	

	
	

          *===================================
          *        ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
          *          -1.6-  Ö´ĞĞÃüÁî 
		  *          -1.7-  ĞŞ¸Ä×ÊÁÏ
  
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	            
          
*-------------------
*-> 1.6   Ö´ĞĞÃüÁî
*-------------------

         *     ==±¾½ÚÄ¿Â¼==
         
         *     1.6.1 ¸ÅÀÀ
         *     1.6.2 ÃüÁîµÄÊÊÓÃ·¶Î§
         *         1.6.2.1 ÁĞ¾Ù¶à¸ö±äÁ¿
         *         1.6.2.2 Ñù±¾·¶Î§µÄÏŞÖÆ
         *     1.6.3 ÃüÁî×÷ÓÃµÄÔö¼õ£ºÊ¹ÓÃÑ¡Ïî
         
         
*______________
*-1.6.1  ¸ÅÀÀ
  
    * stataÃüÁîµÄÍ¨ÓÃ¸ñÊ½: command varlist [if] [in] [ , options] 
    * [if] [in] ÓÃÓÚÏŞÖÆÑù±¾·¶Î§ 
    * [options] ¡°¿ÉÑ¡Ïî¡±£¬Ôö¼ÓÁËÃüÁîµÄµ¯ĞÔ
  
       help sum                // ½â¶Á°ïÖúÎÄ¼ş
     
       sysuse nlsw88, clear
       sum wage hours ttl_exp if race==2, detail
       list wage grade race in 1/100, sepby(race)
       
    *-ÌØ±ğÌáĞÑ£º
      * (1) "[ ]" Îª¿ÉÑ¡Ïî£¬¿ÉÒÔ²»Ìî£¬µ«²»ÔÚ[]ÖĞµÄÄÚÈİ¶¼±ØĞëÌîĞ´
      * (2) Õû¸öÃüÁî¡°ÂãÂ¶¡±µÄ¶ººÅÖ»ÓĞÒ»¸ö£¬´ËÇ°ÎªÃüÁîÖ÷Ìå£¬´ËºóÎªÑ¡Ïî
      *     ËäÈ»Ñ¡ÏîÖĞ¿ÉÄÜÓĞ×ÓÑ¡Ïî£¬µ«×ÓÑ¡ÏîÇ°µÄ¶ººÅ²¢Î´¡°ÂãÂ¶¡±
      * ÀıÈç£º
        sysuse sp500, clear
        twoway line close date, title("ÊÕÅÌ¼Û", place(left))


*______________________
*-1.6.2 ÃüÁîµÄÊÊÓÃ·¶Î§

  *-1.6.2.1 ÁĞ¾Ù¶à¸ö±äÁ¿
  
    sum age race married never_married grade
    sum age-grade
    sum s*           // "*" ÊÇËïÎò¿Õ£¬¿ÉÒÔ±íÊ¾`ÈÎºÎ'³¤¶ÈµÄ×ÖÄ¸»òÊı×Ö
    sum ?a?e         // "?" ÊÇÖí°Ë½ä£¬Ö»ÄÜÌæ´ú`Ò»¸ö'³¤¶ÈµÄ×ÖÄ¸»òÊı×Ö 

  *-1.6.2.2 Ñù±¾·¶Î§µÄÏŞÖÆ
  
    sum in 10/20                       // µÚ10ÖÁµÚ20¸ö¹Û²ìÖµÖ®¼äµÄ¹Û²ìÖµ
    sum wage in -5/-1                  // µ¹Êı...
    sum wage hours if race == 1        // µÈÓÚ
    sum wage if race ~= 3              // ²»µÈÓÚ
    sum wage if (race==2)&(married==1) // ÇÒ
    sum wage if (race==3)|(married==0) // »ò
    sum wage if hours >= 40            // ´óµÈÓÚ



*_________________________________
*-1.6.3 ÃüÁî×÷ÓÃµÄÔö¼õ£ºÊ¹ÓÃÑ¡Ïî

    sum wage , d
    
    *-ËµÃ÷£ºstataÖ§³Ö¶àÊıÃüÁîºÍÑ¡ÏîµÄËõĞ´£¬
    *       °ïÖúÎÄ¼şÖĞ´øÏÂ»¬ÏßµÄ²¿·Ö±íÊ¾¿ÉÒÔËõĞ´µÄ³Ì¶È
    
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
            ytitle("¹É¼Û -- ×î¸ß, ×îµÍ, ÊÕÅÌ",place(top))
            ytitle("½»Ò×Á¿ (°ÙÍò¹É)", axis(2) bexpand just(left))
            xtitle(" ")
            legend(off)
            subtitle("S&P 500", margin(b+2.5))
            note("Êı¾İÀ´Ô´: ÑÅ»¢²Æ¾­£¡");
    #delimit cr


	  
	
	
*-------------------
*-> 1.7  ĞŞ¸Ä×ÊÁÏ
*-------------------

* Ä¿µÄ£º 
*   (1) ¶ÔÏÖÓĞ±äÁ¿½øĞĞĞŞÕıºÍ×ª»»
*   (2) ²úÉúĞÂµÄ±äÁ¿

         *     ==±¾½ÚÄ¿Â¼==
         
         *     1.7.1 ÊıÑ§±í´ïÊ½
         *     1.7.2 ±äÁ¿µÄ´´½¨ºÍĞŞ¸Ä
         *         1.7.2.1 ±äÁ¿µÄ´æ´¢ÀàĞÍ
         *         1.7.2.2 ´´½¨ĞÂ±äÁ¿
         *         1.7.2.3 ĞŞ¸Ä¾É±äÁ¿
         *         1.7.2.4 É¾³ı±äÁ¿ºÍÑù±¾Öµ
         *         1.7.2.5 ÒÆ¶¯±äÁ¿´°¿ÚÖĞ±äÁ¿µÄÎ»ÖÃ
         *         1.7.2.6 ¿ËÂ¡ÒÑÓĞ±äÁ¿
         *         1.7.2.7 ²ğ·Ö±äÁ¿
         *     1.7.3 Ñù±¾ÖµµÄÅÅĞò


*                     =±¾½ÚÃüÁî=  
* =====================================================
* gen, replace, drop, order, aorder, move, sort, gsort, 
* assert, count, compare, encode, decode, recode, 
* note, notes, notes drop, char, char list
* =====================================================

*___________________
*-1.7.1 ÊıÑ§±í´ïÊ½

  * ÈıÀà£º¹ØÏµÔËËã£»Âß¼­ÔËËã£»ËãÊõÔËËã

  * ¹ØÏµÔËËã·û  ==;  >;  <;  >=;  <=;  !=;  ~=
    sysuse auto,clear
    list price if foreign == 0
    sum price  if foreign != 1

  * Âß¼­ÔËËã·û£º & -->(Óë) ;  | -->(»ò)
    sysuse auto, clear
    sum price wei if (foreign==1 & rep78<=3)
    sum price wei if (rep78==1) | (rep78==5) | (foreign !=0)
    sum price wei if (rep78>2 & rep78<5) | (price>10000)

  * ËãÊõÔËËã·û£º+ - * / ^(Ãİ)
    display 5^2
    dis     1 - 3*2 + 4/5 - 9^3 
    dis     2*_pi 


*_________________________
*-1.7.2 ±äÁ¿µÄ´´½¨ºÍĞŞ¸Ä

  *-1.7.2.1 ±äÁ¿µÄ´æ´¢ÀàĞÍ

    *- ÕûÊıµÄ´æ´¢ÀàĞÍ
       * byte     ×Ö½ÚĞÍ     (-100, +100)
       * int      Ò»°ãÕûÊıĞÍ (-32000, +32000)
       * long     ³¤ÕûÊıĞÍ   (-2.14*10^10, +2.14*10^10)£¬¼´£¬Õı¸º21ÒÚ 
	   
    *- Ğ¡ÊıµÄ´æ´¢ÀàĞÍ
       * float    ¸¡µãĞÍ   8  Î»ÓĞĞ§Êı×Ö
       * double   Ë«¾«¶È   16 Î»ÓĞĞ§Êı×Ö
	   
    *- ×Ö·ûĞÍ±äÁ¿
       * str#     Èç str20 ±íÊ¾¸Ã±äÁ¿×î¶à°üº¬ 20 ¸ö×Ö·û
       *          Ã¿¸öºº×ÖÕ¼Á½¸ö×Ö·û
       sysuse auto, clear
       des 
       gen x = "ÖĞ¹ú"     // Ò»¸öºº×ÖÕ¼Á½¸ö×Ö·û
       des x
      
      
  *-1.7.2.2 ´´½¨ĞÂ±äÁ¿      -generate-
  
    *-»ù±¾·½Ê½
      sysuse auto, clear
	  
      generate price2  = price^2    // ¿É¼òĞ´Îª gen
      gen      price2f = price^2 if foreign==1
      gen      wlratio = weight/length 

	  
    *-ÊıÑ§º¯Êı×ª»»
	
       help math functions
	   
       sysuse nlsw88.dta, clear
	   
       gen ln_wage    = ln(wage)      // È¡¶ÔÊı
       gen sqrt_hours = sqrt(hours)   // ¿ª¸ùºÅ
	   
       gen int_wage   = int(wage)     // È¡Õû
       gen floor_wage = floor(wage)   // µÈ¼ÛÓÚÈ¡Õû
       gen ceil_wage  = ceil(wage)    // È¡ÕûÊıÉÏÏŞ
	   
       list *wage in 1/5

	   
  *-1.7.2.3 ĞŞ¸Ä¾É±äÁ¿   -rename-, -renvars-,  -replace-
    
    *-µ¥¸ö±äÁ¿ÖØÃüÃû   -rename-
      rename displacement  disp
   
    *-ÅúÁ¿ĞŞ¸Ä±äÁ¿Ãû³Æ -renvars-
      help renvars
	  sysuse auto, clear
      renvars price weight length  /  p wei len
      renvars p-wei, postfix(_new)  // ÅúÁ¿Ôö¼Óºó×º
      renvars mpg , prefix(old_)       // ÅúÁ¿Ôö¼ÓÇ°×º
      
	  
    *-ĞŞ¸Ä¹Û²ìÖµ       -replace-
	
      sysuse auto, clear
      replace price = 10000 if (price>10000)
      gen byte  bad = 0      // ÊÂÏÈÖ¸Ã÷±äÁ¿ÀàĞÍÊÇ¸ö²»´íµÄÏ°¹ß
      replace bad = 1 if (rep78>3)
      list rep78 bad
	  
      *-¸üÎªºÏÀíµÄ¶¨Òå·½Ê½
        replace bad=. if (rep78==.)
        list rep78 bad
		
      *-ÎÄ×Ö±äÁ¿¹Û²ìÖµµÄĞŞ¸Ä
         des make 
         list make in 50/59
         replace make="±¦Âí 320i" if (make=="BMW 320i") //Òª¼ÓË«ÒıºÅ!
         list make in 50/59
      

  *-1.7.2.4 É¾³ı±äÁ¿ºÍÑù±¾Öµ -drop-
  
    *- Stata¹Ù·½ÃüÁî -drop-
       drop price2             // É¾³ıÒ»¸ö±äÁ¿
       drop wlratio-bad2       // É¾³ıÒ»×é±äÁ¿
       list price in 1/5
       drop in 1/3             // É¾³ıÖ¸¶¨Çø¼äµÄ¹Û²ìÖµ
       drop if (rep78==.)      // É¾³ıÂú×ãÌØ¶¨Ìõ¼şµÄ¹Û²ìÖµ
       list price in 1/5
       drop _all               // É¾³ıÄÚ´æÖĞµÄËùÓĞ±äÁ¿
  
  
    *- Ò»Ğ©ÓĞÓÃµÄÍâ²¿ÃüÁî  -cap drop-; -dropvars-; -safedrop-
	
       *-cap drop-
         help capture
		          
		 capture drop price2
         gen price2 = price^2
         cap drop prcie wlratio bad2    // ÄÜ·ñÉ¾µôÕâÈı¸ö±äÁ¿£¿
         gen wlratio = weight/length
    
       *-dropvars- 
         dropvars price2 wlratio bad2   // µÈ¼ÛÓÚÈçÏÂÈıÌõÃüÁî
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
      

  *-1.7.2.5 ÒÆ¶¯±äÁ¿´°¿ÚÖĞ±äÁ¿µÄÎ»ÖÃ -order- -aorder- -move-
     
     sysuse auto, clear
	 
     order price weight length foreign
	 
	 order trunk, before(weight) // °ÑtrunkÒÆµ½weightÖ®Ç°
	    sysuse auto, clear
	    move trunk weight        // ¹¦ÄÜÍ¬ÉÏ,stata11ÒÔÇ°°æ±¾ÊÊÓÃ
		
	 order _all, alpha           // °´×ÖÄ¸¶Ô±äÁ¿ÅÅĞò
        aorder                   // ¹¦ÄÜÍ¬ÉÏ,stata11ÒÔÇ°°æ±¾ÊÊÓÃ
		
     
  *-1.7.2.6 ¿ËÂ¡ÒÑÓĞ±äÁ¿  -clonevar-
    
    * °ÑÒÑÓĞ±äÁ¿µÄ±êÇ©£¬Êı×Ö-ÎÄ×Ö¶ÔÓ¦±íµÈËùÓĞÄÚÈİ¶¼¸´ÖÆ¹ıÈ¥
      help clonevar 
	  
      sysuse auto, clear
	  
      clonevar foreign_c = foreign
	  
      gen foreign_g = foreign
      sort mpg
      list foreign* in 1/10
      browse


  *-1.7.2.7 ²ğ·Ö±äÁ¿      -separate-
      
      sysuse auto, clear
      separate mpg, by(foreign)
   
      * µÈ¼Û·½Ê½£ºµ«Ã»ÓĞ±äÁ¿±êÇ©
        gen mpg_f = mpg if (foreign==1)
        gen mpg_d = mpg if (foreign==0)
        
        browse


*____________________
*-1.7.3 Ñù±¾ÖµµÄÅÅĞò    -sort-  -gsort- 

      sysuse nlsw88.dta, clear
	  
      sort wage                 // Ä¬ÈÏÎªÉıĞòÅÅÁĞ
         list wage in 1/10
         dis "max = " wage[_N]
         sum wage
		 gen nag_wage = -wage
		 sort nag_wage          // ½µĞòÅÅÁĞ
		 
      gsort -wage               // ½µĞòÅÅÁĞ
         list wage in 1/10
		 
      gsort wage, gen(numb)     // ²úÉúÅÅĞò±àºÅ
         list numb wage in 1/10 
   

  
  
  
  
  
  
  
  
          *===================================
          *      ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
          *          -1.8- log ÎÄ¼ş 
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro
	

*----------------------------------
*-> 1.8 log ÎÄ¼ş: ¼ÇÂ¼ÄãµÄ·ÖÎö¹ı³Ì
*----------------------------------

         *     ==±¾½ÚÄ¿Â¼==
         
         *     1.8.1 log ÎÄ¼ş¼ò½é
         *     1.8.2 ½« log ÎÄ¼ş×ª»»ÎªÍøÒ³
         *         1.8.2.1 -log2html- ÃüÁî£ºÖÆ×÷¡°µ¥Ò³¡±ÍøÒ³
         *         1.8.2.2 -hyperlog- ÃüÁî£ºÖÆ×÷¡°¿ò¼ÜĞÍ¡±ÍøÒ³ 
         *         1.8.2.3 ÆäËûÃüÁî 
         
*____________________
*-1.8.1 log ÎÄ¼ş¼ò½é

  * ¼ÇÂ¼ÄãµÄ·ÖÎö¹ı³Ì: log ÎÄ¼ş 

    help log

    *- Ê¾Àı 1£º
       doedit L1_intro_log_cs.do
       dir *.log
       shellout paper01.log
    
    *- Ê¾Àı 2£º
	*
    *---------¼ÇÂ¼¿ªÊ¼---------
	*
      cd D:\stata11\ado\personal\Net_course_A\A1_intro
      sysuse auto, clear
      
      log using mylog1.log, text replace // _mylog1.log_-begin-__ 
         dis "Part I£ºÍ³¼Æ·ÖÎö"
         sum price weight length
      log close                          // _mylog1.log_-over-__   
      
         tab rep78  // ÕâĞ©·ÖÎö²»¼ÆÈë log ÎÄ¼ş
         des, detail
 
      log using mylog2.log, text replace // _mylog2.log_-begin-__ 
         tab rep78 foreign
         des price rep78 foreign, d
      log close                          // _mylog2.log_-over-__   
     *
	 *--------¼ÇÂ¼½áÊø---------

	 shellout mylog1.log
	 
	 shellout mylog2.log


	 
*____________________________
*-1.8.2 ½« log ÎÄ¼ş×ª»»ÎªÍøÒ³   

  *-  -log2html-, -hyperlog-, -autolog-, -logout-, -slog-
    
  *-1.8.2.1 -log2html- ÃüÁî£ºÖÆ×÷¡°µ¥Ò³¡±ÍøÒ³
    
    help log2html
    
    *-Ê¾Àı£º
      cap log close
      log using mylog, replace
        sysuse nlsw88, clear
        desc
        summ
        regress wage hours ttl_exp
      log close
    
      *-×ª»»ÎªÍøÒ³  
        log2html mylog, replace        // ×ª»» log --> ÍøÒ³
        shellout mylog.html            // ´ò¿ªÍøÒ³ 
        * ÄãÒ²¿ÉÒÔµ½µ±Ç°»î¶¯Ä¿Â¼ÏÂ´ò¿ª mylog.html ÎÄ¼ş
     
      *-¸½¼ÓÍøÒ³±êÌâ
        log2html mylog, replace title("ÃÀ¹ú¸¾Å®¹¤×ÊÓ°ÏìÒòËØÑĞ¾¿")
        shellout mylog.html
        * ×¢Òâ£º
          * ÎªÁËÄÜ¹»ÕıÈ·ÏÔÊ¾ÖĞÎÄ×Ö·û£¬ÇëÔÚ´ò¿ªÍøÒ³ºóÒÀ´Îµã»÷£º
          * "²é¿´(V)"-->"±àÂë(D)"-->¼òÌåÖĞÎÄ(GB2312) 
        
      *-Éè¶¨ÍøÒ³·ç¸ñ
        log2html mylog, replace input(ff3300) result(003333) bg(grey)
        shellout mylog.html
     

  *-1.8.2.2 -hyperlog- ÃüÁî£ºÖÆ×÷¡°¿ò¼ÜĞÍ¡±ÍøÒ³          
  
    help hyperlog
    
    doedit mylog.do         
    do mylog.do                             // Éú³É log ÎÄ¼ş
    
    hyperlog mylog.do mylog01.log, replace  // ×ª»»ÎªÍøÒ³
    
    shellout mylog_hlog.html                // ×¢ÒâÎÄ¼şÃûµÄ±ä»¯


  *-1.8.2.3 ÆäËûÃüÁî
  
    * -slog-     Éú³É¿ÉÇ¶Ì×µÄ log ÎÄ¼ş£¬ÊÊÓÚ³ÌĞòµ÷ÊÔºÍ´óĞÍ log ÎÄ¼şµÄÊéĞ´
    * -logout-   ½«stataÃüÁî½á¹ûÊä³öÖÁWord£¬Excel£¬TeXÖĞ£¬Ëæºó½éÉÜ
    * -autolog-  ¸üÎª¿ì½İ¶¨Òå log ÎÄ¼ş£¬ÓÃÓÚ¶¨Òå profile.do Æô¶¯ÎÄ¼ş
    *            ÎÒ×Ô¼º¶¨ÒåµÄ profile.do ÎÄ¼şÖĞ£¬
	*            ÒÑ¾­º­¸ÇÁËÕâ¸ö¹¦ÄÜ£¬¹Ê²»ÔÙ½éÉÜ



	
	
  
  
          *===================================
          *      ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
		  *          -1.9- do  ÎÄµµ	
		  
	 cd `c(sysdir_personal)'Net_course_A\A1_intro
	
	
*------------------------------------
*-> 1.9  do ÎÄµµ: ¸ßĞ§¿ì½İµØÖ´ĞĞÃüÁî
*------------------------------------

         *     ==±¾½ÚÄ¿Â¼==

         *     1.9.1 do ÎÄµµ¼ò½é
         *         1.9.1.1 ´ò¿ª do ÎÄµµ±à¼­Æ÷
         *         1.9.1.2 ±£´æºÍ¹Ø±Õ
         *         1.9.1.3 Ö´ĞĞ do ÎÄµµ
         *     1.9.2 ºÏÀí¹æ»®ÄãµÄdoÎÄµµ
         *         1.9.2.1 Ò»Ğ©»ù±¾¹æÔò
         *         1.9.2.2 ×¢ÊÍÓï¾ä
         *         1.9.2.3 ¶ÏĞĞ
         *         1.9.2.4 ´óĞÍ do ÎÄµµµÄÉè¶¨
         *     1.9.3 ÁĞÓ¡ÎÄ×Ö
         *         1.9.3.1 -display-ÃüÁî 
         *         1.9.3.2 ÁĞÓ¡µÄÑÕÉ«  
         *         1.9.3.3 ÁĞÓ¡µÄÎ»ÖÃ  
         *     1.9.4  ¹ØÓÚ±à¼­Æ÷
         *     1.9.5  do ÎÄ¼şµÄ×ª»»(ÖÆ×÷ÍøÒ³½Ì³Ì) 


      
*_______________________   
*-1.9.1 do ÎÄµµ¼ò½é 


*-> ==¸ÅÀÀ==

   *- do ÎÄµµÊµ¼ÊÉÏÊÇStataÃüÁîµÄ¼¯ºÏ£¬·½±ãÎÒÃÇÒ»´ÎĞÔÖ´ĞĞ¶àÌõstataÃüÁî;
   
   *- do ÎÄµµµÄÊ¹ÓÃÊ¹ÎÒÃÇµÄ·ÖÎö¹¤×÷¾ßÓĞ¿ÉÖØ¸´ĞÔ£»
   
   *- ÔÚÒ»ÆªÎÄÕÂµÄÊµÖ¤·ÖÎö¹ı³ÌÖĞ£¬ÎÒÃÇÍ¨³£½«Êı¾İµÄ·ÖÎö¹¤×÷Ğ´ÔÚ do ÎÄµµÖĞ
   
   
  *-1.9.1.1 ´ò¿ª do ÎÄµµ±à¼­Æ÷
  
    *- ·½·¨ 1£º
       doedit             // ´ò¿ª do-editor
       doedit mylog.do    // ´ò¿ªÒ»¸öÒÑ´æÔÚµÄ do ÎÄµµ£¬¿ÉÖ¸¶¨ÍêÕûÂ·¾¶        

    *- ·½·¨ 2£º
    *  µã»÷Rusults´°¿ÚÉÏ·½µ¹ÊıµÚÁù¸ö°´Å¥            
    
    *- ÉèÖÃÊôĞÔ£º
       * Edit --> Preferences 
       * ½¨ÒéÑ¡ÖĞ [Auto-indent] ºÍ [Save before do/run]

	   
  *-1.9.1.2 ±£´æºÍ¹Ø±Õ


  *-1.9.1.3 Ö´ĞĞ do ÎÄµµ
    
    *-Case1£ºÖ´ĞĞÒ»²¿·ÖÃüÁî  
      *  Ñ¡ÖĞĞèÒªÖ´ĞĞµÄÃüÁî£¬µã»÷doedit´°¿ÚÖĞµÚ¶şĞĞµ¹ÊıµÚÒ»¸öÍ¼±ê¡£ 
      *  ¡¾¿ì½İ¼ü¡¿£ºCtrl+D
      
         doedit L1_intro_do.do
    
    *-Case2£ºÕûÌåÖ´ĞĞ
         do L1_intro_do.do
         
  
    
*_________________________   
*-1.9.2 ºÏÀí¹æ»®ÄãµÄdoÎÄµµ
   
  *-1.9.2.1 Ò»Ğ©»ù±¾¹æÔò
   
    *-A. Ìá¸ß do ÎÄµµµÄ¿É¶ÁĞÔ
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
   
    *-B. ¶Ï¾äºÍ¶ÏĞĞ
	*
    *  Ã¿Ò»ĞĞµÄÓï¾ä²»ÒªÌ«³¤£¬²»ÓÃÍÏ¶¯ÏÂ·½µ¼ÒıÌõ¼´¿ÉÔÄ¶Á£»
    *  ¸÷¶Î´úÂë²ÉÓÃÒ»¸ö»ò¶à¸ö¿ÕĞĞ¼ÓÒÔ·Ö¸ô£»
   
   
  *-1.9.2.2 ×¢ÊÍÓï¾ä
    
     help comments
    
    *-Ê¾Àı£º
        * µÚÒ»ÖÖ×¢ÊÍ·½Ê½
        sum price weight    /* µÚ¶şÖÖ×¢ÊÍ·½Ê½ */
        gen x = 5           // µÚÈıÖÖ×¢ÊÍ·½Ê½
    
    
   *-1.9.2.3 ¶ÏĞĞ 
     
     *-ÈıÖÖ·½Ê½£º ¡°///¡± ¡¢ ¡°/* */¡± ¡¢ #delimit ÃüÁî
     
       *-µÚÒ»ÖÖ¶ÏĞĞ·½Ê½£º ///
         sysuse auto, clear 
         twoway (scatter price weight)       ///
                (lfit price weight),         ///
                title("É¢µãÍ¼ºÍÏßĞÔÄâºÏÍ¼")
               
       *-µÚ¶şÖÖ¶ÏĞĞ·½Ê½£º /* */
         twoway   (scatter price weight)      /*
               */ (lfit price weight),        /*
               */ title("É¢µãÍ¼ºÍÏßĞÔÄâºÏÍ¼")   
              
       *-µÚÈıÖÖ¶ÏĞĞ·½Ê½£º #delimit ÃüÁî
         #delimit ;
           twoway (scatter price wei)
                  (lfit price wei),
                  title("É¢µãÍ¼ºÍÏßĞÔÄâºÏÍ¼");
         #delimit cr
         
         *-ÁíÒ»ÖÖÏ°¹ß£º
           sysuse auto, clear
           #delimit ;
             des price wei;  sum price wei len;  reg price wei;
           #delimit cr
        
        
   *-1.9.2.4 ´óĞÍ do ÎÄµµµÄÉè¶¨ 
   
     * Éè¶¨Ò»¸öÖ÷ÎÄ¼ş£¬ÏÂÉè N ¸ö×ÓÎÄ¼ş£¬·Ö±ğ´¦ÀíÄ³Ò»²¿·Ö·ÖÎö¹¤×÷
     * ±£´æÔÚÍ¬Ò»¸öÎÄ¼ş¼ĞÏÂ
     
           doedit L1_main.do    

    
*___________________
*-1.9.3  ÁĞÓ¡ÎÄ×Ö
     
  *-1.9.3.1 -display-ÃüÁî
    
    dis 3 + 5*7 + sqrt(20)
	
    dis in g sin(_pi*0.5) + cos(0.9)
	
    dis _n(2) _dup(3) "I Love This GAME! "
    
    * ½«ÎÄ×ÖÖÃÓÚ " " »ò `" "' Ö®¼ä
       display "This is a pretty girl!"
       dis     `"This is a "pretty" girl!"'
  
  *-1.9.3.2 ÁĞÓ¡µÄÑÕÉ«
    
    * ÑÕÉ«1£ºred green yellow white
      dis in green "I like stata!"
      dis in w     "This " in y "is " in g "a " in red "pretty" in g " girl"
    
    * ÑÕÉ«2£ºas text(ÂÌÉ«)| as result(»ÆÉ«)| as error(ºìÉ«)| as input(°×É«)
      dis as result "Stata is Good !"
     
     
  *-1.9.3.3 ÁĞÓ¡µÄÎ»ÖÃ
  
     * ------------------------------------------
     *   ¸±ÃüÁî  |             ¶¨Òå                   
     * ------------------------------------------             
     *   _col(#) | ´ÓµÚ # ¸ñ¿ªÊ¼ÁĞÓ¡
     *   _s(#)   | Ìø¹ı # ¸ñ¿ªÊ¼ÁĞÓ¡
     *   _n(#)   | ´ÓµÚ # ĞĞ¿ªÊ¼ÁĞÓ¡
     *   _c      | ÏÂ´ÎÁĞÓ¡½â×ÅÁĞÓ¡¶øÎŞĞë´ÓÆğÒ»ĞĞ
     *   _dup(#) | ÖØ¸´ÁĞÓ¡ # ´Î
     * ------------------------------------------
     
       display "Stata is good"
       display _col(12) "Stata is good"
       display "Stata is good" _s(8) "I like Stata"
       display _dup(3) "Stata is good£¡ "
       display "Stata is good","I like it"
       display "Stata is good",,"I like it"
       display _n(3) "Stata is good"
     
     * ¸ü¾«ÃÀµÄÁĞÓ¡·½Ê½
       help smcl        // ÎÒÃÇÔÚ¸ß¼¶²¿·Ö»á¶Ô´Ë×÷ÏêÏ¸½éÉÜ
       
     * -display-µÄÒ»¸öÃîÓÃ£ºÇåÆÁ
       display _newline(100)  
       
       
*___________________
*-1.9.4  ¹ØÓÚ±à¼­Æ÷

    * ÈçÏÂÎÄµµÏêÏ¸½éÉÜÁËÈçºÎ°ÑÍâ²¿±à¼­Æ÷ÓëstataÁªÏµÆğÀ´
      * http://fmwww.bc.edu/repec/bocode/t/textEditors.html#disclaim 
    * stata11
      * ¸ßÁÁ¹¦ÄÜ(ÓëLaTeXÏà·Â)


*____________________________________
*-1.9.5 do ÎÄ¼şµÄ×ª»»(ÖÆ×÷ÍøÒ³½Ì³Ì)
 
   * -do2htm-   ÓÅµãÔÚÓÚ¿ÉÒÔ×Ô¶¯²åÈëÍ¼Æ¬

     doedit L1_do2htm_test.do         // ÎŞĞèÖ´ĞĞ
     do2htm L1_do2htm_test, replace   
	              // ½« do ÎÄ¼ş¼°Æä log ½á¹û×ª»»Îª html ÍøÒ³
   
   * ´ò¿ªÍøÒ³
     dir *.htm
     shellout L1_do2htm_test.htm
     * ×¢Òâ£º
     *     ÎªÁËÄÜ¹»ÕıÈ·ÏÔÊ¾ÖĞÎÄ×Ö·û£¬ÇëÔÚ´ò¿ªÍøÒ³ºóÒÀ´Îµã»÷£º
     *     "²é¿´(V)"-->"±àÂë(D)"-->¼òÌåÖĞÎÄ(GB2312) 
    
    
  
  
  
  
  
  
  
  
  
  
  
  
  
          *===================================
          *      ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *               ::µÚÒ»²¿·Ö::
          *                Stata ²Ù×÷
          * ============================================
          *             µÚÒ»½²  STATA¼ò½é
          * ============================================
          *  1.10  stataÓëExcel¡¢Word¡¢LaTeXµÄÇ×ÃÜ½Ó´¥
  
  
      cd `c(sysdir_personal)'Net_course_A\A1_intro    
	
	
*---------------------------------------------
*-> 1.10  stataÓëExcel¡¢Word¡¢LaTeXµÄÇ×ÃÜ½Ó´¥
*---------------------------------------------

         *     ==±¾½ÚÄ¿Â¼==

         *     1.10.1 Í³¼Æ±í¸ñ¡¢¾ØÕóµÄÊä³ö
         *          1.10.1.1  Êä³ö»ù±¾Í³¼ÆÁ¿ 
         *          1.10.1.2  Êä³öÏà¹ØÏµÊı¾ØÕó
         *          1.10.1.3  Êä³ö¾ØÕó  
         *          1.10.1.4  ÆäËüËµÃ÷
         *     1.10.2 ¹À¼Æ½á¹ûµÄÊä³ö
         *          1.10.2.1  esttab £º»Ø¹é½á¹ûµÄ³ÊÏÖ
         *          1.10.2.2  logout £ºÊä³ö ¡¾Excel¡¢Word¡¢TeXÎÄµµ¡¿
         *          1.10.2.3  xml_tab£º×¨ÒµÊä³ö ¡¾Excel ÎÄµµ¡¿
         *          1.10.2.4  outreg2£º×¨ÒµÊä³ö¡¾Word¡¢ExcelÎÄµµ¡¿
         
  
  
*_____________________________
*-1.10.1 Í³¼Æ±í¸ñ¡¢¾ØÕóµÄÊä³ö       -logout-

  *-»ù±¾Éè¶¨
    *  logout, save(filename) word(excel,tex) [options]:  ///
    *          Êä³öÍ³¼Æ±í¸ñ»òÁĞÊ¾¾ØÕóµÄÃüÁî
  
  
  *-1.10.1.1  Êä³ö»ù±¾Í³¼ÆÁ¿ 
  
            sysuse auto, clear 
            tabstat price wei len mpg rep78,        ///
            stats(mean sd min p50 max) c(s) f(%6.2f)   
    
    *- ¡¾Word¡¿ÎÄµµ           
    logout, save(mytable) word replace:       ///  
            tabstat price wei len mpg rep78,  ///
            stats(mean sd min p50 max) c(s) f(%6.2f) 
            
    *- ¡¾Excel¡¿ÎÄµµ        
    logout, save(mytable) excel replace:      ///
            tabstat price wei len mpg rep78,  ///
            stats(mean sd min p50 max) c(s) f(%6.2f) 
            
            
  *-1.10.1.2  Êä³öÏà¹ØÏµÊı¾ØÕó      
  
    logout, save(mytable) word replace:       ///
            pwcorr price wei len mpg rep78  
    logout, save(mytable) word replace:       ///
            pwcorr_a price wei len mpg rep78
            *-ËµÃ÷£º -pwcorr_a-ÃüÁîÓÉ Arlion ±àĞ´
  
 
  *-1.10.1.3  Êä³ö¾ØÕó                

    mat a = I(10) 
    mat list a                                 
    logout, save(mytable) word replace:  ///
            mat list a, nohalf       
      
  
 *-1.10.1.4  ÆäËüËµÃ÷
      
   *- -logout- Å¼¶û»áÓĞµãĞ¡ÎÊÌâ(¿Õ¸ñ)
      sysuse nlsw88, clear
      logout, save(mytable) word replace: tab occup 

   *- ÆäËûÃüÁî
      * tabout ±È½ÏÁé»î£¬µ«Êä³öºóµÄwordÎÄµµÎª-tab-·Ö¸ô£¬
      *        ÉĞĞèÊ¹ÓÃ±í¸ñ×Ô¶¯Ì×ÓÃ¹¦ÄÜ
      * tabexport, mkcorr, tabform, tablemat, tabone 
      *        ¶¼²»ÊÇºÜºÃÓÃ


	  
*________________________  
*-1.10.2  ¹À¼Æ½á¹ûµÄÊä³ö 
  
*         -esttab-, -logout-, -xml_tab-, -outreg2-
     
	 
  *-1.10.2.1  -esttab- ÃüÁî£º»Ø¹é½á¹ûµÄ³ÊÏÖ
    
    sysuse auto, clear   
    reg price wei
      est store m1
    reg price wei len
      est store m2
    reg price wei len mpg foreign
      est store m3
      
   *-»ù±¾ÓÃ·¨    
     esttab m1 m2 m3 
    
   *-ĞŞ¸ÄÏÔÖøË®Æ½£¬½ô´ÕµÄ·½Ê½³ÊÏÖ½á¹û
     esttab m1 m2 m3, ar2 compress nogap  ///
             star(* 0.1 ** 0.05 *** 0.01) 
            
   *-³ÊÏÖ p-value£¬ÖÃÓÚ "[]" ÖĞ    
     esttab m1 m2 m3, ar2 compress nogap  ///
             star(* 0.1 ** 0.05 *** 0.01) ///
             b(%6.3f) brackets p 
             
   *-³ÊÏÖ±ê×¼»¯ÏµÊı
     esttab m1 m2 m3, beta
    
   *-ÏÔÊ¾±äÁ¿µÄ±êÇ©£¬¶ø·Ç±äÁ¿Ãû
     label var weight "Æû³µÖØÁ¿"
     esttab m1 m2 m3, label
    
   *-³ÊÏÖµ¯ĞÔÏµÊı
     esttab m1 m2 m3, margin         // Ä¬ÈÏÇé¿öÏÂ£¬ÂÔÈ¥ Constant
     esttab m1 m2 m3, margin constant
    
   *-Êä³öÎÄ¼şµÄÆäËü¸ñÊ½
     esttab m1 m2 m3 using myout.html, replace // ÍøÒ³
	 
     esttab m1 m2 m3 using myout.tex, replace  // TeX ÎÄµµ
       * Õâ¸öÎÄµµ¿ÉÒÔÖ±½Ó²åÈë TeX ÖĞ£¬²ÉÓÃ \input{}
	     shellout mypdf.tex   // Ò»¸öÄ£°å
		 
     * ÆäËüÊä³öÀàĞÍ£ºsmcl, fixed, tab, csv, scsv, 
	 *               rtf, html, tex, and booktabs
    
	
   *-Êä³öÖÁ Excel
     esttab m1 m2 m3 using myout.csv, replace
     esttab m1 m2 m3 using myout.csv, replace   ///
           compress nogap nonotes               ///
		   addnotes("*** 1% ** 5% * 10%" "" "")
     * ËµÃ÷£º
     *   (1) -esttab- ÔÚÊä³öExcelÎÄµµÊ±£¬±ê×¢µÄÏŞÖÆË®Æ½²»ºÃ¿´£¬¹ÊĞŞ¸ÄÖ®
     *   (2) -addnotes()- Ñ¡ÏîÖĞµÄºóÁ½¸ö "" ÊÇ¿ÕÁ½ĞĞµÄÒâË¼£¬±ãÓÚºóĞø×·¼Ó
    
     * ÔÚÒÑÓĞÎÄ¼şµÄ»ù´¡ÉÏ×·¼ÓĞÂ½á¹û
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
			
       * ËµÃ÷£º
       *   (1) Èç¹ûÄãµÄÑĞ¾¿·Ö³É¶à¸ö²¿·Ö£¬Äã¿ÉÒÔÒÀ´Î×·¼Ó£»
       *   (2) Êä³öºóµÄ½á¹û´ÓExcelÖĞÕ³Ìùµ½Word£¬½öĞè¼òµ¥µ÷Õû¼´¿É
       *   (3) using file.csv ¿ÉÒÔÖ¸¶¨ÎÄ¼ş´æ´¢µÄ¾ßÌåÂ·¾¶
    


  *-1.10.2.2  -logout- ÃüÁî£ºÊä³ö ¡¾Excel¡¢Word¡¢TeXÎÄµµ¡¿  
          
    *-»ù±¾Éè¶¨
    *  logout, save(filename) word(excel,tex) [options]:  ///
    *          esttab ¡­¡­
                      
    *-Ê¾Àı
      sysuse auto, clear
	  
      * Excel ÎÄµµ
        logout, save(myreg) excel dec(3) replace:   ///
                reg price weight mpg rep78 foreign
				
      * Word ÎÄµµ
        logout, save(myreg) word dec(3) replace:    ///
                reg price weight mpg rep78 foreign
    
    *______________________________Ò»¸öÍêÕûµÄÀı×Ó_________________________
    * 
      *-Step1£º¹À¼ÆÄ£ĞÍ²¢´æ´¢½á¹û
        sysuse auto, clear   
        reg price wei
          est store m1
        reg price wei len
          est store m2
        reg price wei len mpg foreign
          est store m3
        
      *-Step2£ºlogout¡ª¡ª½á¹ûÖ±½ÓÊä³öµ½WordÎÄµµÖĞ
        logout, save(mylogout) word replace fix(3):     /// //×¢ÒâÃ°ºÅ
             esttab m1 m2 m3, mtitle(Ä£ĞÍ1 Ä£ĞÍ2 Ä£ĞÍ3) ///
                    b(%6.3f) se(%6.2f)                  /// //ÏµÊı¡¢±ê×¼Îó
                    star(* 0.1 ** 0.05 *** 0.01)        /// //ÏÔÖøË®Æ½µÄ±ê×¢
                    scalar(r2 r2_a N F) compress nogap  
    *_____________________________________________________________________                                             
      * ËµÃ÷£º
      *  (1) -fix(#)- Ñ¡Ïî¾ö¶¨ÁË×ª»»µÄÃô¸Ğ¶È£¬±¾ÀıÖĞ£¬fix(3)Ğ§¹û×î¼Ñ 
      *  (2) ¸ü¸Ä -word- Ñ¡Ïî£¬¿ÉÒÔÊä³öµ½ Excel(-excel-) »ò LaTeX ÖĞ(-tex-)
      *  (3) ÓÅÊÆ£ºÊä³öµÄ-Word-ÎÄµµ±È½ÏÃÀ¹Û
      *  (4) È±Ïİ£ºÎŞ·¨×·¼ÓĞÂµÄ½á¹û£¬
	  *      ĞèÒª¶à¸ö½á¹û·Ö±ğ´æ´¢µ½²»Í¬µÄ-Word-ÎÄ¼şÖĞ¡£
    
	  *-Àı£ºÊä³ö TeX ÎÄµµĞ
        logout, save(mylogout) tex replace fix(3):     /// 
             esttab m1 m2 m3, mtitle(Ä£ĞÍ1 Ä£ĞÍ2 Ä£ĞÍ3) ///
                    b(%6.3f) se(%6.2f)                  /// 
                    star(* 0.1 ** 0.05 *** 0.01)        /// 
                    scalar(r2 r2_a N F) compress nogap  
        
       
  *-1.10.2.3  -xml_tab- ÃüÁî£º×¨ÒµÊä³ö ¡¾Excel ÎÄµµ¡¿
  
    sysuse nlsw88, clear   
    reg wage hours married
      est store m1
    reg wage hours married ttl_exp south
      est store m2
    xi:reg wage hours married ttl_exp south i.race
      est store m3
    xi:reg wage hours married ttl_exp south i.race i.occupation
      est store m4  
          
    *-»ù±¾Éè¶¨  
      xml_tab m1 m2 m3 m4, replace
	  
      * ËµÃ÷£º
      *   (1) Ä¬ÈÏ´æ´¢ÓÚµ±Ç°»î¶¯Ä¿Â¼ÏÂ£¬Ãû³ÆÎª stata_out.xml£»
      *   (2) Ä¬ÈÏÏÔÊ¾±äÁ¿±êÇ©£¬¶ø·Ç±äÁ¿Ãû³Æ£¬±äÁ¿±êÇ©²»Ö§³ÖÖĞÎÄ
    
	
    *-ÉÔ×÷ÃÀ»¯
      xml_tab m1 m2 m3 m4, save(result) sheet(OLS) replace  ///
                           tstat below stats(r2 r2_a N)  
          
		  
    *-½øÒ»²½ÃÀ»¯
      xml_tab m1 m2 m3 m4, save(result) sheet(OLS) replace     ///
                           tstat below stats(r2 r2_a N)        ///
              drop(_Ioccup*) font("Times New Roman" 10)        ///
              title(Table 1 Basic Regression of US women wage) ///
              tblank(1) format(NCCR3)                          ///
              note("Occupation dummies are not presented")
      
	  * ËµÃ÷£º
      *   (1) Èô²¿·Ö±äÁ¿ÓĞÖĞÎÄ±êÇ©£¬ĞèÒªÊÂÏÈĞŞ¸Ä£¬»ò¸½¼Ó -nolabel- Ñ¡Ïî£»
      *   (2) ÓĞ¹Ø -format()- Ñ¡ÏîµÄÌîĞ´£¬Çë²ÎÔÄ°ïÖúÎÄ¼ş£»
      *   (3) save() Ñ¡ÏîÖĞ¿ÉÌîĞ´¾ßÌåµÄ´æ´¢Â·¾¶
      *   (4) ÓÅÊÆ£º¿ÉÒÔÓÃÒ»¸ö-Excel-ÎÄ¼ş´æ´¢¶à¸ö-sheet-       
       
	   
   *-Êä³ö½á¹ûµÄ×·¼Ó
     * ·ÖÎö¸¾Å®ÊÇ·ñ¼ÓÈë¹¤»áµÄÓ°ÏìÒòËØ
       logit union wage ttl_exp
       est store a1
       xi: logit union wage ttl_exp i.race i.occupation   
       est store a2
       xml_tab a1 a2, save(result) sheet(Logit) append  ///  //×¢Òâ´Ë´¦µÄ±ä»¯
                          tstat below stats(r2 r2_a N)  ///
             drop(_Ioccup*) font("Times New Roman" 10)  ///
             title(Table 2 Determinants of being a Union member) ///
             tblank(1) format(NCCR3)                             ///
             note("Occupation dummies are controlled, but not presented")      
       
	   * ËµÃ÷£º
       *   (1) ²»Í¬Àà±ğ»ò²»Í¬½×¶ÎµÄ»Ø¹é½á¹û£¬¿ÉÒÔ·Ö±ğ·ÅÈë²»Í¬µÄ sheet£¨£© ÖĞ£»
       *   (2) ³ıµÚÒ»¸ö sheet Ê¹ÓÃ -replace- Ñ¡ÏîÍâ£¬
	   *       ºóĞø×·¼ÓµÄ sheet Ê¹ÓÃ -append- Ñ¡Ïî
       *   (3) ÉÏÊö½á¹ûÉÔ×÷ÕûÀí¼´¿ÉÌùÈë-Word-£¬
	   *       ½¨ÒéÊ¹ÓÃ-Word-±í¸ñ×Ô¶¯µ÷Õû¹¦ÄÜ
     

  
  *-1.10.2.4 -outreg2- ÃüÁî£º×¨ÒµÊä³ö¡¾Word¡¢ExcelÎÄµµ¡¿ 
   
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
  
    *-»ù±¾ÓÃ·¨£ºÔÚÊı¾İ´°¿ÚÖĞ³ÊÏÖ½á¹û     
      outreg2 [m1 m2 m3] using tab01, seeout replace   
       
    *-Êä³ö Word »ò Excel ÎÄµµ
      outreg2 [m1 m2 m3] using tab01, word  replace 
      outreg2 [m1 m2 m3] using tab01, excel replace 
    
    *-Í¬Ê±Êä³öWordºÍExcelÎÄµµ(Òà¿ÉÔö¼Ó tex Ñ¡Ïî£¬Êä³ö tex ÎÄµµ)   
      outreg2 [m1 m2 m3] using tab01, word excel replace      
    
    *-Ê¹ÓÃ±äÁ¿±êÇ©
      label var hours "Ã¿ÖÜ¹¤×÷Ê±Êı"
      label var married "ÒÑ»é==1£¬Î´»é==0"
      outreg2 [m1 m2 m3] using tab01, word replace label
      outreg2 [m1 m2 m3] using tab01, word replace label(insert)  
	                                       // Í¬Ê±³ÊÏÖ±äÁ¿ºÍ±êÇ©
    
    *-s.e., tÖµ, Óë pÖµ
      outreg2 [m1 m2 m3] using tab01, word replace tstat   
	                                     // ³ÊÏÖ t-value
      outreg2 [m1 m2 m3] using tab01, word replace pvalue  
	                                     // ³ÊÏÖ p-value 
    
    *-Ğ¡ÊıµÄÏÔÊ¾·½Ê½  -tdec()-, -rdec()- Ñ¡Ïî
      outreg2 [m1 m2 m3] using tab01, word replace tstat tdec(2)  
	                                      // t-valueĞ¡ÊıµãºóÁ½Î» 
      outreg2 [m1 m2 m3] using tab01, word replace tstat rdec(3)  
	                                      // R2Ğ¡ÊıµãºóÈıÎ»  
    
    *- "()", "[]", Óë " "
      outreg2 [m1 m2 m3] using tab01, word replace pvalue bracket tdec(3)
      outreg2 [m1 m2 m3] using tab01, word replace tstat tdec(2) noparen 
    
    *-ĞÂ½á¹ûµÄ×·¼Ó  
      logit union wage married wage d_race* d_occu*
      est store logit
      outreg2 [logit] using tab01, word append      
  
    *-µ¯ĞÔÏµÊı¡¢±ê×¼»¯ÏµÊıºÍ±ß¼ÊĞ§¹û
      reg wage hours ttl_exp married 
      mfx, eyex                              // ¼ÆËãµ¯ĞÔÏµÊı
      outreg2 using tab02_mfx, word replace  // -replace- ĞÂ½¨wordÎÄµµ
        
      reg wage hours ttl_exp married d_race*
      mfx, eyex
      outreg2 using tab02_mfx, word append   // ×·¼Ó½á¹û
        
	  reg wage hours ttl_exp married d_race* d_occu*
      mfx, eyex  
      outreg2 using tab02_mfx, word append   // ½øÒ»²½×·¼Ó½á¹û
             
    *-ÓĞÑ¡ÔñµØ³ÊÏÖ±äÁ¿
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              drop(d_occu*)                                     
      * ËµÃ÷£º
      *   (1) Òà¿ÉÊ¹ÓÃ keep() Ñ¡ÏîÉ¸Ñ¡ĞèÒª³ÊÏÖµÄ±äÁ¿£»
      *   (2) Ê¹ÓÃ order() Ñ¡Ïî¿ÉÒÔ¸Ä±ä±äÁ¿µÄÏÈºóË³Ğò 
       
    *-±í¸ñµÄ±êÌâ
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("±í1: ÃÀ¹ú¸¾Å®¹¤×Ê¾ö¶¨ÒòËØ¹À¼Æ½á¹û") 

    *-×îºóÒ»ĞĞµÄÍ³¼ÆÁ¿: adj-R2, FÖµ
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("±í1: ÃÀ¹ú¸¾Å®¹¤×Ê¾ö¶¨ÒòËØ¹À¼Æ½á¹û")  ///
              drop(d_occu*)                               ///
              adjr2 e(F ll)                                     
             
    *-ÖØĞÂ¶¨Òå×¢ÊÍ
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("±í1: ÃÀ¹ú¸¾Å®¹¤×Ê¾ö¶¨ÒòËØ¹À¼Æ½á¹û")  ///
              drop(d_occu*)  nonote                       /// 
              addnote("×¢£º(1)***,**,*·Ö±ğ±íÊ¾ÔÚ1%,5%ºÍ10%Ë®Æ½ÉÏÏÔÖø;",  ///
                          "(2)À¨ºÅÖĞÎª±ê×¼Îó;",                          ///
                          "(3)m3ÖĞ¿ØÖÆÁËÖ°ÒµĞéÄâ±äÁ¿ d_occu2-d_occu13¡£")  
      * ËµÃ÷£º
	  *
      *  (1) -nonote-  Ñ¡Ïî£º
	  *      ²»ÏÔÊ¾Ô­ÓĞÓ¢ÎÄ×¢ÊÍ "Standard errors in parentheses" 
      *      ºÍ "*** p<0.01, ** p<0.05, * p<0.1"  
	  *
      *  (2) -addnote-  Ñ¡Ïî£ºaddnote("×¢ÊÍ1", "×¢ÊÍ2", "×¢ÊÍ3")    
      

	  
    *__-<-<-<-<- ¡¾Ò»¸öÄ£°å¡¿ ->->->->-__
    *   
    *- ÌØÕ÷: 
    *   (T1) ¸½¼Ó±í¸ñ±êÌâ£»
    *   (T2) µ÷Õû±äÁ¿µÄÏÔÊ¾Ë³ĞòºÍ¶à¹Ñ -drop()-, -sortvar()-
    *   (T3) t-value Ğ¡ÊıµãºóÏÔÊ¾Á½Î»£»adj-R2  Ğ¡ÊıµãºóÏÔÊ¾ÈıÎ»£»
    *   (T4) ĞŞ¸Ä±í¸ñ×¢ÊÍ£»
    *
    *________________________________outreg2Ä£°å____________________________  
      outreg2 [m1 m2 m3] using tab01, word replace        ///
              title("±í1: ÃÀ¹ú¸¾Å®¹¤×Ê¾ö¶¨ÒòËØ¹À¼Æ½á¹û")  ///   // (T1)
              drop(d_occu*) sortvar(married hours)        ///   // (T2)
              tdec(2) rdec(3)  adjr2 e(F)                 ///   // (T3)
              nonote                                      ///   // (T4)
              addnote("×¢£º(1)***,**,*·Ö±ğ±íÊ¾ÔÚ1%,5%ºÍ10%Ë®Æ½ÉÏÏÔÖø;",  ///
                          "(2)À¨ºÅÖĞÎª±ê×¼Îó;",                          ///
                          "(3)ÆäËü×¢ÊÍÓï¾ä¡£")    
    *_______________________________________________________________________                            
            
            
    *-¶à·½³ÌÄ£ĞÍ½á¹ûµÄ³ÊÏÖ
      *-Ê¾Àı1£ºSURÄ£ĞÍ
        use invest2.dta, clear
        sureg (invest1 market1 stock1)  ///
              (invest2 market2 stock2)  ///
              (invest3 market3 stock3)  ///
              (invest4 market4 stock4)  ///
              (invest5 market5 stock5), corr  
        outreg2 using table2, word replace       
		                         // µ¥¸öÄ£ĞÍµÄ³ÊÏÖ£¬ÎŞĞèest store 
        outreg2 using table2, word replace long  // ³¤ÌõĞÎÏÔÊ¾½á¹û
     
      *-Ê¾Àı2£ºMultinomial Logit Ä£ĞÍ -mlogit-
        use fullauto, clear
        replace wei = wei/1000
        replace price = price/1000
        mlogit rep77 mpg wei price rseat foreign
        outreg2 using table2, word replace
     
        
*- ÆÀÊö£º

*  (1) ÕûÌå¶øÑÔ£¬-outreg2- ÃüÁî×îÎªºÃÓÃ£¬
*      ¿ÉÒÔÍ¬Ê±ÊµÏÖ¶Ô Word, Excel, LaTeX µÄÖ§³Ö

*  (2) -esttab-, -xml_tab- ÓÃÆğÀ´Ò²±È½Ï·½±ã


 
 
  
  
  
  
  

  
  
          *===================================
          *      ¼ÆÁ¿·ÖÎöÓëSTATAÓ¦ÓÃ
          *===================================

          *        Ö÷½²ÈË£ºÁ¬Óñ¾ı ²©Ê¿

          *        µ¥  Î»£ºÖĞÉ½´óÑ§ÁëÄÏÑ§Ôº½ğÈÚÏµ
          *        µç  ÓÊ: arlionn@163.com
          *        Ö÷  Ò³: http://blog.cnfol.com/arlion 

          *           ::µÚÒ»²¿·Ö::
          *            Stata ²Ù×÷
          *       =====================
          *         µÚÒ»½²  STATA¼ò½é
          *       =====================
          *         -1.11- Stata Éè¶¨

      cd `c(sysdir_personal)'Net_course_A\A1_intro  
	  
		  
*--------------------
*-> 1.11 Stata Éè¶¨
*--------------------

         *     ==±¾½ÚÄ¿Â¼==

         *     1.11.1 Stata°ïÖú
         *     1.11.2 ÎÄ¼şÄ¿Â¼
         *     1.11.3 Stata Íâ²¿ÃüÁîµÄ»ñÈ¡
         *          1.11.3.1 Íâ²¿ÃüÁîµÄ´æ´¢Â·¾¶ 
         *          1.11.3.2 Íâ²¿ÃüÁîµÄ»ñÈ¡·½Ê½
         *          1.11.3.3 Íâ²¿ÃüÁîµÄ¹ÜÀíºÍ¸üĞÂ
         *     1.11.4 Stata µÄÏµÍ³²ÎÊı  
         *     1.11.5 ÎÄ¼şºÍÎÄ¼ş¼ĞµÄ²Ù×÷
         *          1.11.5.1  ÎÄ¼şµÄ»ù±¾²Ù×÷£º²éÕÒ¡¢¸´ÖÆ¡¢±à¼­ºÍÉ¾³ı
         *          1.11.5.2  Ê¹ÓÃstata´ò¿ªtxt, Word, Excel, ÍøÒ³ÎÄ¼ş
         *          1.11.5.3  ÎÄ¼ş¼ĞµÄ²Ù×÷
         *     1.11.6  Ã¿´ÎÆô¶¯Ê±¾ùĞèÖ´ĞĞµÄÃüÁî(profile)
         *     1.11.7  ³£ÓÃ¿ì½İ¼ü
         *     1.11.8  ÍË³östata(exit)
         
         
*__________________
*-1.11.1 Stata°ïÖú    -help-, -search-, -hsearch-, -findit-

  * -help-ÃüÁî
  * -search-ÃüÁî   searches the [keywords] of the help files; 
  * -hsearch-ÃüÁî  searches the help files [themselves].
  * -findit-ÃüÁî   ÀàËÆ-search-ÃüÁî£¬µ«¿ÉÒÔ½øÒ»²½ËÑË÷ÍøÂçÉÏµÄĞÅÏ¢
  
    help regress
    search panel data, net
    hsearch "fixed effect"
    findit panel unit root

  * -view- ÃüÁî  ĞÂ¿ª´°¿ÚÏÔÊ¾
  
    view search panel data, net        // ĞÂ¿ª´°¿ÚÏÔÊ¾½á¼ìË÷¹û
    view news                          // ÏÔÊ¾stataµÄ×î½ü¶¯Ì¬
    view browse http://www.baidu.com   // ´ò¿ªÍøÒ³
    viewsource winsor.ado              // ²é¿´ ado ÎÄ¼şÔ´ÎÄ¼ş£¬Ö»¶Á
    viewsource xtreg_fe.ado
    viewsource xtbalance.ado
  
  
  *-¸ü¶àµÄ°ïÖúºÍÌÖÂÛ
  
    *- ³£¼ûÎÊÌâ½â´ğ£ºFAQ  
       view browse http://www.stata.com/support/statalist/faq 
	   
    *- ¼ÓÈëSTATAÓÃ»§ÓÊ¼şÁĞ±í
       view browse http://www.stata.com/statalist/
	   
    *- ÈË´ó¾­¼ÃÂÛÌ³¡¾stata×¨°æ¡¿
       view browse http://www.pinggu.org/bbs/forum-67-1.html
	   
    *- ÈË´ó¾­¼ÃÂÛÌ³¡¾VIP´ğÒÉ×¨Çø¡¿
       view browse http://www.pinggu.org/bbs/forum-114-1.html  



*___________________
*-1.11.2  ÎÄ¼şÄ¿Â¼      -help sysdir-

  *-1.11.2.1 stata ÏµÍ³Ä¿Â¼µÄÉè¶¨
  
    sysdir        // ÏÔÊ¾µ±Ç°ÏµÍ³Ä¿Â¼µÄÉè¶¨

    *- ÊÍÒå£º
       *    STATA:  D:\stata11\			     stata °²×°¸ùÄ¿Â¼
       *  UPDATES:  D:\stata11\ado\updates\	¡¾¸üĞÂÎÄ¼ş¡¿µÄ´æ´¢µØÖ·
       *     BASE:  D:\stata11\ado\base\	¡¾¹Ù·½ÃüÁî¡¿´æ´¢µØÖ·
       *     SITE:  D:\stata11\ado\site\	¡¾×Ô±àÃüÁî¡¿´æ´¢µØÖ·
       *     PLUS:  D:\stata11\ado\plus\	¡¾Íâ²¿ÃüÁî¡¿µÄ´¢´æµØÖ·
       * PERSONAL:  D:\stata11\ado\personal\¡¾×ÔÓĞÎÄ¼ş¼Ğ¡¿Ê×´Î°²×°Ê±£¬ĞèÒª×Ô½¨			
  
    *- ²é¿´
	   pwd             // µ±Ç°¹¤×÷Â·¾¶
       personal        // ÏÔÊ¾Â·¾¶(¸öÈËÎÄ¼ş¼Ğ)
       personal dir    // ²é¿´ÏêÇé
       
    *- Éè¶¨   help sysdir  
       sysdir set PLUS      "D:\stata11\ado\plus"      // Íâ²¿ÃüÁîµÄ´æ·ÅµØÖ·
       sysdir set PERSONAL  "D:\stata11\ado\personal"  // ¸öÈËÎÄ¼ş¼Ğ 
       
       adopath + "D:\mypaper\my_ado"      // Ôö¼ÓĞÂµÄ²éÑ¯Ä¿Â¼
       adopath - "D:\mypaper\my_ado"      // È¡ÏûÌØ¶¨²éÑ¯Ä¿Â¼
       

	   
*______________________________
*-1.11.3  Stata Íâ²¿ÃüÁîµÄ»ñÈ¡   

*         -findit-, -ssc-, -net-, -adoupdate-, -mypkg-

  *-1.11.3.1 Íâ²¿ÃüÁîµÄ´æ´¢Â·¾¶  
  
    *-ËµÃ÷£º
    *  (1) Ä¬ÈÏÇé¿öÏÂ£¬stata»áÔÚ "...\stata11\ado\plus" ÎÄ¼ş¼ĞÏÂ´æ´¢Íâ²¿ÃüÁî
    *  (2) ¿ÉÍ¨¹ı -sysdir set- ÃüÁî¸ü¸ÄÖ®
    *  (3) µÚÒ»´ÎÏÂÔØÍâ²¿ÃüÁîÊ±£¬stata»á×Ô¶¯½¨Á¢ \plus ÎÄ¼ş¼Ğ
    
    sysdir

    
  *-1.11.3.2 Íâ²¿ÃüÁîµÄ»ñÈ¡·½Ê½

    *-findit-ÃüÁî£ºÄ£ºı²éÑ¯
      findit panel data
      findit normal test
 
    *-ssc-ÃüÁî£º°²×°(Ğ¶ÔØ)À´Ô´ÓÚ ssc µÄÃüÁî
	*           ssc: Statistical Software Components
      help ssc             // http://www.repec.org/
      ssc whatsnew
      * ²é¿´À´Ô´ÓÚ SSC µÄÍâ²¿ÃüÁîÁĞ±í
        ssc describe b    // ÁĞÊ¾ÒÔ -b- ¿ªÍ·µÄËùÓĞÃüÁî£¬¿ÉÎª a-z,ÒÔ¼° "_"
        ssc describe x
        ssc des winsor      
      * ÏÂÔØ°²×° ssc ÃüÁî              
        ssc install winsor, replace

    *-net-ÃüÁî
      help net
      *
      *-Ê¾Àı
              net search hausman test
         view net search hausman test
              net from http://fmwww.bc.edu/RePEc/bocode/m/   
			                            // [result]´°¿ÚÏÔÊ¾SSCÃüÁî
         view net from http://fmwww.bc.edu/RePEc/bocode/m/   
		                                // ĞÂ¿ª´°¿ÚÏÔÊ¾
      *
      *-Stata Journal(SJ) Ïà¹ØÎÄµµ
        view net from "http://www.stata-journal.com/" 
        view net from "http://www.stata-journal.com/software/"
        net cd software  // ÍøÂç²»ºÃÊ±£¬¿ÉÄÜÎŞ·¨Á¬½Ó
        net cd sj9-2 
      *   
      *-Stata Technical Bulletin(STB) Ïà¹ØÎÄµµ    
        net from "http://www.stata.com/stb/"


  *-1.11.3.3 Íâ²¿ÃüÁîµÄ¹ÜÀíºÍ¸üĞÂ
  
    *-²éÑ¯ÒÑ°²×°µÄÍâ²¿ÃüÁî  -ado-, -mypkg-, -which-
	   ado
       ado, find(winsor)
       ado, find(panel unit)
       mypkg                      // ³ÊÏÖ±¾»úÉÏÒÑ°²×°µÄÍâ²¿ÃüÁî net findit ssc
       mypkg xt*
       mypkg *lorenz*
       mypkg xtbalance
       which xtbalance  
       which outreg2              // ÁĞÊ¾ÃüÁîµÄ»ù±¾ĞÅÏ¢  
	   
    *-Íâ²¿ÃüÁîµÄ¸üĞÂ     -adoupdate-
       adoupdate                  // ¸üĞÂ±¾»úÉÏµÄÍâ²¿ ado ÃüÁî
       adoupdate outreg2, update  // ¸üĞÂÌØ¶¨µÄÃüÁî 

    *-·¢²¼×Ô¼ºµÄ stata ÃüÁî
	  help usersite
	

	
*___________________________
*-1.11.4  Stata µÄÏµÍ³²ÎÊı
   
   query                   // ³ÊÏÖµ±Ç°ÏµÍ³²ÎÊıµÄÉè¶¨Çé¿ö
   
 * ¹ØÓÚ°æ±¾
   about
   
 * ÑéÖ¤ÊÇ·ñÕıÈ·°²×°
   verinst
   
 * ÏµÍ³²ÎÊı·¶Î§
   help limits
   
 * Ò»Ğ©³£ÓÃµÄÉè¶¨
   clear
   set obs 200             // Éè¶¨¹Û²ìÖµµÄ¸öÊı
   set memory 40m 
  *------------------------------------------ 
   set more on             // ¿ªÆô ·ÖÆÁÏÔÊ¾
    sysuse auto, clear
    list price
   set more off            // ½ûÖ¹ ·ÖÆÁÏÔÊ¾
    list price
  *------------------------------------------ 
    clear 
    set memory 40m         // Éè¶¨ÄÚ´æµÄ´óĞ¡
    set matsize 3000       // Éè¶¨¾ØÕóµÄ×î´óÎ¬¶È
  *------------------------------------------  
    set trace on           // ¸ú×Ùµ÷ÊÔ
      sysuse auto, clear
      reg price wei 
    set trace off
  *------------------------------------------ 
    set seed 1357923       // ²úÉúËæ»úÊıÊ±µÄÖÖ×Ó
     matrix a = matuniform(2,2)
     matrix list a
  *------------------------------------------
    help set_defaults      // »Ö¸´ÏµÍ³²ÎÊıµÄÄ¬ÈÏÖµ
    set_defaults memory    // ½ö»Ö¸´ memory Ïî 
    set_defaults _all      // È«²¿»Ö¸´


*_____________________________  
*-1.11.5  ÎÄ¼şºÍÎÄ¼ş¼ĞµÄ²Ù×÷

* Ïà¹ØÃüÁî£ºshell, shellout, findfile, erase, 
*           mkdir, rmdir, copysource, winexec
 
  *-1.11.5.1  ÎÄ¼şµÄ»ù±¾²Ù×÷£º²éÕÒ¡¢²é¿´¡¢¸´ÖÆ¡¢±à¼­ºÍÉ¾³ı
    
    findfile xtreg_fe.ado         // ²éÕÒÎÄ¼ş
    copysource xtreg_fe.ado       // ÔÚadopathÂ·¾¶ÏÂ²éÕÒ,¸´ÖÆµ½µ±Ç°¹¤×÷Ä¿Â¼ÏÂ
    dir xt*.ado                   // ÏÔÊ¾µ±Ç°¹¤×÷Ä¿Â¼ÏÂµÄÎÄ¼ş
    viewsource xtreg_fe.ado       // ²é¿´Ö¸¶¨µÄ ado ÎÄµµ(Ö»¶Á)
    doedit `c(pwd)'\xtreg_fe.ado  // ±à¼­Ö¸¶¨µÄ ado ÎÄµµ
    erase  `c(pwd)'\xtreg_fe.ado  // É¾³ıÎÄ¼ş
    
    copysource xtreg_fe.ado
    shell rename xtreg_fe.ado FE.do  // ÎÄ¼ş¸üÃû
    dir *.do
    shell                            // ÔÚ dos »·¾³ÏÂ²Ù×÷
       
    copy d1.txt  new_d1.txt,replace  // ¸´ÖÆÎÄ¼ş 
      dir *d1.txt 
    copy http://www.stata.com/examples/simple.dta  simple.dta, replace
      dir *.dta
      erase new_d1.txt 
      erase simple.dta       


  *-1.11.5.2  Ê¹ÓÃstata´ò¿ª-.txt-, -Word-, -Excel-, -iexplorer- ÎÄ¼ş
  
    * Óï·¨£º 
    * shellout ÍêÕûÎÄ¼şÃû        // help shellout
      
    *-´ò¿ª¼ÇÊÂ±¾  
        shellout d1.txt 
        
    *-´ò¿ª-Word-ÎÄµµ  
        shellout mypaper.doc        
    
    *-´ò¿ª-Excel-ÎÄµµ 
        shellout  d1.xls
      
    *-´ò¿ªÍøÒ³
        shellout myhome.mht
        shellout my_log.html
      
    *-´ò¿ª-PPT-ÎÄµµ          // ×ÔÓé×ÔÀÖÒ»ÏÂ°É 
    *-´ò¿ª-PDF-ÎÄµµ

	
	*-°Ñ°ïÖúÎÄ¼ş×ª»»Îª pdf ¸ñÊ½
	  help hlp2winpdf 
	  hlp2winpdf, cdn(xtreg)
	  shellout xtreg.pdf
	  
	  hlp2winpdf, cdn(xtbalance xtabond) replace
	  shellout xtbalance.pdf
	  shellout xtabond.pdf
	  
	  *-ËµÃ÷£ºĞèÒª°²×° Ghostscript »ò WinEdt Ì××°
	  * ¿Éµ½ÈçÏÂÍøÖ·ÏÂÔØ£º
	  *  http://www.ctex.org/HomePage
	  
	  

  *-1.11.5.3  ÎÄ¼ş¼ĞµÄ²Ù×÷
    
    *-stata¹Ù·½ÃüÁî  -dir-, -mkdir-, -rmdir-
    
      dir               // ÏÔÊ¾µ±Ç°Ä¿Â¼ÏÂµÄËùÓĞÎÄ¼ş
      dir *.txt         // ÏÔÊ¾ºó×ºÎª ".txt" µÄËùÓĞÎÄ¼ş
      dir xt*           // ÏÔÊ¾ÒÔ "xt" ¿ªÍ·µÄËùÓĞÎÄ¼ş
         
      mkdir `c(pwd)'\mystata   // ĞÂ½¨ÎÄ¼ş¼Ğ
      rmdir mystata            // É¾³ıÎÄ¼ş¼Ğ 
      
                    
    *-dirtools- ÃüÁî: ¸ßĞ§¹ÜÀíÎÄ¼şµÄÍâ²¿ÃüÁî

      cd  `c(sysdir_personal)'Net_course_A
      lall              // ÁĞÊ¾ËùÓĞÎÄ¼ş
      cd  A1_intro
      ldta              // ÁĞÊ¾ .dta Êı¾İÎÄ¼ş
      cd `c(sysdir_stata)'ado\base\x
      lado              // ÁĞÊ¾ .ado ÎÄ¼ş

     
	*-cdout- ÃüÁî£º´ò¿ªµ±Ç°¹¤×÷Â·¾¶ËùÔÚµÄÎÄ¼ş¼Ğ
	  cd D:\stata11\utilities
	  cdout
	  cd  `c(sysdir_personal)'Net_course_A
	  cdout 
	  
	  
	  
*___________________________________  
*-1.11.6  Ã¿´ÎÆô¶¯Ê±¾ùĞèÖ´ĞĞµÄÃüÁî     -profile-

  help profile

  * ½¨Á¢Ò»¸ö profile.do ÎÄµµ£¬´æÓÚ D:\stata11\ ÏÂ

  * --------begin profile.do------------
  *
  *   »ù±¾²ÎÊıÉè¶¨
      set type double
      set memory 50m
      set matsize 2000
      set scrollbufsize 50000   // Éè¶¨ÆÁÄ»µÄ×î´óÏÔÊ¾ĞĞÊı
      set more off,perma
	  
  *   log ÎÄ¼şÉè¶¨
      log using    D:\stata11\ado\personal\stata.log, text replace
      cmdlog using D:\stata11\ado\personal\command.log, append
	  
  *   ÎÄ¼şÄ¿Â¼Éè¶¨
      sysdir set PLUS     "D:\stata11\ado\plus"     //Íâ²¿ÃüÁîµÄ´æ·ÅµØÖ·
      sysdir set OLDPLACE "D:\ado"
      sysdir set PERSONAL "D:\stata11\ado\personal" //¸öÈËÎÄ¼ş¼Ğ
	  
  *   adoÎÄµµ²éÕÒÂ·¾¶  
      adopath + "D:\stata11\ado\personal"
      adopath + "D:\stata11\ado\personal\_Myado"
	  
  *   µ±Ç°¹¤×÷Â·¾¶
      cd D:\stata11\ado\personal
	  
  * --------end profile.do------------


  *- Arlion µÄ profile.do ÎÄµµ
  
    *doedit D:\stata11\profile.do
     doedit `c(sysdir_stata)'profile.do
    
	*-ÎÒµÄÈÕÖ¾ÎÄ¼ş
	  cd D:\stata11\do
	  cdout


*_____________________  
*-1.11.7  ³£ÓÃ¿ì½İ¼ü    
    
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
	  Ctrl+D 		Ö´ĞĞ(Do)Ñ¡ÖĞµÄÃüÁî (*)
	  Ctrl+R        ÔËĞĞ³ÌĞò(Run)      (*)
	  Ctrl+F		ÔÚdo-editorÖĞËÑË÷ÌØ¶¨µÄ¹Ø¼ü´Ê
	  Ctrl+O		´ò¿ªdoÎÄµµ
	  Ctrl+N		ĞÂ½¨doÎÄµµ
	  Ctrl+S		±£´ædoÎÄµµ         (*)
	  Ctrl+G        Ìø×ªµ½µÚ#ĞĞ        (*)
	  Ctrl+Shift+Y	Ñ¡ÖĞ¹â±êËùÔÚµÄĞĞ
	  Ctrl+Y		É¾³ı¹â±êËùÔÚµÄĞĞ
	  Ctrl+F2       ¶¨ÒåĞ¡½Ú±êÇ©
	  Shift+F2      Ìø×ªµ½ÉÏÒ»¸öĞ¡½Ú±êÇ©
	  F2            Ìø×ªµ½ÏÂÒ»¸öĞ¡½Ú±êÇ©
	-------------------------------------------------	
	×¢£ºÉÏÊö¿ì½İ¼ü½öÊÊÓÃÓÚdo-editor
	
                                        */
                                        
                                        
*_____________________  
*-1.11.8  ÍË³östata£º     -exit-
  
  *-¼¸¸öĞèÒª×¢ÒâµÄÊÂÏî:
   
    *- ³£¹æ·½·¨
       * µã»÷²æºÅ¹Ø±Õstata£¬¶àÊıÇé¿öÏÂ¶¼ÎŞĞè±£´æ£»
       
    *- ÃüÁî·½·¨
       exit
       exit, clear



