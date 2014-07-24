#version 150 core

in vec2 vf_texcoord;

out vec4 out_color;

uniform sampler2D tex;
uniform float res_epsilon, epsilon;


vec4 access(float diff)
{
    return texture(tex, vec2(vf_texcoord.x, clamp(vf_texcoord.y + epsilon * diff, res_epsilon, 1.0 - res_epsilon)));
}

void main(void)
{
    out_color = access( 0.0) * 0.96
              + access(-1.0) * 0.02
              + access( 1.0) * 0.02;
}
