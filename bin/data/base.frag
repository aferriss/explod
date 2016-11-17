//setup for 2 texture
varying vec2 texcoord0;
varying vec2 texcoord1;

uniform sampler2D tex0;


void main(){
    vec4 color = texture2D(tex0, texcoord0);
    
    float avg = dot(color.rgb, vec3(1.0))*0.3333;
    if(avg < 0.1){
        discard;
    }
    gl_FragColor = color;
    
}
