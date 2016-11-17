varying vec2 texcoord0;
varying vec2 texcoord1;
attribute vec3 normal;
attribute vec4 position;
uniform mat4 projectionMatrix;
uniform mat4 modelViewMatrix;
uniform mat4 modelViewProjectionMatrix;
uniform float time;
uniform sampler2D tex0;

void main()
{
    vec3 vn = gl_Normal;
    // transform texcoords
    vec2 tc = vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
    texcoord0 = tc;//vec2(gl_TextureMatrix[0] * gl_MultiTexCoord0);
    texcoord1 = vec2(gl_TextureMatrix[1] * gl_MultiTexCoord0);
    
    vec4 pos =  gl_Vertex;
    vec3 xyz = pos.xyz;
    
    vec4 col = texture2D(tex0, tc);
    float avg = dot(col.rgb, vec3(1.0))*0.33333;
//    avg = avg * 2.0 - 1.0;
    
    float distortion = vn.z * -avg*30.0;
    xyz.z += distortion;
    
    // perform standard transform on vertex
    gl_Position = gl_ModelViewProjectionMatrix * vec4(xyz, pos.w);
}
