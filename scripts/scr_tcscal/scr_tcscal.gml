function scr_tcscal(st,et,sx,ex,t,l){
	
	t=(t-st)/(et-st);
	if(typeof(l)=="array"){
		t=scr_calc(l,t)
	}
	else{
		if(t<0){
			t=0;
		}
		else if(t>1){
			t=1;
		}
		else if l==0{
			t=t;
		}
		else if l==1{
			t=1-power(t-1,2);
		}
		else if l==2{
			t=power(t,2);
		}
		else if l==4{
			t=sin(((t-1)*pi)/2)+1;
		}
		else if l==3{
			t=sin((t*pi)/2);
		}
		else if l==5{
			t=sqrt(1-power(t-1,2));
		}
		else if l==6{
			t=1-sqrt(1-power(t,2));
		}
	
		else if l==7{
			t=1+power(t-1,3);
		}
		else if l==8{
			t=power(t,3);
		}
	}
	return (t*(ex-sx)+sx);
	
	
	
	/*

b: x
o^2: 1-(x-1)^2
i^2: x^2
so: sin((x*pi)/2)
si: sin(((x-1)*pi)/2)+1
oo: sqrt(1-(x-1)^2)
oi: 1-sqrt(1-x^2)
o^3: 1+(x-1)^3
i^3: x^3


*/
}