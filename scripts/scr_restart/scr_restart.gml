function scr_restart(){
	font_delete(global.fontall);
	for(var _i=0;_i<array_length(global.playskin);_i++){
		if(sprite_exists(global.playskin[_i])&&string_starts_with(sprite_get_name(global.playskin[_i]),"__")){
			sprite_delete(global.playskin[_i]);
		}
	}
	game_restart();
}