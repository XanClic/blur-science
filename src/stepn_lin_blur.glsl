#version 150 core

in vec2 vf_texcoord;

out vec4 out_color;

uniform sampler2D tex;
uniform vec2 res_epsilon, epsilon;


vec2 c(vec2 v)
{
    return clamp(v, res_epsilon, 1.0 - res_epsilon);
}

void main(void)
{
    out_color = texture(tex, c(vf_texcoord + epsilon * vec2(-0.3333, -0.3333))) * 0.5625
              + texture(tex, c(vf_texcoord + epsilon * vec2(-0.3333,  1.0000))) * 0.1875
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0000, -0.3333))) * 0.1875
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0000,  1.0000))) * 0.0625;

/*
    out_color = texture(tex, c(vf_texcoord + epsilon * vec2(-1.0, -1.0))) * 0.0625
              + texture(tex, c(vf_texcoord + epsilon * vec2(-1.0,  0.0))) * 0.125
              + texture(tex, c(vf_texcoord + epsilon * vec2(-1.0,  1.0))) * 0.0625
              + texture(tex, c(vf_texcoord + epsilon * vec2( 0.0, -1.0))) * 0.125
              + texture(tex, c(vf_texcoord + epsilon * vec2( 0.0,  0.0))) * 0.25
              + texture(tex, c(vf_texcoord + epsilon * vec2( 0.0,  1.0))) * 0.125
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0, -1.0))) * 0.0625
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0,  0.0))) * 0.125
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0,  1.0))) * 0.0625;
              */
}
