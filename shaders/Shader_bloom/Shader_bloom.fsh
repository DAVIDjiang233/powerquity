//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float powers;
uniform float roomx;
uniform float roomy;
void main()
{
	vec4 sum = vec4(0);
	
	
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x-4.0/roomx, v_vTexcoord.y))*0.05;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x-3.0/roomx, v_vTexcoord.y))*0.09;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x-2.0/roomx, v_vTexcoord.y))*0.12;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x-1.0/roomx, v_vTexcoord.y))*0.15;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y))*0.16;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x+1.0/roomx, v_vTexcoord.y))*0.15;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x+2.0/roomx, v_vTexcoord.y))*0.12;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x+3.0/roomx, v_vTexcoord.y))*0.09;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x+4.0/roomx, v_vTexcoord.y))*0.05;
	
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y-4.0/roomy))*0.05;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y-3.0/roomy))*0.09;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y-2.0/roomy))*0.12;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y-1.0/roomy))*0.15;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y))*0.16;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y+1.0/roomy))*0.15;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y+2.0/roomy))*0.12;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y+3.0/roomy))*0.09;
	sum += texture2D(gm_BaseTexture, vec2(v_vTexcoord.x, v_vTexcoord.y+4.0/roomy))*0.05;
	
    gl_FragColor = sum * powers + texture2D(gm_BaseTexture, v_vTexcoord);
}