#version 150 core

in vec2 vf_texcoord;

out vec4 out_color;

uniform sampler2D tex;


void main(void)
{
    out_color = texture(tex, vf_texcoord);
}
