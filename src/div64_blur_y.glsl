#version 150 core

in vec2 vf_texcoord;

out vec4 out_color;

uniform sampler2D tex;
uniform float epsilon;


vec4 access(float diff)
{
    return texture(tex, vec2(vf_texcoord.x, clamp(vf_texcoord.y + epsilon * diff, epsilon, 1.0 - epsilon)));
}

void main(void)
{
    out_color = access(-1.0) * 0.27407
              + access( 0.0) * 0.45186
              + access( 1.0) * 0.27407;
}
