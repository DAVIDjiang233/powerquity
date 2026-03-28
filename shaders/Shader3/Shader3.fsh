//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float powers;
uniform float colorb;
void main()
{
	vec2 uv = v_vTexcoord;
	float amount = pow(0.5-uv.x,2.0)+pow(0.5-uv.y,2.0);

	float move = 0.05-0.1*amount;

	move = powers*move;
	float moveb = (2.0-colorb)*move;
	float mover = colorb*move;
	
	float rex = (-0.5+uv.x)*(1.0-mover)+0.5;
	float rey = (-0.5+uv.y)*(1.0-mover)+0.5;
	float gex = (-0.5+uv.x)*(1.0-move)+0.5;
	float gey = (-0.5+uv.y)*(1.0-move)+0.5;
	float bex = (-0.5+uv.x)*(1.0-moveb)+0.5;
	float bey = (-0.5+uv.y)*(1.0-moveb)+0.5;
	
	vec4 boomr = texture2D(gm_BaseTexture, vec2(rex,rey));
	vec4 boomg = texture2D(gm_BaseTexture, vec2(gex,gey));
	vec4 boomb = texture2D(gm_BaseTexture, vec2(bex,bey));
    //float gray = (texColor.r + texColor.g + texColor.b) / 3.0;
    gl_FragColor = v_vColour * vec4(boomr.r, boomg.g, boomb.b, 1);
}