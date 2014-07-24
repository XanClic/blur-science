#version 150 core

in vec2 in_pos;

out vec2 vf_texcoord;


void main(void)
{
    vf_texcoord = in_pos;
    gl_Position = vec4(2.0 * in_pos - vec2(1.0), 0.0, 1.0);
}
