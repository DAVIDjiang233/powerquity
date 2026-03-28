function scr_rand(_x,_y){
	_x/=5;
	_y/=5;
	return (random_range(_x, _y)
			+random_range(_x, _y)
			+random_range(_x, _y)
			+random_range(_x, _y)
			+random_range(_x, _y)
			);
}