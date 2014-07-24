#version 150 core

in vec2 vf_texcoord;

out vec4 out_color;

uniform sampler2D tex;
uniform vec2 res_epsilon, epsilon;


vec2 c(vec2 v)
{
    return clamp(v, res_epsilon, vec2(1.0) - res_epsilon);
}

void main(void)
{
    /*
    out_color = texture(tex, c(vf_texcoord + epsilon * vec2(-0.02, -0.02))) * 0.96
              + texture(tex, c(vf_texcoord + epsilon * vec2(-0.02,  1.00))) * 0.02
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.00, -0.02))) * 0.02
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.00,  1.00))) * 0.004;*/

    out_color = texture(tex, c(vf_texcoord + epsilon * vec2(-1.0, -1.0))) * 0.0004
              + texture(tex, c(vf_texcoord + epsilon * vec2(-1.0,  0.0))) * 0.0192
              + texture(tex, c(vf_texcoord + epsilon * vec2(-1.0,  1.0))) * 0.0004
              + texture(tex, c(vf_texcoord + epsilon * vec2( 0.0, -1.0))) * 0.0192
              + texture(tex, c(vf_texcoord + epsilon * vec2( 0.0,  0.0))) * 0.9216
              + texture(tex, c(vf_texcoord + epsilon * vec2( 0.0,  1.0))) * 0.0192
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0, -1.0))) * 0.0004
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0,  0.0))) * 0.0192
              + texture(tex, c(vf_texcoord + epsilon * vec2( 1.0,  1.0))) * 0.0004;
}
