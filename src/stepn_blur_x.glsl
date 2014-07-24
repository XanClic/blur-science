#version 150 core

in vec2 vf_texcoord;

out vec4 out_color;

uniform sampler2D tex;
uniform float res_epsilon, epsilon;


vec4 access(float diff)
{
    return texture(tex, vec2(clamp(vf_texcoord.x + epsilon * diff, res_epsilon, 1.0 - res_epsilon), vf_texcoord.y));
}

void main(void)
{
    out_color = access( 0.0) * 0.5
              + access(-1.0) * 0.25
              + access( 1.0) * 0.25;
}
