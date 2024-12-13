//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	
	vec2 offset = vec2(0.0, cos(v_vTexcoord.x * 100.0) * 0.01);
	
	vec4 inputTex = texture2D(gm_BaseTexture, v_vTexcoord + offset);
	
	gl_FragColor = inputTex;
}
