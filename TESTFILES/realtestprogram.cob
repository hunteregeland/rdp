      $ SET NO PROFILE
       program-id. prgdel.
       author. testing.
       date-written. 01/01/01.
       date-compiled.
      ********************************************************************
      *                                                                  *
      *   Description of Routine                                         *
      *   ----------------------                                         *
      *                                                                  *
      ********************************************************************

       environment division.
       configuration section.
       source-computer. hp.
       object-computer. hp.

       input-output section.
       file-control.

       copy 'prmsxxsl'.
       copy 'prp31xsl'.

       select optional print-file
              assign       to disk
              organization is line sequential
              access       is sequential
              file status  is print-flg.

660270 select output-file
|         assign       to disk
|         access       is sequential
|         organization is line sequential
660270    file status  is output-file-flg.

89538 *select ors-output-file
|     *   assign       to disk
|     *   access       is sequential
|     *   organization is line sequential
89538 *   file status  is ors-file-flg.


      ****************************************************************
       data division.

       file section.

       fd  msgfile external 
           data record is ms-rec
           value of file-id is msgfile-tree.
           copy 'prmsxxfd'.

       fd  p31x external
           data record      is p31x-rec
           value of file-id is p31x-tree.
           copy 'prp31xfd'.

       fd  print-file
           data record is print-rec
           value of file-id is print-tree.
259531 01  print-rec                  pic x(280).

660270 fd output-file external
|         data record is output-rec
|         value of file-id is output-file-tree.
|
660270 01 output-rec                  pic x(110).


89538 *fd ors-output-file external
|     *   data record is ors-output-rec
|     *   value of file-id is ors-file-tree.
|     *
89538 *01 ors-output-rec              pic x(21).

      ****************************************************************

       working-storage section.

       01 realtestprogram-version-string      pic x(80) value
          '@(#) realtestprogram.cob [@@ _Ht4iMEd4EeWcDYTsiD5uCQ]>'.


       copy 'prmsxxws'.
       copy 'prconsws'.
       copy 'prcommws'.
       copy 'prioxxws'.
       copy 'prlamsg'.
       copy 'prp31xws'.

       77 program-name                  pic x(8)  value 'realtestprogram'.

       01 print-flg                     pic x(2)  value spaces.
       01 print-tree                    pic x(60) value spaces.
660270 01 output-file-flg               pic 9(2)  value zeroes.
660270 01 output-file-tree              pic x(60) value spaces.
89538 *01 ors-file-flg                  pic 9(2)  value zeroes.
89538 *01 ors-file-tree                 pic x(60) value spaces.
       01 ws-temp-tree                  pic x(60) value spaces.
       01 abort-ind                     pic x(01).
969000 01 ws-skip-heading               pic x(01) value space.    

       01 date-n                        pic 9(8).
       01 redefines date-n.
          05  date-n-ccyy               pic 9(4).
          05  date-n-mm                 pic 9(2).
          05  date-n-dd                 pic 9(2).
       01 date-f.
          05  date-f-mm                 pic 9(2).
          05                            pic x(1)   value '/'.
          05  date-f-dd                 pic 9(2).
          05                            pic x(1)   value '/'.
          05  date-f-ccyy               pic 9(4).

       01 time-n                        pic 9(8).
       01 redefines time-n.
          05  time-n-hours              pic 9(2).
          05  time-n-mins               pic 9(2).
          05                            pic 9(4).
       01 time-f.
          05  time-f-hours              pic z(2).
          05                            pic x(1)   value ':'.
          05  time-f-mins               pic 9(2).

       77 total-lines                   pic 9(02) value 60.

       01 line-cnt                      pic 9(02) value zeroes.
       01 adv-lines                     pic 9(02) value zeroes.

       01 ws-save-off-nbr               pic 9(04)  value zeroes.
       01 ws-save-deliv-cd              pic x(01)  value spaces.
90575  01 ws-other-cd                   pic x(01).
          88 ws-o-cd
99303        values are 'N' 'O'.

660270 01 ws-print-text-hdr             pic x(01)  value space. 

108226 01 w2delv-parameters.
          05 w-host-office              pic x(04)  value spaces.


89538 *01 w2delv-br-prop.
|     *   05                            pic x(07) value 'BRANCH='.
|     *   05 w2-delv-branch             pic x(04).
|     *
|     *01 w2delv-rundt-prop.
|     *   05                            pic x(09) value 'RUN_DTTM='.
|     *   05 w2-delv-rundt              pic x(08).
|     *   05 w2-delv-runtm              pic x(04).
|     *
|     *01 w2-format-prop.
|     *   05                            pic x(08) value 'FORMAT=U'.
|     *
|     *01 w2-delv-rpt-prop.
89538 *   05                            pic x(13) value 'REPORT=W2DELV'.


660727 01 ws-text-file-hld-amt          pic s9(9)v99.

       01 office-g-total-fields.
          05 g-tot-clts                   pic s9(11)    value zeroes.
          05 g-tot-emps                   pic s9(11)    value zeroes.
          05 g-tot-fd-txbl-grs            pic s9(13)v99 value zeroes.
          05 g-tot-fd-amt                 pic s9(13)v99 value zeroes.
          05 g-tot-ss-txbl-grs            pic s9(13)v99 value zeroes.
          05 g-tot-ss-amt                 pic s9(13)v99 value zeroes.
          05 g-tot-med-txbl-grs           pic s9(13)v99 value zeroes.
          05 g-tot-med-amt                pic s9(13)v99 value zeroes.
          05 g-tot-ss-tips                pic s9(13)v99 value zeroes.
          05 g-tot-alloc-tips             pic s9(13)v99 value zeroes.
          05 g-tot-st-txbl-grs            pic s9(13)v99 value zeroes.
          05 g-tot-st-amt                 pic s9(13)v99 value zeroes.
103889    05 g-tot-lo-txbl-grs            pic s9(13)v99 value zeroes.
103889    05 g-tot-lo-amt                 pic s9(13)v99 value zeroes.
          05 g-tot-records                pic s9(14)    value zeroes.
          05 g-tot-o-clts                 pic s9(11)    value zeroes.
          05 g-tot-o-emps                 pic s9(11)    value zeroes.
          05 g-tot-o-fd-txbl-grs          pic s9(13)v99 value zeroes.
          05 g-tot-o-fd-amt               pic s9(13)v99 value zeroes.
          05 g-tot-o-ss-txbl-grs          pic s9(13)v99 value zeroes.
          05 g-tot-o-ss-amt               pic s9(13)v99 value zeroes.
          05 g-tot-o-med-txbl-grs         pic s9(13)v99 value zeroes.
          05 g-tot-o-med-amt              pic s9(13)v99 value zeroes.
          05 g-tot-o-ss-tips              pic s9(13)v99 value zeroes.
          05 g-tot-o-alloc-tips           pic s9(13)v99 value zeroes.
          05 g-tot-o-st-txbl-grs          pic s9(13)v99 value zeroes.
          05 g-tot-o-st-amt               pic s9(13)v99 value zeroes.
          05 g-tot-o-lo-txbl-grs          pic s9(13)v99 value zeroes.
          05 g-tot-o-lo-amt               pic s9(13)v99 value zeroes.
          05 g-tot-o-records              pic s9(14)    value zeroes.
          05 g-tot-non-o-clts             pic s9(11)    value zeroes.
          05 g-tot-non-o-emps             pic s9(11)    value zeroes.
          05 g-tot-non-o-fd-txbl-grs      pic s9(13)v99 value zeroes.
          05 g-tot-non-o-fd-amt           pic s9(13)v99 value zeroes.
          05 g-tot-non-o-ss-txbl-grs      pic s9(13)v99 value zeroes.
          05 g-tot-non-o-ss-amt           pic s9(13)v99 value zeroes.
          05 g-tot-non-o-med-txbl-grs     pic s9(13)v99 value zeroes.
          05 g-tot-non-o-med-amt          pic s9(13)v99 value zeroes.
          05 g-tot-non-o-ss-tips          pic s9(13)v99 value zeroes.
          05 g-tot-non-o-alloc-tips       pic s9(13)v99 value zeroes.
          05 g-tot-non-o-st-txbl-grs      pic s9(13)v99 value zeroes.
          05 g-tot-non-o-st-amt           pic s9(13)v99 value zeroes.
          05 g-tot-non-o-lo-txbl-grs      pic s9(13)v99 value zeroes.
          05 g-tot-non-o-lo-amt           pic s9(13)v99 value zeroes.
          05 g-tot-non-o-records          pic s9(14)    value zeroes.
          05 g-tot-mail-clts              pic s9(11)    value zeroes.
          05 g-tot-branch-clts            pic s9(11)    value zeroes.
          05 g-tot-te-clts                pic s9(11)    value zeroes.
          05 g-tot-te-emps                pic s9(11)    value zeroes.
          05 g-tot-te-fd-txbl-grs         pic s9(13)v99 value zeroes.
          05 g-tot-te-fd-amt              pic s9(13)v99 value zeroes.
          05 g-tot-te-ss-txbl-grs         pic s9(13)v99 value zeroes.
          05 g-tot-te-ss-amt              pic s9(13)v99 value zeroes.
          05 g-tot-te-med-txbl-grs        pic s9(13)v99 value zeroes.
          05 g-tot-te-med-amt             pic s9(13)v99 value zeroes.
          05 g-tot-te-ss-tips             pic s9(13)v99 value zeroes.
          05 g-tot-te-alloc-tips          pic s9(13)v99 value zeroes.
          05 g-tot-te-st-txbl-grs         pic s9(13)v99 value zeroes.
          05 g-tot-te-st-amt              pic s9(13)v99 value zeroes.
          05 g-tot-te-lo-txbl-grs         pic s9(13)v99 value zeroes.
          05 g-tot-te-lo-amt              pic s9(13)v99 value zeroes.
          05 g-tot-te-records             pic s9(14)    value zeroes.
924299    05 g-tot-pages                  pic s9(14)    value zeroes.
|         05 g-tot-non-o-pgs              pic s9(14)    value zeroes.
|         05 g-tot-o-pgs                  pic s9(14)    value zeroes.
924299    05 g-tot-te-pgs                 pic s9(14)    value zeroes.

       01 office-total-fields.
          05 tot-clts                   pic s9(11)    value zeroes.
          05 tot-emps                   pic s9(11)    value zeroes.
          05 tot-fd-txbl-grs            pic s9(13)v99 value zeroes.
          05 tot-fd-amt                 pic s9(13)v99 value zeroes.
          05 tot-ss-txbl-grs            pic s9(13)v99 value zeroes.
          05 tot-ss-amt                 pic s9(13)v99 value zeroes.
          05 tot-med-txbl-grs           pic s9(13)v99 value zeroes.
          05 tot-med-amt                pic s9(13)v99 value zeroes.
          05 tot-ss-tips                pic s9(13)v99 value zeroes.
          05 tot-alloc-tips             pic s9(13)v99 value zeroes.
          05 tot-st-txbl-grs            pic s9(13)v99 value zeroes.
          05 tot-st-amt                 pic s9(13)v99 value zeroes.
103889    05 tot-lo-txbl-grs            pic s9(13)v99 value zeroes.
103889    05 tot-lo-amt                 pic s9(13)v99 value zeroes.
          05 tot-records                pic s9(14)    value zeroes.
          05 tot-o-clts                 pic s9(11)    value zeroes.
          05 tot-o-emps                 pic s9(11)    value zeroes.
          05 tot-o-fd-txbl-grs          pic s9(13)v99 value zeroes.
          05 tot-o-fd-amt               pic s9(13)v99 value zeroes.
          05 tot-o-ss-txbl-grs          pic s9(13)v99 value zeroes.
          05 tot-o-ss-amt               pic s9(13)v99 value zeroes.
          05 tot-o-med-txbl-grs         pic s9(13)v99 value zeroes.
          05 tot-o-med-amt              pic s9(13)v99 value zeroes.
          05 tot-o-ss-tips              pic s9(13)v99 value zeroes.
          05 tot-o-alloc-tips           pic s9(13)v99 value zeroes.
          05 tot-o-st-txbl-grs          pic s9(13)v99 value zeroes.
          05 tot-o-st-amt               pic s9(13)v99 value zeroes.
          05 tot-o-lo-txbl-grs          pic s9(13)v99 value zeroes.
          05 tot-o-lo-amt               pic s9(13)v99 value zeroes.
          05 tot-o-records              pic s9(14)    value zeroes.
          05 tot-non-o-clts             pic s9(11)    value zeroes.
          05 tot-non-o-emps             pic s9(11)    value zeroes.
          05 tot-non-o-fd-txbl-grs      pic s9(13)v99 value zeroes.
          05 tot-non-o-fd-amt           pic s9(13)v99 value zeroes.
          05 tot-non-o-ss-txbl-grs      pic s9(13)v99 value zeroes.
          05 tot-non-o-ss-amt           pic s9(13)v99 value zeroes.
          05 tot-non-o-med-txbl-grs     pic s9(13)v99 value zeroes.
          05 tot-non-o-med-amt          pic s9(13)v99 value zeroes.
          05 tot-non-o-ss-tips          pic s9(13)v99 value zeroes.
          05 tot-non-o-alloc-tips       pic s9(13)v99 value zeroes.
          05 tot-non-o-st-txbl-grs      pic s9(13)v99 value zeroes.
          05 tot-non-o-st-amt           pic s9(13)v99 value zeroes.
          05 tot-non-o-lo-txbl-grs      pic s9(13)v99 value zeroes.
          05 tot-non-o-lo-amt           pic s9(13)v99 value zeroes.
          05 tot-non-o-records          pic s9(14)    value zeroes.
          05 tot-mail-clts              pic s9(11)    value zeroes.
          05 tot-branch-clts            pic s9(11)    value zeroes.
          05 tot-te-clts                pic s9(11)    value zeroes.
          05 tot-te-emps                pic s9(11)    value zeroes.
          05 tot-te-fd-txbl-grs         pic s9(13)v99 value zeroes.
          05 tot-te-fd-amt              pic s9(13)v99 value zeroes.
          05 tot-te-ss-txbl-grs         pic s9(13)v99 value zeroes.
          05 tot-te-ss-amt              pic s9(13)v99 value zeroes.
          05 tot-te-med-txbl-grs        pic s9(13)v99 value zeroes.
          05 tot-te-med-amt             pic s9(13)v99 value zeroes.
          05 tot-te-ss-tips             pic s9(13)v99 value zeroes.
          05 tot-te-alloc-tips          pic s9(13)v99 value zeroes.
          05 tot-te-st-txbl-grs         pic s9(13)v99 value zeroes.
          05 tot-te-st-amt              pic s9(13)v99 value zeroes.
          05 tot-te-lo-txbl-grs         pic s9(13)v99 value zeroes.
          05 tot-te-lo-amt              pic s9(13)v99 value zeroes.
          05 tot-te-records             pic s9(14)    value zeroes.
754417    05 tot-off-fd-w2              pic s9(11)    value zeroes.
924299    05 tot-off-page-cnt           pic s9(11)    value zeroes.
|         05 tot-non-o-pgs              pic s9(11)    value zeroes.
|         05 tot-o-pgs                  pic s9(11)    value zeroes.
924299    05 tot-te-pgs                 pic s9(11)    value zeroes.

754417 01 client-total-fields.
754417    05 clt-fd-w2-cnt              pic s9(11)    value zeroes.
924299    05 clt-w2-page-cnt            pic s9(11)    value zeroes.

924299 01 ws-clt-bus-type               pic x(01)     value space.

924299 01 employee-w2-fields.
|         05 emp-w2-cpn-cnt             pic 9(03)     value zeroes.
|         05 emp-w2-remain              pic 9(03)     value zeroes.
|         05 emp-st-cnt                 pic 9(03)     value zeroes.
|         05 emp-lo-cnt                 pic 9(03)     value zeroes.
|         05 emp-prnt-lo-cnt            pic 9(03)     value zeroes.
|         05 emp-box-12-cnt             pic 9(03)     value zeroes.
|         05 emp-box-14-cnt             pic 9(03)     value zeroes.
|         05 emp-fd-coupons             pic 9(03)     value zeroes.
|         05 emp-st-coupons             pic 9(03)     value zeroes.
|         05 emp-lo-coupons             pic 9(03)     value zeroes.
|         05 emp-box12-coupons          pic 9(03)     value zeroes.
|         05 emp-box-14-coupons         pic 9(03)     value zeroes.
|         05 emp-fli-liab               pic s9(9)v99  value zeroes.
|         05 emp-eic-amt                pic s9(9)v99  value zeroes.
|         05 emp-ss-txbl-grs            pic s9(9)v99  value zeroes.
|         05 emp-med-txbl-grs           pic s9(9)v99  value zeroes.
|         05 emp-fd-amt                 pic s9(9)v99  value zeroes.
|         05 emp-last-st-cd             pic 9(02)     value zeroes.
|         05 emp-st-sub                 pic 9(03)     value zeroes.
|         05 emp-st-2-cpns              pic 9(03)     value zeroes.
|         05 emp-st-array.
|            10 emp-st-prnt             pic 9(03)     occurs 52 times
|                                                     value zeroes.
|         05 emp-st-lo-array.
|            10 emp-st-lo-cnt           pic 9(03)     occurs 52 times
924299                                                value zeroes.
       
924299 01 hold-pg-cnt-flds.
|         05 hold-pg-cnt-off-nbr        pic 9(04) value zeroes.
|         05 hold-pg-cnt-clt-nbr        pic x(11) value spaces.
924299    05 hold-pg-cnt-emp-nbr        pic 9(10) value zeroes.
   
924299 01 ws-emp-fli-sw                 pic x(01) value 'n'.
|         88 emp-has-fli                          value 'y'.
|
|      01 ws-emp-print-copy-b-sw        pic x(01) value 'y'.
924299    88 print-copy-b                         value 'y'.

       01 page-cnt                      pic 9(03) value zeroes.
       01 te-clt-sw                     pic x(01) value 'n'.
754417 01 ws-print-clt-sw               pic x(01) value 'n'.
       01 blank-line                    pic x(80) value spaces.

       01 filter-line.
          05                            pic x(08) value 'PSOR=1'.
          05                            pic x(08) value 'FNSL=1'.
          05                            pic x(08) value 'PFSL=0'.

       01 header-line.
          05                            pic x(02) value spaces.
          05                            pic x(12) value
              'realtestprogram.RPT'.
          05                            pic x(15) value spaces.
          05                            pic x(46) value
              'Clients in Vendor Transmission Delivery Report'.
          05                            pic x(20) value space.
          05 d-date                     pic x(10) value spaces.
          05                            pic x(01) value spaces.
          05 d-time                     pic x(05) value spaces.
          05                            pic x(01) value spaces.
          05 d-meridian                 pic x(04) value spaces.          
          05                            pic x(21) value spaces.
          05                            pic x(07) value
              'Page : '.
          05                            pic x(01) value spaces.
          05 d-page-nbr                 pic z(03) value zeroes.

       01 header-line-1.
          05                            pic x(06) value spaces.
          05                            pic x(07) value 
             'OFFICE/'.
924299    05                            pic x(86) value spaces.
          05                            pic x(11) value
99303        "   N/O     ".
          05                            pic x(02) value spaces.
924299    05                            pic x(12) value
             'NON PRINTING'.
924299    05                            pic x(03) value spaces.
|         05                            pic x(09) value spaces.
|         05                            pic x(07) value spaces.
|         05                            pic x(05) value
924299       'PRINT'.

       01 header-line-2.
          05                            pic x(06) value spaces.
          05                            pic x(06) value 
             'CLIENT'.
317435    05                            pic x(12) value spaces.
          05                            pic x(11) value 
             'CLIENT NAME'.
          05                            pic x(26) value spaces.
          05                            pic x(14) value
             'MAIL TO CLIENT'.
754417    05                            pic x(03) value spaces.
          05                            pic x(14) value
             'MAIL TO BRANCH'.
754417    05                            pic x(03) value spaces.
          05                            pic x(14) value
             "    DELIV CODE".
754417    05                            pic x(03) value spaces.
924299    05                            pic x(12) value
924299       'TERMED EMPL'.
754417    05                            pic x(03) value spaces.
|         05                            pic x(09) value
754417       'NUMBER W2'.
924299    05                            pic x(07) value spaces.
|         05                            pic x(05) value
924299       'PAGES'.

       01 header-line-3.
          05                            pic x(04) value spaces.
317435    05                            pic x(16) value all '-'.
          05                            pic x(04) value spaces.
          05                            pic x(11) value all '-'.
          05                            pic x(26) value spaces.
          05                            pic x(14) value all '-'.
754417    05                            pic x(03) value spaces.
          05                            pic x(14) value all '-'.
754417    05                            pic x(03) value spaces.
          05                            pic x(14) value all '-'.
754417    05                            pic x(03) value spaces.
          05                            pic x(12) value all '-'.
754417    05                            pic x(03) value spaces.
754417    05                            pic x(09) value all '-'.
924299    05                            pic x(07) value spaces.
924299    05                            pic x(05) value all '-'.

       01 detail-line.
          05                            pic x(04) value spaces.
          05 d-off-nbr                  pic x(04) value spaces.
          05                            pic x(01) value '-'.
265735    05 d-clt-nbr                  pic x(11) value spaces.
          05                            pic x(04) value spaces.
          05 d-clt-name                 pic x(30) value spaces.
          05                            pic x(13) value spaces.
          05 d-mail-to-client           pic x(01) value spaces.
754417    05                            pic x(16) value spaces.
          05 d-mail-to-branch           pic x(01) value spaces.
754417    05                            pic x(16) value spaces.
          05 d-o-deliv-cd               pic x(01) value spaces.
754417    05                            pic x(20) value spaces.
          05 d-te-client                pic x(01) value spaces.
924299    05                            pic x(01) value spaces.
754417    05 d-clt-fd-w2-cnt            pic z(11)9 value zero.
924299    05 d-clt-w2-page-cnt          pic z(11)9 value zero.

       01 office-mail-branch-tot-line.
          05                            pic x(45) value spaces.
          05                            pic x(06) value
             'TOTALS'.
90575     05                            pic x(09) value spaces.
          05 d-tot-mail-clts            pic z(11)9.
754417    05                            pic x(05) value spaces.
          05 d-tot-branch-clts          pic z(11)9.
754417    05                            pic x(05).
          05 d-tot-off-o-clts           pic z(11)9.
754417    05                            pic x(03).
          05 d-tot-off-te-clts          pic z(11)9.
924299    05                            pic x(03) value spaces.
754417    05 d-tot-off-fd-w2            pic z(11)9.
924299    05                            pic x(01) value spaces.
924299    05 d-tot-off-page-cnt         pic z(11)9.

       01 office-total-line.
          05                            pic x(19) value 
             'TOTALS FOR OFFICE: '.
          05 d-tot-off-nbr              pic 9(04) value zeroes.
          05                            pic x(25) value spaces.
          05                            pic x(10) value
             'TOTALS FOR'.
          05                            pic x(20) value spaces.
          05                            pic x(10) value
             'TOTALS FOR'.
          05                            pic x(20) value spaces.
          05                            pic x(10) value
             'TOTALS FOR'.
          05                            pic x(20) value spaces.
          05                            pic x(10) value
             'TOTALS FOR'.

       01 office-total-line-2.
          05                            pic x(47) value spaces.
          05                            pic x(11) value
             "ALL RECORDS".
          05                            pic x(10) value spaces.
          05                            pic x(20) value
99303        "  NON N/O DELIV CODE".
          05                            pic x(14) value spaces.
          05                            pic x(16) value 
99303        "  N/O DELIV CODE".
          05                            pic x(06) value spaces.
          05                            pic x(24) value
             'NON PRINTING TERMED EMPL'.

       01 grand-total-line.
          05                            pic x(28) value
             'GRAND TOTALS FOR ALL OFFICES'.
          05                            pic x(14) value spaces.
          05                            pic x(16) value
             'GRAND TOTALS FOR'.
          05                            pic x(14) value spaces.
          05                            pic x(16) value
             'GRAND TOTALS FOR'.
          05                            pic x(14) value spaces.
          05                            pic x(16) value
             'GRAND TOTALS FOR'.
          05                            pic x(14) value spaces.
          05                            pic x(16) value
             'GRAND TOTALS FOR'.

       01 grand-total-line-2.
          05                            pic x(47) value spaces.
          05                            pic x(11) value
             "ALL RECORDS".
          05                            pic x(10) value spaces.
          05                            pic x(20) value
99303        "  NON N/O DELIV CODE".
          05                            pic x(14) value spaces.
          05                            pic x(16) value
99303        "  N/O DELIV CODE".
          05                            pic x(06) value spaces.
          05                            pic x(29) value
             'NON PRINTING TERMED EMPL'.


       01 total-clt-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL CLIENTS                      '.
          05                            pic x(07) value spaces.
          05 d-tot-clts                 pic z(11)9.
          05                            pic x(18) value spaces.
          05 d-tot-non-o-clts           pic z(11)9.
          05                            pic x(18) value spaces.
          05 d-tot-o-clts               pic z(11)9.
          05                            pic x(18) value spaces.
          05 d-tot-te-clts              pic z(11)9.

       01 total-emp-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL EMPLOYEES                    '.
          05                            pic x(07) value spaces.
          05 d-tot-emps                 pic z(11)9.
          05                            pic x(18) value spaces.
          05 d-tot-non-o-emps           pic z(11)9.
          05                            pic x(18) value spaces.
          05 d-tot-o-emps               pic z(11)9.
          05                            pic x(18) value spaces.
          05 d-tot-te-emps              pic z(11)9.

924299 01 total-pages-line.
|         05                            pic x(04) value spaces.
|         05                            pic x(35) value
|          'TOTAL PAGES PRINTED                '.
|         05                            pic x(07) value spaces.
|         05 d-tot-pages                pic z(11)9.
|         05                            pic x(18) value spaces.
|         05 d-tot-non-o-pages          pic z(11)9.
|         05                            pic x(18) value spaces.
|         05 d-tot-o-pages              pic z(11)9.
|         05                            pic x(18) value spaces.
924299    05 d-tot-te-pages             pic z(11)9.

       01 total-fd-grs-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL FEDERAL TAXABLE GROSS        '.
          05                            pic x(01) value spaces.
          05 d-tot-fd-grs               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-fd-grs         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-fd-grs             pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-fd-grs            pic z(14)9.99.

       01 total-fd-amt-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL FEDERAL WITHHOLDING          '.
          05                            pic x(01) value spaces.
          05 d-tot-fd-amt               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-fd-amt         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-fd-amt             pic z(14)9.99.
few       05                            pic x(12) value spaces.
          05 d-tot-te-fd-amt            pic z(14)9.99.

       01 total-ss-grs-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL SOCIAL SECURITY TAXABLE GROSS'.
          05                            pic x(01) value spaces.
          05 d-tot-ss-grs               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-ss-grs         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-ss-grs             pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-ss-grs            pic z(14)9.99.


       01 total-ss-amt-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL SOCIAL SECURITY WITHHOLDING  '.
          05                            pic x(01) value spaces.
          05 d-tot-ss-amt               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-ss-amt         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-ss-amt             pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-ss-amt            pic z(14)9.99.

       01 total-med-grs-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL MEDICARE TAXABLE GROSS       '.
          05                            pic x(01) value spaces.
          05 d-tot-med-grs              pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-med-grs        pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-med-grs            pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-med-grs           pic z(14)9.99.

       01 total-med-amt-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL MEDICARE WITHHOLDING         '.
          05                            pic x(01) value spaces.
          05 d-tot-med-amt              pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-med-amt        pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-med-amt            pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-med-amt           pic z(14)9.99.

       01 total-ss-tips-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL SOCIAL SECURITY TIPS         '.
          05                            pic x(01) value spaces.
          05 d-tot-ss-tips              pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-ss-tips        pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-ss-tips            pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-ss-tips           pic z(14)9.99.

       01 total-alloc-tips-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL ALLOCATED TIPS               '.
          05                            pic x(01) value spaces.
          05 d-tot-alloc-tips           pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-alloc-tips     pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-alloc-tips         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-alloc-tips        pic z(14)9.99.

       01 total-st-grs-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL STATE TAXABLE GROSS          '.
          05                            pic x(01) value spaces.
          05 d-tot-st-grs               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-st-grs         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-st-grs             pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-st-grs            pic z(14)9.99.

       01 total-st-amt-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL STATE WITHHOLDING            '.
          05                            pic x(01) value spaces.
          05 d-tot-st-amt               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-st-amt         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-st-amt             pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-st-amt            pic z(14)9.99.

       01 total-lo-grs-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL LOCAL TAXABLE GROSS          '.
          05                            pic x(01) value spaces.
          05 d-tot-lo-grs               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-lo-grs         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-lo-grs             pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-lo-grs            pic z(14)9.99.

       01 total-lo-amt-line.
          05                            pic x(04) value spaces.
          05                            pic x(35) value
           'TOTAL LOCAL WITHHOLDING            '.
          05                            pic x(01) value spaces.
          05 d-tot-lo-amt               pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-non-o-lo-amt         pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-o-lo-amt             pic z(14)9.99.
          05                            pic x(12) value spaces.
          05 d-tot-te-lo-amt            pic z(14)9.99.

       01 total-record-line. 
          05                            pic x(04) value spaces.
          05                            pic x(27) value
           'TOTAL RECORDS              '.
          05                            pic x(04) value spaces.
          05 d-tot-recs                 pic z(13)9.
          05                            pic x(15) value spaces.
          05 d-tot-non-o-recs           pic z(13)9.
          05                            pic x(15) value spaces.
          05 d-tot-o-recs               pic z(13)9.
          05                            pic x(15) value spaces.
          05 d-tot-te-recs              pic z(13)9.


660270 01 text-file-header.
|         05 filler                     pic x(07) value 'CLT NBR'.
|         05                            pic x(12) value spaces.
|         05 filler                     pic x(07) value 'EMP NBR'.
|         05                            pic x(15) value spaces.
|         05 filler                     pic x(13) 
|             value 'TYPE OF WAGES'.
|         05                            pic x(20) value spaces.
660270    05 filler                     pic x(08) value 'WAGE AMT'.


660270 01 text-file-detail.
|         05 text-clt-nbr               pic x(11) value spaces.
|         05                            pic x(06) value spaces.
|         05 text-emp-nbr               pic 9(10)9 value zeroes.
|         05                            pic x(13) value spaces.
|         05 text-wage-type             pic x(23) value spaces.
|         05                            pic x(09) value spaces.
660270    05 text-neg-wages             pic ---------.99.

      ****************************************************************

       procedure division.

           ready trace

           perform log-start-msg

           perform initialization

           perform main-process

           perform close-files

           perform log-finish-msg

           move 0 to return-code

           stop run.

      *******************************************************************

       main-process.

           move 'main-process' to msg-paragraph

660270     initialize office-g-total-fields
|                     ws-text-file-hld-amt
660270     move 'Y' to ws-print-text-hdr
        
           perform read-next-p31x
 
           move p31x-off-nbr to ws-save-off-nbr

           if p31x-flg = i-o-ok
89538 *       perform write-w2-properties
              perform process-report
                      until p31x-flg not = i-o-ok
           end-if

           if line-cnt > zeroes
              perform print-footer
           end-if.

      *******************************************************************

       process-report.

           move 'process-report' to msg-paragraph

           if p31x-type-cd = 1
              if p31x-st-cd = zeroes and
                 p31x-lo-cd = zeroes
                 perform print-client
924299           move p31x-clt-bus-type to ws-clt-bus-type
              end-if
              add 1 to tot-records giving tot-records

              if te-clt-sw = 'y'
                 add 1 to tot-te-records giving tot-te-records
              else
90575            move ws-save-deliv-cd to ws-other-cd
90575            if ws-o-cd
                    add 1 to tot-o-records giving tot-o-records
                 else
                    add 1 to tot-non-o-records giving tot-non-o-records
                 end-if
              end-if
           else
              if p31x-type-cd = 4 
                 if p31x-lo-cd = zeroes
                    if p31x-st-cd = zeroes 
                       perform accum-federal-office-totals
                       add 1 to tot-emps giving tot-emps
660270                 add 1 to g-tot-emps giving g-tot-emps
754417                 add 1 to clt-fd-w2-cnt

924299                 if ws-clt-bus-type = 2 
|                         move p31x-emp-eic-amt      to emp-eic-amt
|                         move p31x-emp-ss-txbl-grs  to emp-ss-txbl-grs
|                         move p31x-emp-med-txbl-grs to emp-med-txbl-grs
|                         move p31x-emp-fd-amt       to emp-fd-amt
|                         if emp-eic-amt = zero and
|                            emp-ss-txbl-grs = zero and
|                            emp-med-txbl-grs = zero and
|                            emp-fd-amt = zero
|     *                       display "Skip Coupon B"
|                            move 'n'  to ws-emp-print-copy-b-sw
|                         end-if
924299                 end-if
                         
924299                 if p31x-off-nbr <> hold-pg-cnt-off-nbr or
|                         p31x-clt-nbr <> hold-pg-cnt-clt-nbr or
|                         p31x-emp-nbr <> hold-pg-cnt-emp-nbr
|     *                    display "*** new withhold employee *** " 
|                         perform calc-pages
|                         move p31x-off-nbr to hold-pg-cnt-off-nbr
|                         move p31x-clt-nbr to hold-pg-cnt-clt-nbr
|                         move p31x-emp-nbr to hold-pg-cnt-emp-nbr 
924299                 end-if

                       if te-clt-sw = 'y'
                          add  1 to tot-te-emps giving tot-te-emps
                       else
90575                     move ws-save-deliv-cd to ws-other-cd
                          if ws-o-cd
                             add 1 to tot-o-emps giving tot-o-emps
                          else
                             add 1 to tot-non-o-emps giving 
                                      tot-non-o-emps
                          end-if
                       end-if
                    else
924299                 add 1 to emp-st-cnt
|                      add 1 to emp-st-prnt(p31x-st-cd)
|                      move p31x-st-cd        to emp-last-st-cd
|                      move p31x-emp-fli-liab to emp-fli-liab
|                      if p31x-st-cd = 29
|                         and emp-fli-liab > 0
|                         move 'y'  to ws-emp-fli-sw
924299                 end-if
                       perform accum-state-office-totals
                    end-if
103889           else
924299              add 1 to emp-lo-cnt
|                   add 1 to emp-st-lo-cnt(p31x-st-cd)
|                   if p31x-emp-lo-with-st = space
|                      add 1 to emp-prnt-lo-cnt
|                   else
|     *                Print with state but state missing
|                      if p31x-st-cd <> emp-last-st-cd
|                         add 1 to emp-prnt-lo-cnt
|                      end-if
924299              end-if
103889              perform accum-local-office-totals
                 end-if
              end-if

924299        if p31x-type-cd = 3
|                if p31x-off-nbr <> hold-pg-cnt-off-nbr or
|                   p31x-clt-nbr <> hold-pg-cnt-clt-nbr or
|                   p31x-emp-nbr <> hold-pg-cnt-emp-nbr
|     *              display "*** new adjustment employee *** " 
|                   perform calc-pages                  
|                   move p31x-off-nbr to hold-pg-cnt-off-nbr
|                   move p31x-clt-nbr to hold-pg-cnt-clt-nbr
|                   move p31x-emp-nbr to hold-pg-cnt-emp-nbr            
|                end-if
|
|                evaluate p31x-adj-box-nbr
|                  when 12
|                    add 1 to emp-box-12-cnt
|                  when 14
|                    add 1 to emp-box-14-cnt
|                  when other
|                    continue
|                end-evaluate
924299        end-if

              move tot-mail-clts    to d-tot-mail-clts
              move tot-branch-clts  to d-tot-branch-clts
              move tot-o-clts       to d-tot-off-o-clts
              move tot-te-clts      to d-tot-off-te-clts
754417        move tot-off-fd-w2    to d-tot-off-fd-w2
924299        move tot-off-page-cnt to d-tot-off-page-cnt
660270*       "Perform process rec types 6,7 and 8 no longer used
660270*        to calculate grand total amounts. Only rec type 9
660270*        will be used to print office totals.  
              evaluate p31x-type-cd
660270*          when 6     perform process-6-recs
|     *          when 7     perform process-7-recs
660270*          when 8     perform process-8-recs
754417           when 9     if ws-print-clt-sw = 'y'           
|                              move clt-fd-w2-cnt to d-clt-fd-w2-cnt
|                              add  clt-fd-w2-cnt to tot-off-fd-w2
|                                   giving tot-off-fd-w2
754417                         move tot-off-fd-w2 to d-tot-off-fd-w2
924299                         perform calc-pages
|                              move clt-w2-page-cnt to d-clt-w2-page-cnt  
|                              add  clt-w2-page-cnt to tot-off-page-cnt
|                                   giving tot-off-page-cnt
|                              move tot-off-page-cnt 
924299                           to d-tot-off-page-cnt
754417                         initialize client-total-fields
|
|                              write print-rec from detail-line after 1 line
|
|                              add 1 to line-cnt giving line-cnt
754417                      end-if
969000                  write print-rec from office-mail-branch-tot-line
                                   after 2 lines
969000                      add 2 to line-cnt giving line-cnt
969000                      perform print-footer
                            perform print-office-totals
969000                      move 'y' to ws-skip-heading
969000                      perform print-header
                            perform print-totals
                 when other continue
              end-evaluate

660270        if p31x-type-cd = 6 or p31x-type-cd = 7 or
|                p31x-type-cd = 8 or p31x-type-cd = 9
|                continue
|             else
|                add 1 to tot-records giving tot-records
660270        end-if

              if p31x-type-cd = 6 or p31x-type-cd = 7 or
                 p31x-type-cd = 8 or p31x-type-cd = 9
                 continue
              else
                 if te-clt-sw = 'y'
                    add 1 to tot-te-records giving tot-te-records
                 else
90575               move ws-save-deliv-cd to ws-other-cd
90575               if ws-o-cd
                       add 1 to tot-o-records giving tot-o-records
                    else
                       add 1 to tot-non-o-records giving 
                               tot-non-o-records
                    end-if
                 end-if
              end-if
           end-if

           perform read-next-p31x.

      *******************************************************************

924299 calc-pages.
|
|          if hold-pg-cnt-clt-nbr <> spaces
|     *                 display 'calc-pages'
|     *                 exhibit named hold-pg-cnt-clt-nbr
|     *                 exhibit named hold-pg-cnt-emp-nbr
|
|     *                 exhibit named emp-st-cnt
|     *                 exhibit named emp-lo-cnt
|     *                 exhibit named emp-box-12-cnt
|     *                 exhibit named emp-box-14-cnt
|
|                      if emp-has-fli
|     *                    display "Increase st cnt for FLI"
|                         add 1 to emp-st-cnt
|                      end-if
|
|                      compute emp-st-coupons rounded = emp-st-cnt / 2 
|                      move emp-st-coupons  to emp-fd-coupons
|                      compute emp-lo-coupons rounded = emp-lo-cnt / 2
|                      if emp-lo-coupons > emp-fd-coupons
|                         move emp-lo-coupons to emp-fd-coupons
|                      end-if
|
|                      divide emp-box-14-cnt by 7
|                        giving emp-box-14-coupons
|                        remainder emp-w2-remain
|                      end-divide
|                      if emp-w2-remain > 0
|                         add 1 to emp-box-14-coupons
|                      end-if
|                      if emp-box-14-coupons > emp-fd-coupons
|                         move emp-box-14-coupons to emp-fd-coupons
|                      end-if
|
|     *                 exhibit named emp-st-coupons
|     *                 exhibit named emp-lo-coupons
|     *                 exhibit named emp-box12-coupons
|     *                 exhibit named emp-box-14-coupons  
|     *                 exhibit named emp-prnt-lo-cnt
|
|     *                FLI will print on NJ St coupon
|                      if emp-has-fli
|                         subtract 1 from emp-st-cnt
|                      end-if
|
|                      if emp-fd-coupons = 0
|                         move 1 to emp-fd-coupons
|                      end-if
|
|     *                 exhibit named emp-fd-coupons
|
|     *                Employee Copy C coupons
|                      move emp-fd-coupons to emp-w2-cpn-cnt
|
|     *                Federal Copy B coupons
|                      if print-copy-b
|                         add emp-fd-coupons to emp-w2-cpn-cnt 
|                      end-if
|
|     *                Agency Copy 2 state coupons
|                      evaluate true
|                        when emp-st-cnt = zero 
|                          continue
|                        when emp-st-cnt > 0 and emp-lo-cnt = 0
|                          add emp-st-cnt     to emp-w2-cpn-cnt
|                        when other
|                          move 1 to emp-st-sub
|                          perform 
|                            until emp-st-sub > 52
|                               if emp-st-prnt(emp-st-sub) > 0
|                                  if emp-st-lo-cnt(emp-st-sub) = 0
|                                     add 1 to emp-w2-cpn-cnt
|                                  else 
|                                     compute emp-st-2-cpns rounded 
|                                       = emp-st-lo-cnt(emp-st-sub) / 2
|                                     add emp-st-2-cpns 
|                                      to emp-w2-cpn-cnt
|                                  end-if
|                               end-if
|                               add 1 to emp-st-sub
|                          end-perform
|                      end-evaluate
|
|     *                Agency Copy 2 local coupons
|                      add emp-prnt-lo-cnt    to emp-w2-cpn-cnt
|
|     *                 display "Coupons to print: " emp-w2-cpn-cnt
|
|                      divide emp-w2-cpn-cnt by 4
|                             giving emp-w2-cpn-cnt
|                             remainder emp-w2-remain
|                      end-divide
|                      if emp-w2-remain > 0
|                         add 1 to emp-w2-cpn-cnt
|                      end-if
|
|     *                 exhibit named emp-w2-cpn-cnt
|     
|     *  Type O and Terminated are not printed, don't count
|                      if te-clt-sw = 'y'
|                         continue
|                      else
90575                     move ws-save-deliv-cd to ws-other-cd
|                         if ws-o-cd
|                             continue
|                         else
|                             add emp-w2-cpn-cnt to clt-w2-page-cnt
|                             add emp-w2-cpn-cnt to g-tot-pages
|                             add emp-w2-cpn-cnt to tot-non-o-pgs  
|                             add emp-w2-cpn-cnt to g-tot-non-o-pgs  
|                         end-if
|                      end-if
|
|                      move zeroes to employee-w2-fields
|                      move 'n'    to ws-emp-fli-sw
|                      move 'y'    to ws-emp-print-copy-b-sw
|          end-if
924299     .

      *******************************************************************

       print-client.
 
           move 'print-client' to msg-paragraph

924299     perform calc-pages
924299     initialize hold-pg-cnt-flds

754417     if ws-print-clt-sw = 'y'           
|             move clt-fd-w2-cnt to d-clt-fd-w2-cnt
|             add  clt-fd-w2-cnt to tot-off-fd-w2
754417             giving tot-off-fd-w2
924299        move clt-w2-page-cnt to d-clt-w2-page-cnt
|             add  clt-w2-page-cnt to tot-off-page-cnt
924299             giving tot-off-page-cnt
754417        initialize client-total-fields
|
|             write print-rec from detail-line after 1 line
|
|             add 1 to line-cnt giving line-cnt
754417     end-if

           if p31x-off-nbr = ws-save-off-nbr
              continue
           else
              move tot-mail-clts    to d-tot-mail-clts
              move tot-branch-clts  to d-tot-branch-clts
              move tot-o-clts       to d-tot-off-o-clts
              move tot-te-clts      to d-tot-off-te-clts
754417        move tot-off-fd-w2    to d-tot-off-fd-w2
924299        move tot-off-page-cnt to d-tot-off-page-cnt
969000        write print-rec from office-mail-branch-tot-line 
|                              after 2 lines
|             add 2 to line-cnt
969000        perform print-footer
              perform print-office-totals
              perform print-header
              move p31x-off-nbr to ws-save-off-nbr
              initialize tot-mail-clts
                         tot-non-o-clts
                         tot-o-clts
                         tot-te-clts 
              initialize office-total-fields
           end-if

           if line-cnt > 57
              perform print-header
           end-if

           add 1 to tot-clts giving tot-clts
660270     add 1 to g-tot-clts giving g-tot-clts

           if p31x-p311-ind = 'X' and p31x-p312-ind = 'X'
              move 'n' to te-clt-sw
           else
              move 'y' to te-clt-sw
           end-if

           move p31x-off-nbr      to d-off-nbr
           move p31x-clt-nbr      to d-clt-nbr
660270                               text-clt-nbr
           move p31x-clt-name     to d-clt-name
           move p31x-clt-deliv-cd to ws-save-deliv-cd
           if p31x-p311-ind = 'X' and p31x-p312-ind = 'X'
92647         if p31x-clt-usps-ind = 'X'
92647            move 'X'               to d-mail-to-client
92647            move space             to d-mail-to-branch
92647                                      d-o-deliv-cd
92647                                      d-te-client
92647            add 1 to tot-mail-clts  giving tot-mail-clts
92647            add 1 to tot-non-o-clts giving tot-non-o-clts
92647         else
92647            perform evaluate-clt-deliv-cd
92647         end-if
           else
              move spaces to d-mail-to-client
                             d-mail-to-branch
                             d-o-deliv-cd
              move 'X'    to d-te-client
              add 1 to tot-te-clts
           end-if

754417     move 'y'  to ws-print-clt-sw.

92647  evaluate-clt-deliv-cd.      

           evaluate p31x-clt-deliv-cd
              when spaces
                   move 'X'               to d-mail-to-client
                   move space             to d-mail-to-branch
                                             d-o-deliv-cd
                                             d-te-client
                   add 1 to tot-mail-clts  giving tot-mail-clts
                   add 1 to tot-non-o-clts giving tot-non-o-clts
432272        when 'H'
|                  move 'X'               to d-mail-to-client
|                  move space             to d-mail-to-branch
|                                            d-o-deliv-cd
|                                            d-te-client
|                  add 1 to tot-mail-clts  giving tot-mail-clts
|                  add 1 to tot-non-o-clts giving tot-non-o-clts
|             when 'I'
|                  move 'X'               to d-mail-to-client
|                  move space             to d-mail-to-branch
|                                            d-o-deliv-cd
|                                            d-te-client
|                  add 1 to tot-mail-clts  giving tot-mail-clts
432272             add 1 to tot-non-o-clts giving tot-non-o-clts

              when 'N'
90575         when 'O'
                   move p31x-clt-deliv-cd to d-o-deliv-cd
                   move space             to d-mail-to-branch
                                             d-mail-to-client
                                             d-te-client
                   add 1 to tot-o-clts giving tot-o-clts

99303 * R delivery code will fall here
              when other
                   move p31x-clt-deliv-cd to d-mail-to-branch
                   move space             to d-mail-to-client
                                             d-o-deliv-cd
                                             d-te-client
                   add 1 to tot-branch-clts giving tot-branch-clts
                   add 1 to tot-non-o-clts  giving tot-non-o-clts
           end-evaluate.     

 
      *******************************************************************

       accum-federal-office-totals.

           move 'accum-federal-office-totals' to msg-paragraph
660270     move p31x-emp-nbr to text-emp-nbr
           move p31x-emp-fd-txbl-grs to tmp-amt
           add tmp-amt  to tot-fd-txbl-grs giving tot-fd-txbl-grs

660270     add tmp-amt to g-tot-fd-txbl-grs giving
660270                    g-tot-fd-txbl-grs


           move p31x-emp-fd-amt to tmp-amt
           add tmp-amt to tot-fd-amt giving tot-fd-amt

660270     add tmp-amt to g-tot-fd-amt giving
660270                    g-tot-fd-amt



           move p31x-emp-ss-txbl-grs to tmp-amt
           add tmp-amt to tot-ss-txbl-grs giving tot-ss-txbl-grs

660270     add tmp-amt to g-tot-ss-txbl-grs giving
660270                    g-tot-ss-txbl-grs


           move p31x-emp-ss-amt to tmp-amt
           add tmp-amt to tot-ss-amt giving tot-ss-amt

660270     add tmp-amt to g-tot-ss-amt giving
660270                    g-tot-ss-amt


           move p31x-emp-med-txbl-grs to tmp-amt
           add tmp-amt to tot-med-txbl-grs giving tot-med-txbl-grs

660270     add tmp-amt to g-tot-med-txbl-grs giving
660270                    g-tot-med-txbl-grs


           move p31x-emp-med-amt to tmp-amt
           add tmp-amt to tot-med-amt giving tot-med-amt

660270     add tmp-amt to g-tot-med-amt giving
660270                    g-tot-med-amt


           move p31x-emp-ss-tips to tmp-amt
           add tmp-amt to tot-ss-tips giving tot-ss-tips

660270     add tmp-amt to g-tot-ss-tips giving
660270                    g-tot-ss-tips


           move p31x-emp-alloc-tips to tmp-amt
           add tmp-amt to tot-alloc-tips giving tot-alloc-tips
          
660270     add tmp-amt to g-tot-alloc-tips giving
660270                    g-tot-alloc-tips


           if te-clt-sw = 'y'
              perform accum-te-office-tot
           else
90575         move ws-save-deliv-cd to ws-other-cd
              if ws-o-cd
                 perform accum-o-office-tot
              else
                 perform accum-non-o-office-tot
              end-if
           end-if.

      *******************************************************************

       accum-te-office-tot.

           move 'accum-te-office-tot' to msg-paragraph

           move p31x-emp-fd-txbl-grs to tmp-amt
           add tmp-amt  to tot-te-fd-txbl-grs giving
                           tot-te-fd-txbl-grs

           move p31x-emp-fd-amt to tmp-amt
           add tmp-amt to tot-te-fd-amt giving tot-te-fd-amt


           move p31x-emp-ss-txbl-grs to tmp-amt
           add tmp-amt to tot-te-ss-txbl-grs giving
                          tot-te-ss-txbl-grs

           move p31x-emp-ss-amt to tmp-amt
           add tmp-amt to tot-te-ss-amt giving tot-te-ss-amt


           move p31x-emp-med-txbl-grs to tmp-amt
           add tmp-amt to tot-te-med-txbl-grs giving
                          tot-te-med-txbl-grs


           move p31x-emp-med-amt to tmp-amt
           add tmp-amt to tot-te-med-amt giving tot-te-med-amt


           move p31x-emp-ss-tips to tmp-amt
           add tmp-amt to tot-te-ss-tips giving tot-te-ss-tips


           move p31x-emp-alloc-tips to tmp-amt
           add tmp-amt to tot-te-alloc-tips giving
                          tot-te-alloc-tips.


      *******************************************************************

       accum-o-office-tot.

           move 'accum-o-office-tot' to msg-paragraph

           move p31x-emp-fd-txbl-grs to tmp-amt
           add tmp-amt  to tot-o-fd-txbl-grs giving 
                           tot-o-fd-txbl-grs


           move p31x-emp-fd-amt to tmp-amt
           add tmp-amt to tot-o-fd-amt giving tot-o-fd-amt

           move p31x-emp-ss-txbl-grs to tmp-amt
           add tmp-amt to tot-o-ss-txbl-grs giving tot-o-ss-txbl-grs


           move p31x-emp-ss-amt to tmp-amt
           add tmp-amt to tot-o-ss-amt giving tot-o-ss-amt


           move p31x-emp-med-txbl-grs to tmp-amt
           add tmp-amt to tot-o-med-txbl-grs giving 
                          tot-o-med-txbl-grs


           move p31x-emp-med-amt to tmp-amt
           add tmp-amt to tot-o-med-amt giving tot-o-med-amt


           move p31x-emp-ss-tips to tmp-amt
           add tmp-amt to tot-o-ss-tips giving tot-o-ss-tips


           move p31x-emp-alloc-tips to tmp-amt
           add tmp-amt to tot-o-alloc-tips giving tot-o-alloc-tips.

      *******************************************************************

       accum-non-o-office-tot.

           move 'accum-non-o-office-tot' to msg-paragraph

           move p31x-emp-fd-txbl-grs to tmp-amt
           add tmp-amt  to tot-non-o-fd-txbl-grs giving
                           tot-non-o-fd-txbl-grs

           move p31x-emp-fd-amt to tmp-amt
           add tmp-amt to tot-non-o-fd-amt giving tot-non-o-fd-amt

           move p31x-emp-ss-txbl-grs to tmp-amt
           add tmp-amt to tot-non-o-ss-txbl-grs giving 
                          tot-non-o-ss-txbl-grs

           move p31x-emp-ss-amt to tmp-amt
           add tmp-amt to tot-non-o-ss-amt giving tot-non-o-ss-amt

           move p31x-emp-med-txbl-grs to tmp-amt
           add tmp-amt to tot-non-o-med-txbl-grs giving
                          tot-non-o-med-txbl-grs


           move p31x-emp-med-amt to tmp-amt
           add tmp-amt to tot-non-o-med-amt giving tot-non-o-med-amt


           move p31x-emp-ss-tips to tmp-amt
           add tmp-amt to tot-non-o-ss-tips giving tot-non-o-ss-tips

           move p31x-emp-alloc-tips to tmp-amt
           add tmp-amt to tot-non-o-alloc-tips giving 
                          tot-non-o-alloc-tips.

      *******************************************************************

       accum-state-office-totals.

           move 'accum-state-office-totals' to msg-paragraph

660270     move p31x-emp-nbr to text-emp-nbr

           move p31x-emp-st-txbl-grs to tmp-amt
           add tmp-amt to tot-st-txbl-grs giving tot-st-txbl-grs

660270     add tmp-amt to g-tot-st-txbl-grs giving
660270                    g-tot-st-txbl-grs

660270     if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP ST TXBL GRS' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if

660270     move p31x-emp-st-grs to tmp-amt
|          if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP ST GRS' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if

           move p31x-emp-st-amt to tmp-amt
           add tmp-amt to tot-st-amt giving tot-st-amt

660270     add tmp-amt to g-tot-st-amt giving
660270                    g-tot-st-amt


660270     if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP ST AMT' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if

660270     move p31x-emp-sui-txbl-grs to tmp-amt
|          if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP ST SUI TXBL GRS' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if

660270     move p31x-emp-sui-amt to tmp-amt
|          if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP ST SUI AMT' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if

660270     move p31x-emp-dbl-amt to tmp-amt
|          if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP DBL AMT' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if
     
           if te-clt-sw = 'y'
              move p31x-emp-st-txbl-grs to tmp-amt
              add tmp-amt to tot-te-st-txbl-grs giving
                             tot-te-st-txbl-grs

              move p31x-emp-st-amt to tmp-amt
              add tmp-amt to tot-te-st-amt giving
                             tot-te-st-amt

           else
90575         move ws-save-deliv-cd to ws-other-cd
              if ws-o-cd
                 move p31x-emp-st-txbl-grs to tmp-amt
                 add tmp-amt to tot-o-st-txbl-grs giving
                                tot-o-st-txbl-grs
              
                 move p31x-emp-st-amt to tmp-amt
                 add tmp-amt to tot-o-st-amt giving tot-o-st-amt
              else
                 move p31x-emp-st-txbl-grs to tmp-amt
                 add tmp-amt to tot-non-o-st-txbl-grs giving 
                                tot-non-o-st-txbl-grs

                 move p31x-emp-st-amt to tmp-amt
                 add tmp-amt to tot-non-o-st-amt giving
                                tot-non-o-st-amt
              end-if 
           end-if.

      *******************************************************************

       accum-local-office-totals.

           move 'accum-local-office-totals' to msg-paragraph

660270     move p31x-emp-nbr to text-emp-nbr


           move p31x-emp-lo-txbl-grs to tmp-amt
           add tmp-amt to tot-lo-txbl-grs giving tot-lo-txbl-grs

660270     add tmp-amt to g-tot-lo-txbl-grs giving
660270                    g-tot-lo-txbl-grs

660270     if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP LOCAL TXBL GRS' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if


           move p31x-emp-lo-amt to tmp-amt
           add tmp-amt to tot-lo-amt giving tot-lo-amt

660270     add tmp-amt to g-tot-lo-amt giving
660270                    g-tot-lo-amt

       
660270     if tmp-amt < 0
|             if ws-print-text-hdr = 'Y'
|                write output-rec from text-file-header
|                move 'N' to ws-print-text-hdr
|             end-if
|             move tmp-amt to text-neg-wages
|             move 'EMP LOCAL AMT' to text-wage-type
|             write output-rec from text-file-detail
660270     end-if

          
           if te-clt-sw = 'y'
              move p31x-emp-lo-txbl-grs to tmp-amt
              add tmp-amt to tot-te-lo-txbl-grs giving
                             tot-te-lo-txbl-grs

              move p31x-emp-lo-amt to tmp-amt
              add tmp-amt to tot-te-lo-amt giving
                             tot-te-lo-amt

           else
90575         move ws-save-deliv-cd to ws-other-cd
              if ws-o-cd
                 move p31x-emp-lo-txbl-grs to tmp-amt
                 add tmp-amt to tot-o-lo-txbl-grs giving
                                tot-o-lo-txbl-grs
   
                 move p31x-emp-lo-amt to tmp-amt
                 add tmp-amt to tot-o-lo-amt giving tot-o-lo-amt

              else
                 move p31x-emp-lo-txbl-grs to tmp-amt
                 add tmp-amt to tot-non-o-lo-txbl-grs giving 
                                tot-non-o-lo-txbl-grs

                 move p31x-emp-lo-amt to tmp-amt
                 add tmp-amt to tot-non-o-lo-amt giving
                                tot-non-o-lo-amt
              end-if
           end-if.       

      *******************************************************************

       process-6-recs.

           move 'process-6-recs' to msg-paragraph

           perform te-dtl-lines.



      *******************************************************************     

       process-7-recs.

           move 'process-7-recs' to msg-paragraph

           perform o-dtl-lines.


      *******************************************************************

       process-8-recs.

           move 'process-8-recs' to msg-paragraph

           perform non-o-dtl-lines.


      *******************************************************************

       te-dtl-lines.

           move 'te-dtl-lines' to msg-paragraph
       
           move tot-te-clts         to d-tot-te-clts
           move tot-te-emps         to d-tot-te-emps
           move tot-te-fd-txbl-grs  to d-tot-te-fd-grs
           move tot-te-fd-amt       to d-tot-te-fd-amt
           move tot-te-ss-txbl-grs  to d-tot-te-ss-grs
           move tot-te-ss-amt       to d-tot-te-ss-amt
           move tot-te-med-txbl-grs to d-tot-te-med-grs
           move tot-te-med-amt      to d-tot-te-med-amt
           move tot-te-ss-tips      to d-tot-te-ss-tips
           move tot-te-alloc-tips   to d-tot-te-alloc-tips
           move tot-te-st-txbl-grs  to d-tot-te-st-grs
           move tot-te-st-amt       to d-tot-te-st-amt
           move tot-te-lo-txbl-grs  to d-tot-te-lo-grs
           move tot-te-lo-amt       to d-tot-te-lo-amt
           move tot-te-records      to d-tot-te-recs
924299     move tot-te-pgs          to d-tot-te-pages

660270     add tot-te-clts to g-tot-te-clts giving 
|                             g-tot-te-clts
|
|          add tot-te-emps to g-tot-te-emps giving
|                             g-tot-te-emps
|
|          add tot-te-fd-txbl-grs to g-tot-te-fd-txbl-grs
|              giving g-tot-te-fd-txbl-grs
|
|          add tot-te-fd-amt to g-tot-te-fd-amt giving
|                               g-tot-te-fd-amt
|
|          add tot-te-ss-txbl-grs to g-tot-te-ss-txbl-grs
|              giving g-tot-te-ss-txbl-grs
|
|          add tot-te-ss-amt to g-tot-te-ss-amt giving
|                               g-tot-te-ss-amt
|
|          add tot-te-med-txbl-grs to g-tot-te-med-txbl-grs
|              giving g-tot-te-med-txbl-grs
|
|          add tot-te-med-amt to g-tot-te-med-amt giving
|                                g-tot-te-med-amt
|
|          add tot-te-ss-tips to g-tot-te-ss-tips giving
|                                g-tot-te-ss-tips
|
|          add tot-te-alloc-tips to g-tot-te-alloc-tips
|              giving g-tot-te-alloc-tips
|
|          add tot-te-st-txbl-grs to g-tot-te-st-txbl-grs
|              giving g-tot-te-st-txbl-grs
|          
|          add tot-te-st-amt to g-tot-te-st-amt giving
|                               g-tot-te-st-amt
|
|          add tot-te-lo-txbl-grs to g-tot-te-lo-txbl-grs
|              giving g-tot-te-lo-txbl-grs
|
|          add tot-te-lo-amt to g-tot-te-lo-amt giving
|                               g-tot-te-lo-amt
|
|          add tot-te-records to g-tot-te-records giving
660270                           g-tot-te-records.

      *******************************************************************

       o-dtl-lines.

           move 'o-dtl-lines' to msg-paragraph   

           move tot-o-clts         to d-tot-o-clts
           move tot-o-emps         to d-tot-o-emps
           move tot-o-fd-txbl-grs  to d-tot-o-fd-grs
           move tot-o-fd-amt       to d-tot-o-fd-amt
           move tot-o-ss-txbl-grs  to d-tot-o-ss-grs
           move tot-o-ss-amt       to d-tot-o-ss-amt
           move tot-o-med-txbl-grs to d-tot-o-med-grs
           move tot-o-med-amt      to d-tot-o-med-amt
           move tot-o-ss-tips      to d-tot-o-ss-tips
           move tot-o-alloc-tips   to d-tot-o-alloc-tips
           move tot-o-st-txbl-grs  to d-tot-o-st-grs
           move tot-o-st-amt       to d-tot-o-st-amt
           move tot-o-lo-txbl-grs  to d-tot-o-lo-grs
           move tot-o-lo-amt       to d-tot-o-lo-amt
           move tot-o-records      to d-tot-o-recs
924299     move tot-o-pgs          to d-tot-o-pages

660270     add tot-o-clts to g-tot-o-clts giving
|                            g-tot-o-clts
|
|          add tot-o-emps to g-tot-o-emps giving
|                            g-tot-o-emps
|
|          add tot-o-fd-txbl-grs to g-tot-o-fd-txbl-grs
|              giving g-tot-o-fd-txbl-grs
|
|          add tot-o-fd-amt to g-tot-o-fd-amt giving
|                              g-tot-o-fd-amt
|
|          add tot-o-ss-txbl-grs to g-tot-o-ss-txbl-grs
|              giving g-tot-o-ss-txbl-grs
|
|          add tot-o-ss-amt to g-tot-o-ss-amt giving
|                              g-tot-o-ss-amt
|
|          add tot-o-med-txbl-grs to g-tot-o-med-txbl-grs
|              giving g-tot-o-med-txbl-grs
|
|          add tot-o-med-amt to g-tot-o-med-amt giving
|                               g-tot-o-med-amt
|
|          add tot-o-ss-tips to g-tot-o-ss-tips giving
|                               g-tot-o-ss-tips
|
|          add tot-o-alloc-tips to g-tot-o-alloc-tips
|              giving g-tot-o-alloc-tips
|
|          add tot-o-st-txbl-grs to g-tot-o-st-txbl-grs
|              giving g-tot-o-st-txbl-grs
|
|          add tot-o-st-amt to g-tot-o-st-amt giving
|                              g-tot-o-st-amt
|
|          add tot-o-lo-txbl-grs to g-tot-o-lo-txbl-grs
|              giving g-tot-o-lo-txbl-grs
|
|          add tot-o-lo-amt to g-tot-o-lo-amt giving
|                              g-tot-o-lo-amt
|
|          add tot-o-records to g-tot-o-records giving
600270                          g-tot-o-records.


      *******************************************************************

       non-o-dtl-lines.

           move 'non-o-dtl-lines' to msg-paragraph

           move tot-non-o-clts         to d-tot-non-o-clts
           move tot-non-o-emps         to d-tot-non-o-emps
           move tot-non-o-fd-txbl-grs  to d-tot-non-o-fd-grs
           move tot-non-o-fd-amt       to d-tot-non-o-fd-amt
           move tot-non-o-ss-txbl-grs  to d-tot-non-o-ss-grs
           move tot-non-o-ss-amt       to d-tot-non-o-ss-amt
           move tot-non-o-med-txbl-grs to d-tot-non-o-med-grs
           move tot-non-o-med-amt      to d-tot-non-o-med-amt
           move tot-non-o-ss-tips      to d-tot-non-o-ss-tips
           move tot-non-o-alloc-tips   to d-tot-non-o-alloc-tips
           move tot-non-o-st-txbl-grs  to d-tot-non-o-st-grs
           move tot-non-o-st-amt       to d-tot-non-o-st-amt
           move tot-non-o-lo-txbl-grs  to d-tot-non-o-lo-grs
           move tot-non-o-lo-amt       to d-tot-non-o-lo-amt
           move tot-non-o-records      to d-tot-non-o-recs
924299     move tot-non-o-pgs          to d-tot-non-o-pages

660270     add tot-non-o-clts to g-tot-non-o-clts giving
|                                g-tot-non-o-clts
|
|          add tot-non-o-emps to g-tot-non-o-emps giving
|                                g-tot-non-o-emps
|
|          add tot-non-o-fd-txbl-grs to g-tot-non-o-fd-txbl-grs
|              giving g-tot-non-o-fd-txbl-grs
|          
|          add tot-non-o-fd-amt to g-tot-non-o-fd-amt giving 
|                                  g-tot-non-o-fd-amt
|
|          add tot-non-o-ss-txbl-grs to g-tot-non-o-ss-txbl-grs
|              giving g-tot-non-o-ss-txbl-grs
|
|          add tot-non-o-ss-amt to g-tot-non-o-ss-amt giving
|                                  g-tot-non-o-ss-amt
|
|          add tot-non-o-med-txbl-grs to g-tot-non-o-med-txbl-grs
|              giving g-tot-non-o-med-txbl-grs
|
|          add tot-non-o-med-amt to g-tot-non-o-med-amt giving
|                                   g-tot-non-o-med-amt
|
|          add tot-non-o-ss-tips to g-tot-non-o-ss-tips giving
|                                   g-tot-non-o-ss-tips
|
|          add tot-non-o-alloc-tips to g-tot-non-o-alloc-tips
|              giving g-tot-non-o-alloc-tips
|
|          add tot-non-o-st-txbl-grs to g-tot-non-o-st-txbl-grs
|              giving g-tot-non-o-st-txbl-grs
|
|          add tot-non-o-st-amt to g-tot-non-o-st-amt giving
|                                  g-tot-non-o-st-amt
|
|          add tot-non-o-lo-txbl-grs to g-tot-non-o-lo-txbl-grs
|              giving g-tot-non-o-lo-txbl-grs
|
|          add tot-non-o-lo-amt to g-tot-non-o-lo-amt
|              giving g-tot-non-o-lo-amt
|
|          add tot-non-o-records to g-tot-non-o-records giving
660270                              g-tot-non-o-records.


      *******************************************************************

       print-office-totals.

           move 'print-office-totals' to msg-paragraph

969000     add 1 to page-cnt giving page-cnt
|          move page-cnt to d-page-nbr 
969000     write print-rec from header-line   after page
|          write print-rec from blank-line after 4 lines
969000*     if line-cnt > 54
      *        perform print-header
969000*     end-if


           add 3 to line-cnt giving line-cnt

969000*     if line-cnt > 45
|     *        perform print-header
969000*     end-if

           move ws-save-off-nbr        to d-tot-off-nbr

           perform te-dtl-lines
           perform o-dtl-lines
           perform non-o-dtl-lines
           move ws-save-off-nbr  to d-tot-off-nbr
           move tot-clts         to d-tot-clts
           move tot-emps         to d-tot-emps
           move tot-fd-txbl-grs  to d-tot-fd-grs
           move tot-fd-amt       to d-tot-fd-amt
           move tot-ss-txbl-grs  to d-tot-ss-grs
           move tot-ss-amt       to d-tot-ss-amt
           move tot-med-txbl-grs to d-tot-med-grs
           move tot-med-amt      to d-tot-med-amt
           move tot-ss-tips      to d-tot-ss-tips
           move tot-alloc-tips   to d-tot-alloc-tips
           move tot-st-txbl-grs  to d-tot-st-grs
           move tot-st-amt       to d-tot-st-amt
           move tot-lo-txbl-grs  to d-tot-lo-grs
           move tot-lo-amt       to d-tot-lo-amt
           move tot-records      to d-tot-recs
924299     move tot-off-page-cnt to d-tot-pages

660270     add tot-records to g-tot-records 
660270         giving g-tot-records

           write print-rec from office-total-line      after 2 lines
           write print-rec from office-total-line-2    after 1 lines
           write print-rec from total-clt-line         after 1 lines
           write print-rec from total-emp-line         after 1 lines
           write print-rec from total-pages-line       after 1 lines
           write print-rec from total-fd-grs-line      after 1 lines
           write print-rec from total-fd-amt-line      after 1 lines
           write print-rec from total-ss-grs-line      after 1 lines
           write print-rec from total-ss-amt-line      after 1 lines
           write print-rec from total-med-grs-line     after 1 lines
           write print-rec from total-med-amt-line     after 1 lines
           write print-rec from total-ss-tips-line     after 1 lines
           write print-rec from total-alloc-tips-line  after 1 lines
           write print-rec from total-st-grs-line      after 1 lines
           write print-rec from total-st-amt-line      after 1 lines
103889     write print-rec from total-lo-grs-line      after 1 lines
103889     write print-rec from total-lo-amt-line      after 1 lines

           write print-rec from total-record-line      after 1 lines

few        move zeroes to office-total-fields

969000     add 20 to line-cnt giving line-cnt.
969000*     perform print-footer.

      *******************************************************************
89538 *write-w2-properties.
|     *    write ors-output-rec from w2delv-br-prop
|     *    write ors-output-rec from w2delv-rundt-prop
|     *    write ors-output-rec from w2-format-prop
89538 *    write ors-output-rec from w2-delv-rpt-prop.

      *******************************************************************

       print-totals.

           move 'print-totals' to msg-paragraph

969000*    if line-cnt > 45
|     *       perform print-header
969000*    end-if

           move g-tot-o-clts         to d-tot-o-clts
           move g-tot-o-emps         to d-tot-o-emps
           move g-tot-o-fd-txbl-grs  to d-tot-o-fd-grs
           move g-tot-o-fd-amt       to d-tot-o-fd-amt
           move g-tot-o-ss-txbl-grs  to d-tot-o-ss-grs
           move g-tot-o-ss-amt       to d-tot-o-ss-amt
           move g-tot-o-med-txbl-grs to d-tot-o-med-grs
           move g-tot-o-med-amt      to d-tot-o-med-amt
           move g-tot-o-ss-tips      to d-tot-o-ss-tips
           move g-tot-o-alloc-tips   to d-tot-o-alloc-tips
           move g-tot-o-st-txbl-grs  to d-tot-o-st-grs
           move g-tot-o-st-amt       to d-tot-o-st-amt
           move g-tot-o-lo-txbl-grs  to d-tot-o-lo-grs
           move g-tot-o-lo-amt       to d-tot-o-lo-amt
           move g-tot-o-records      to d-tot-o-recs

           move g-tot-non-o-clts         to d-tot-non-o-clts
           move g-tot-non-o-emps         to d-tot-non-o-emps
           move g-tot-non-o-fd-txbl-grs  to d-tot-non-o-fd-grs
           move g-tot-non-o-fd-amt       to d-tot-non-o-fd-amt
           move g-tot-non-o-ss-txbl-grs  to d-tot-non-o-ss-grs
           move g-tot-non-o-ss-amt       to d-tot-non-o-ss-amt
           move g-tot-non-o-med-txbl-grs to d-tot-non-o-med-grs
           move g-tot-non-o-med-amt      to d-tot-non-o-med-amt
           move g-tot-non-o-ss-tips      to d-tot-non-o-ss-tips
           move g-tot-non-o-alloc-tips   to d-tot-non-o-alloc-tips
           move g-tot-non-o-st-txbl-grs  to d-tot-non-o-st-grs
           move g-tot-non-o-st-amt       to d-tot-non-o-st-amt
           move g-tot-non-o-lo-txbl-grs  to d-tot-non-o-lo-grs
           move g-tot-non-o-lo-amt       to d-tot-non-o-lo-amt
           move g-tot-non-o-records      to d-tot-non-o-recs

           move g-tot-te-clts         to d-tot-te-clts
           move g-tot-te-emps         to d-tot-te-emps
           move g-tot-te-fd-txbl-grs  to d-tot-te-fd-grs
           move g-tot-te-fd-amt       to d-tot-te-fd-amt
           move g-tot-te-ss-txbl-grs  to d-tot-te-ss-grs
           move g-tot-te-ss-amt       to d-tot-te-ss-amt
           move g-tot-te-med-txbl-grs to d-tot-te-med-grs
           move g-tot-te-med-amt      to d-tot-te-med-amt
           move g-tot-te-ss-tips      to d-tot-te-ss-tips
           move g-tot-te-alloc-tips   to d-tot-te-alloc-tips
           move g-tot-te-st-txbl-grs  to d-tot-te-st-grs
           move g-tot-te-st-amt       to d-tot-te-st-amt
           move g-tot-te-lo-txbl-grs  to d-tot-te-lo-grs
           move g-tot-te-lo-amt       to d-tot-te-lo-amt
           move g-tot-te-records      to d-tot-te-recs
660270     move g-tot-clts              to d-tot-clts
|          move g-tot-emps              to d-tot-emps
|          move g-tot-fd-txbl-grs       to d-tot-fd-grs
|          move g-tot-fd-amt            to d-tot-fd-amt
|          move g-tot-ss-txbl-grs       to d-tot-ss-grs
|          move g-tot-ss-amt            to d-tot-ss-amt
660270     move g-tot-med-txbl-grs      to d-tot-med-grs
           move g-tot-med-amt           to d-tot-med-amt
           move g-tot-ss-tips           to d-tot-ss-tips
           move g-tot-alloc-tips        to d-tot-alloc-tips
           move g-tot-st-txbl-grs       to d-tot-st-grs
           move g-tot-st-amt            to d-tot-st-amt
           move g-tot-lo-txbl-grs       to d-tot-lo-grs
           move g-tot-lo-amt            to d-tot-lo-amt
           move g-tot-records           to d-tot-recs
924299     move g-tot-pages             to d-tot-pages
|          move g-tot-non-o-pgs         to d-tot-non-o-pages
|          move g-tot-o-pgs             to d-tot-o-pages
924299     move g-tot-te-pgs            to d-tot-te-pages

           write print-rec from grand-total-line       after 2 lines

           write print-rec from grand-total-line-2     after 1 lines

           write print-rec from total-clt-line         after 1 lines
           write print-rec from total-emp-line         after 1 lines
           write print-rec from total-pages-line       after 1 lines
           write print-rec from total-fd-grs-line      after 1 lines
           write print-rec from total-fd-amt-line      after 1 lines
           write print-rec from total-ss-grs-line      after 1 lines
           write print-rec from total-ss-amt-line      after 1 lines
           write print-rec from total-med-grs-line     after 1 lines
           write print-rec from total-med-amt-line     after 1 lines
           write print-rec from total-ss-tips-line     after 1 lines
           write print-rec from total-alloc-tips-line  after 1 lines
           write print-rec from total-st-grs-line      after 1 lines
           write print-rec from total-st-amt-line      after 1 lines
103889     write print-rec from total-lo-grs-line      after 1 lines
103889     write print-rec from total-lo-amt-line      after 1 lines
           write print-rec from total-record-line      after 1 lines

969000     add 15 to line-cnt giving line-cnt
969000     perform print-footer.

      *******************************************************************

       print-header.

           move 'print-header' to msg-paragraph

           add 1 to page-cnt giving page-cnt

           if page-cnt = 1
108226        perform pop-info-control
|             string info-control-line filter-line
|                delimited by size into print-rec
|             write print-rec after 0
108226        move space to print-rec
           else
              perform print-footer
              write print-rec from blank-line after page 
           end-if

           move page-cnt to d-page-nbr
           write print-rec from header-line   after 1 line
969000     if ws-skip-heading = 'n' 
              write print-rec from header-line-1 after 2 line
              write print-rec from header-line-2 after 1 line
              write print-rec from header-line-3 after 1 line
969000     end-if
           move 5 to line-cnt. 

      *******************************************************************

       print-footer.

           move 'print-footer' to msg-paragraph.

           compute adv-lines = total-lines - line-cnt

           write print-rec from header-line after adv-lines
           
           move zero to line-cnt.

      *******************************************************************

       initialization.

           move 'initialization' to msg-paragraph


           move 1 to return-code
                     no-rsp-sw

32827 **   removed c++ calls
32827      accept w2delv-parameters from command-line

89538 *    perform pop-w2-properties

           perform open-files

           move zeroes to page-cnt
           move 66     to line-cnt
969000     move 'n'    to ws-skip-heading
           perform format-d-date

           perform format-d-time.

      *******************************************************************

89538 *pop-w2-properties.
|     *   accept w2-delv-rundt from date yyyymmdd
|     *   accept w2-delv-runtm from time 
89538 *   move w-host-office to w2-delv-branch.


       format-d-date.

          move 'format-d-date' to msg-paragraph

          accept date-n from date yyyymmdd

          move date-n-mm   to date-f-mm
          move date-n-dd   to date-f-dd
          move date-n-ccyy to date-f-ccyy
          move date-f      to d-date.

      *******************************************************************

       format-d-time.

          move 'format-d-time' to msg-paragraph

          accept time-n from time

          if time-n-hours > 12 and < 24
             subtract 12 from time-n-hours
             move 'p.m.' to d-meridian
          else
             move 'a.m.' to d-meridian
          end-if

          move time-n-hours to time-f-hours
          move time-n-mins  to time-f-mins
          move time-f       to d-time.

      *******************************************************************

       open-files.

           move n-91 to io-call-func
           call 'prmsxxio'
           if msgfile-flg not = i-o-ok
              move msgfile-flg              to msg-bad-return-cd
              move 'UNABLE TO OPEN MSGFILE' to msg-bad-data
              perform log-type-f-msg
            end-if

          call 'prp31xio'
          if p31x-flg not = i-o-ok
             move zero                      to msg-req-key
             move 'Unable to open p31xfile' to msg-bad-data
             move p31x-flg                  to msg-bad-return-cd
             perform log-type-f-msg
             perform abort-rtn
          end-if

          move 'TMPDIR' to dict-name
          call 'fxlt' using dict-name
                            ws-temp-tree

          string ws-temp-tree delimited by space
                 '/vnd_tran.rpt'  delimited by size
                 into print-tree

          open output print-file
          if print-flg not = i-o-ok
             move 'Y' to abort-ind
             move print-flg to msg-bad-return-cd
             move 'Unable to open VND_TRAN.RPT' to msg-bad-data
             perform log-type-f-msg
          end-if

89538 *   move 'TMPDIR'  to dict-name
|     *   call 'fxlt' using dict-name
|     *                     ws-temp-tree
|     *   string ws-temp-tree delimited by space,
|     *           '/vnd_tran.properties' delimited by size
|     *           into ors-file-tree          
|     *
|     *   open output ors-output-file
|     *   if ors-file-flg not = i-o-ok
|     *      move 'Y' to abort-ind
|     *      move ors-file-flg to msg-bad-return-cd
|     *      move 'Unable to open vnd_tran.properties' to msg-bad-data
|     *      perform log-type-f-msg
89538 *   end-if


660270    move 'TMPDIR'  to dict-name
|         call 'fxlt' using dict-name
|                           ws-temp-tree
|         string ws-temp-tree delimited by space,
|                 '/negativeemp.txt' delimited by size
660270            into output-file-tree          

660270    open output output-file
|         if output-file-flg not = i-o-ok
|            move 'Y' to abort-ind
|            move output-file-flg to msg-bad-return-cd
|            move 'Unable to open negativeemp.txt' to msg-bad-data
|            perform log-type-f-msg
660270    end-if

          if abort-ind = 'Y'
             perform abort-rtn
          end-if.

      *****************************************************************

       close-files.

           move n-99 to io-call-func
660270     close output-file
89538 *    close ors-output-file         
           call 'prmsxxio'
           close print-file.

       read-next-p31x.
           move 3 to io-call-func.
           call 'prp31xio'.

       log-start-msg.
          move spaces       to msg-arguments
          initialize           msg-arguments
          move program-name to msg-calling-prog
          move 65           to comm-call-func
          call 'prcommsr'.

       log-finish-msg.
          move spaces       to msg-arguments
          initialize           msg-arguments
          move program-name to msg-calling-prog
          move 66           to comm-call-func
          call 'prcommsr'.

       log-type-i-msg.
          move program-name to msg-calling-prog
          move 67           to comm-call-func
          call 'prcommsr'.

       log-type-w-msg.
          move program-name to msg-calling-prog
          move 68           to comm-call-func
          call 'prcommsr'.

       log-type-f-msg.
          move program-name to msg-calling-prog
          move 69           to comm-call-func
          call 'prcommsr'.

       log-abort-msg.
          move program-name to msg-calling-prog
          move 70           to comm-call-func
          call 'prcommsr'.

       abort-rtn.
          move 1 to return-code
          stop run.

108226 pop-info-control.
|           move w-host-office    to info-off-nbr
|           move '00000000000'    to info-clt-nbr
|           move 'Y'              to info-ors
|           move '1 '             to info-rpt-version
|           move 'W2DELV'         to info-rpt-name
|           accept info-run-dt    from date yyyymmdd
108226      accept info-run-time  from time
            .
