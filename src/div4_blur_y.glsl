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
    out_color = access(-31.0) * 0.001337
              + access(-30.0) * 0.001638
              + access(-29.0) * 0.001994
              + access(-28.0) * 0.002412
              + access(-27.0) * 0.002897
              + access(-26.0) * 0.003457
              + access(-25.0) * 0.004097
              + access(-24.0) * 0.004824
              + access(-23.0) * 0.005642
              + access(-22.0) * 0.006556
              + access(-21.0) * 0.007566
              + access(-20.0) * 0.008674
              + access(-19.0) * 0.009878
              + access(-18.0) * 0.011175
              + access(-17.0) * 0.012557
              + access(-16.0) * 0.014018
              + access(-15.0) * 0.015543
              + access(-14.0) * 0.017121
              + access(-13.0) * 0.018733
              + access(-12.0) * 0.020361
              + access(-11.0) * 0.021984
              + access(-10.0) * 0.023578
              + access(- 9.0) * 0.025119
              + access(- 8.0) * 0.026584
              + access(- 7.0) * 0.027947
              + access(- 6.0) * 0.029185
              + access(- 5.0) * 0.030275
              + access(- 4.0) * 0.031197
              + access(- 3.0) * 0.031933
              + access(- 2.0) * 0.032470
              + access(- 1.0) * 0.032796
              + access(  0.0) * 0.032906
              + access(  1.0) * 0.032796
              + access(  2.0) * 0.032470
              + access(  3.0) * 0.031933
              + access(  4.0) * 0.031197
              + access(  5.0) * 0.030275
              + access(  6.0) * 0.029185
              + access(  7.0) * 0.027947
              + access(  8.0) * 0.026584
              + access(  9.0) * 0.025119
              + access( 10.0) * 0.023578
              + access( 11.0) * 0.021984
              + access( 12.0) * 0.020361
              + access( 13.0) * 0.018733
              + access( 14.0) * 0.017121
              + access( 15.0) * 0.015543
              + access( 16.0) * 0.014018
              + access( 17.0) * 0.012557
              + access( 18.0) * 0.011175
              + access( 19.0) * 0.009878
              + access( 20.0) * 0.008674
              + access( 21.0) * 0.007566
              + access( 22.0) * 0.006556
              + access( 23.0) * 0.005642
              + access( 24.0) * 0.004824
              + access( 25.0) * 0.004097
              + access( 26.0) * 0.003457
              + access( 27.0) * 0.002897
              + access( 28.0) * 0.002412
              + access( 29.0) * 0.001994
              + access( 30.0) * 0.001638
              + access( 31.0) * 0.001337;
}
