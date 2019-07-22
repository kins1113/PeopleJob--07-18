--view �����

-- �Խñ� ��ü ��ȸ ��
CREATE OR REPLACE VIEW post_All
as
select p.* , b.BOARDNAME,b.USAGE "bUSAGE",b.TYPE_CODE, b.COMMENTAGE,
    b.UPAGE ,b.UPNUMAGE,b.UPSIZEAGE,bk.TYPE,bk.USAGE as BKUSAGE,
    me.MEMBERID,me.MEMBERNAME, ma.ADMINID   from post p
join board b
on p.board_code=b.BOARD_CODE1
join board_kind bk
on bk.TYPE_CODE =b.TYPE_CODE
left JOIN MEMBER me
on p.MEMBER_CODE = me.MEMBER_CODE
left join manager ma
on p.ADMIN_CODE = ma.ADMIN_CODE;




select *   from   ( 
      select A.*, rownum as RNUM        from       (    
             select notify_Code, notifytitle, notifycontent, readcount,notifydate,     
              (sysdate-notifydate)*24 as new_Img_Term     from notice    
              order by notify_Code desc     
	) A  
)   
where RNUM>?     and RNUM<=? + ?;

--결제완료된 채용공고 메인화면에 광고
CREATE OR REPLACE VIEW vvipMain
as
select m.company_code,m.member_code, m.membername, p.progress, p.payend_date, p.service_code, p.paydate,(sysdate-p.paydate) as cancellimit
from member m join payment p
on p.MEMBER_CODE = m.MEMBER_CODE
and p.progress='결제완료'
and payend_date>=sysdate;

CREATE OR REPLACE VIEW companyJobOpen 
as
select c.company_Code,c.image, c.companyname, j.jobtitle, j.end_date, j.jobopening
from company c join jobopening j 
on j.COMPANY_CODE = c.COMPANY_CODE
where end_date>=sysdate;
                          