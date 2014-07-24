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
    out_color = access(-7.0) * 0.00884
              + access(-6.0) * 0.01821
              + access(-5.0) * 0.03356
              + access(-4.0) * 0.05533
              + access(-3.0) * 0.08163
              + access(-2.0) * 0.10777
              + access(-1.0) * 0.12732
              + access( 0.0) * 0.13459
              + access( 1.0) * 0.12732
              + access( 2.0) * 0.10777
              + access( 3.0) * 0.08163
              + access( 4.0) * 0.05533
              + access( 5.0) * 0.03356
              + access( 6.0) * 0.01821
              + access( 7.0) * 0.00884;
}
