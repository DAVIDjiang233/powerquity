function scr_restart(){
	for(var _i=0;_i<array_length(global.fontall);_i++){
		if(global.fontall[_i]!=0){
			font_delete(global.fontall[_i]);
		}
	}
	for(var _i=0;_i<array_length(global.playskin);_i++){
		if(sprite_exists(global.playskin[_i])&&string_starts_with(sprite_get_name(global.playskin[_i]),"__")){
			sprite_delete(global.playskin[_i]);
		}
	}
	game_restart();
}