#version 150 core

in vec2 vf_texcoord;

out vec4 out_color;

uniform sampler2D tex;
uniform float epsilon;


vec4 access(float diff)
{
    return texture(tex, vec2(clamp(vf_texcoord.x + epsilon * diff, epsilon, 1.0 - epsilon), vf_texcoord.y));
}

void main(void)
{
    out_color = access(-15.0) * 0.003842
              + access(-14.0) * 0.005521
              + access(-13.0) * 0.007737
              + access(-12.0) * 0.010576
              + access(-11.0) * 0.014099
              + access(-10.0) * 0.018331
              + access(- 9.0) * 0.023245
              + access(- 8.0) * 0.028749
              + access(- 7.0) * 0.034678
              + access(- 6.0) * 0.040797
              + access(- 5.0) * 0.046811
              + access(- 4.0) * 0.052385
              + access(- 3.0) * 0.057175
              + access(- 2.0) * 0.060863
              + access(- 1.0) * 0.063189
              + access(  0.0) * 0.063983
              + access(  1.0) * 0.063189
              + access(  2.0) * 0.060863
              + access(  3.0) * 0.057175
              + access(  4.0) * 0.052385
              + access(  5.0) * 0.046811
              + access(  6.0) * 0.040797
              + access(  7.0) * 0.034678
              + access(  8.0) * 0.028749
              + access(  9.0) * 0.023245
              + access( 10.0) * 0.018331
              + access( 11.0) * 0.014099
              + access( 12.0) * 0.010576
              + access( 13.0) * 0.007737
              + access( 14.0) * 0.005521
              + access( 15.0) * 0.003842;
}
