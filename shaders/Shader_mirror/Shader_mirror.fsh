//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
void main()
{
	vec2 uv = v_vTexcoord;
	
	float rex = (uv.x)*(-1.0)+1.0;
	float rey = uv.y;
	
	vec4 boom = texture2D(gm_BaseTexture, vec2(rex,rey));
    gl_FragColor = v_vColour * vec4(boom.r, boom.g, boom.b, 1);
}