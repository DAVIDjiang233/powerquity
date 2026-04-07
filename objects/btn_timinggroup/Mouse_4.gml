if (array_length(global.choose)!=0) exit;
if (ctrl_chartdesign.designview<-1) exit;

//if (ctrl_chartdesign.designview==2) exit;
msg = get_integer_async("请输入数值", "");