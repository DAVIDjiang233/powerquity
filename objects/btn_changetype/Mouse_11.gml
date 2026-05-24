if (ctrl_chartdesign.designview>0) exit;
if (ctrl_chartdesign.designview<-1) exit;
if (ctrl_chartdesign.designview==-1&&array_length(global.choose)==0) exit;

if(type==2&&array_length(global.choose)!=0) exit;

global.mouseonbtn=0; window_set_cursor(cr_default);
mouseonbtn=0;