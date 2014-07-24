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
    out_color = access(-127.0) * 0.000505
              + access(-126.0) * 0.000527
              + access(-125.0) * 0.000549
              + access(-124.0) * 0.000572
              + access(-123.0) * 0.000597
              + access(-122.0) * 0.000621
              + access(-121.0) * 0.000647
              + access(-120.0) * 0.000674
              + access(-119.0) * 0.000701
              + access(-118.0) * 0.000729
              + access(-117.0) * 0.000759
              + access(-116.0) * 0.000789
              + access(-115.0) * 0.000820
              + access(-114.0) * 0.000851
              + access(-113.0) * 0.000884
              + access(-112.0) * 0.000918
              + access(-111.0) * 0.000953
              + access(-110.0) * 0.000989
              + access(-109.0) * 0.001025
              + access(-108.0) * 0.001063
              + access(-107.0) * 0.001102
              + access(-106.0) * 0.001142
              + access(-105.0) * 0.001183
              + access(-104.0) * 0.001225
              + access(-103.0) * 0.001268
              + access(-102.0) * 0.001312
              + access(-101.0) * 0.001357
              + access(-100.0) * 0.001403
              + access(- 99.0) * 0.001451
              + access(- 98.0) * 0.001499
              + access(- 97.0) * 0.001548
              + access(- 96.0) * 0.001599
              + access(- 95.0) * 0.001651
              + access(- 94.0) * 0.001704
              + access(- 93.0) * 0.001758
              + access(- 92.0) * 0.001813
              + access(- 91.0) * 0.001869
              + access(- 90.0) * 0.001926
              + access(- 89.0) * 0.001984
              + access(- 88.0) * 0.002044
              + access(- 87.0) * 0.002104
              + access(- 86.0) * 0.002166
              + access(- 85.0) * 0.002229
              + access(- 84.0) * 0.002292
              + access(- 83.0) * 0.002357
              + access(- 82.0) * 0.002423
              + access(- 81.0) * 0.002489
              + access(- 80.0) * 0.002557
              + access(- 79.0) * 0.002626
              + access(- 78.0) * 0.002695
              + access(- 77.0) * 0.002766
              + access(- 76.0) * 0.002837
              + access(- 75.0) * 0.002910
              + access(- 74.0) * 0.002983
              + access(- 73.0) * 0.003057
              + access(- 72.0) * 0.003132
              + access(- 71.0) * 0.003207
              + access(- 70.0) * 0.003284
              + access(- 69.0) * 0.003361
              + access(- 68.0) * 0.003438
              + access(- 67.0) * 0.003516
              + access(- 66.0) * 0.003595
              + access(- 65.0) * 0.003675
              + access(- 64.0) * 0.003754
              + access(- 63.0) * 0.003835
              + access(- 62.0) * 0.003916
              + access(- 61.0) * 0.003997
              + access(- 60.0) * 0.004078
              + access(- 59.0) * 0.004160
              + access(- 58.0) * 0.004242
              + access(- 57.0) * 0.004324
              + access(- 56.0) * 0.004406
              + access(- 55.0) * 0.004488
              + access(- 54.0) * 0.004571
              + access(- 53.0) * 0.004653
              + access(- 52.0) * 0.004735
              + access(- 51.0) * 0.004817
              + access(- 50.0) * 0.004899
              + access(- 49.0) * 0.004980
              + access(- 48.0) * 0.005061
              + access(- 47.0) * 0.005142
              + access(- 46.0) * 0.005223
              + access(- 45.0) * 0.005302
              + access(- 44.0) * 0.005382
              + access(- 43.0) * 0.005460
              + access(- 42.0) * 0.005538
              + access(- 41.0) * 0.005615
              + access(- 40.0) * 0.005692
              + access(- 39.0) * 0.005767
              + access(- 38.0) * 0.005842
              + access(- 37.0) * 0.005915
              + access(- 36.0) * 0.005987
              + access(- 35.0) * 0.006059
              + access(- 34.0) * 0.006129
              + access(- 33.0) * 0.006198
              + access(- 32.0) * 0.006265
              + access(- 31.0) * 0.006331
              + access(- 30.0) * 0.006396
              + access(- 29.0) * 0.006459
              + access(- 28.0) * 0.006521
              + access(- 27.0) * 0.006581
              + access(- 26.0) * 0.006639
              + access(- 25.0) * 0.006696
              + access(- 24.0) * 0.006751
              + access(- 23.0) * 0.006804
              + access(- 22.0) * 0.006855
              + access(- 21.0) * 0.006905
              + access(- 20.0) * 0.006952
              + access(- 19.0) * 0.006997
              + access(- 18.0) * 0.007041
              + access(- 17.0) * 0.007082
              + access(- 16.0) * 0.007121
              + access(- 15.0) * 0.007158
              + access(- 14.0) * 0.007192
              + access(- 13.0) * 0.007225
              + access(- 12.0) * 0.007255
              + access(- 11.0) * 0.007283
              + access(- 10.0) * 0.007308
              + access(-  9.0) * 0.007332
              + access(-  8.0) * 0.007352
              + access(-  7.0) * 0.007371
              + access(-  6.0) * 0.007387
              + access(-  5.0) * 0.007400
              + access(-  4.0) * 0.007411
              + access(-  3.0) * 0.007420
              + access(-  2.0) * 0.007426
              + access(-  1.0) * 0.007430
              + access(   0.0) * 0.007431
              + access(   1.0) * 0.007430
              + access(   2.0) * 0.007426
              + access(   3.0) * 0.007420
              + access(   4.0) * 0.007411
              + access(   5.0) * 0.007400
              + access(   6.0) * 0.007387
              + access(   7.0) * 0.007371
              + access(   8.0) * 0.007352
              + access(   9.0) * 0.007332
              + access(  10.0) * 0.007308
              + access(  11.0) * 0.007283
              + access(  12.0) * 0.007255
              + access(  13.0) * 0.007225
              + access(  14.0) * 0.007192
              + access(  15.0) * 0.007158
              + access(  16.0) * 0.007121
              + access(  17.0) * 0.007082
              + access(  18.0) * 0.007041
              + access(  19.0) * 0.006997
              + access(  20.0) * 0.006952
              + access(  21.0) * 0.006905
              + access(  22.0) * 0.006855
              + access(  23.0) * 0.006804
              + access(  24.0) * 0.006751
              + access(  25.0) * 0.006696
              + access(  26.0) * 0.006639
              + access(  27.0) * 0.006581
              + access(  28.0) * 0.006521
              + access(  29.0) * 0.006459
              + access(  30.0) * 0.006396
              + access(  31.0) * 0.006331
              + access(  32.0) * 0.006265
              + access(  33.0) * 0.006198
              + access(  34.0) * 0.006129
              + access(  35.0) * 0.006059
              + access(  36.0) * 0.005987
              + access(  37.0) * 0.005915
              + access(  38.0) * 0.005842
              + access(  39.0) * 0.005767
              + access(  40.0) * 0.005692
              + access(  41.0) * 0.005615
              + access(  42.0) * 0.005538
              + access(  43.0) * 0.005460
              + access(  44.0) * 0.005382
              + access(  45.0) * 0.005302
              + access(  46.0) * 0.005223
              + access(  47.0) * 0.005142
              + access(  48.0) * 0.005061
              + access(  49.0) * 0.004980
              + access(  50.0) * 0.004899
              + access(  51.0) * 0.004817
              + access(  52.0) * 0.004735
              + access(  53.0) * 0.004653
              + access(  54.0) * 0.004571
              + access(  55.0) * 0.004488
              + access(  56.0) * 0.004406
              + access(  57.0) * 0.004324
              + access(  58.0) * 0.004242
              + access(  59.0) * 0.004160
              + access(  60.0) * 0.004078
              + access(  61.0) * 0.003997
              + access(  62.0) * 0.003916
              + access(  63.0) * 0.003835
              + access(  64.0) * 0.003754
              + access(  65.0) * 0.003675
              + access(  66.0) * 0.003595
              + access(  67.0) * 0.003516
              + access(  68.0) * 0.003438
              + access(  69.0) * 0.003361
              + access(  70.0) * 0.003284
              + access(  71.0) * 0.003207
              + access(  72.0) * 0.003132
              + access(  73.0) * 0.003057
              + access(  74.0) * 0.002983
              + access(  75.0) * 0.002910
              + access(  76.0) * 0.002837
              + access(  77.0) * 0.002766
              + access(  78.0) * 0.002695
              + access(  79.0) * 0.002626
              + access(  80.0) * 0.002557
              + access(  81.0) * 0.002489
              + access(  82.0) * 0.002423
              + access(  83.0) * 0.002357
              + access(  84.0) * 0.002292
              + access(  85.0) * 0.002229
              + access(  86.0) * 0.002166
              + access(  87.0) * 0.002104
              + access(  88.0) * 0.002044
              + access(  89.0) * 0.001984
              + access(  90.0) * 0.001926
              + access(  91.0) * 0.001869
              + access(  92.0) * 0.001813
              + access(  93.0) * 0.001758
              + access(  94.0) * 0.001704
              + access(  95.0) * 0.001651
              + access(  96.0) * 0.001599
              + access(  97.0) * 0.001548
              + access(  98.0) * 0.001499
              + access(  99.0) * 0.001451
              + access( 100.0) * 0.001403
              + access( 101.0) * 0.001357
              + access( 102.0) * 0.001312
              + access( 103.0) * 0.001268
              + access( 104.0) * 0.001225
              + access( 105.0) * 0.001183
              + access( 106.0) * 0.001142
              + access( 107.0) * 0.001102
              + access( 108.0) * 0.001063
              + access( 109.0) * 0.001025
              + access( 110.0) * 0.000989
              + access( 111.0) * 0.000953
              + access( 112.0) * 0.000918
              + access( 113.0) * 0.000884
              + access( 114.0) * 0.000851
              + access( 115.0) * 0.000820
              + access( 116.0) * 0.000789
              + access( 117.0) * 0.000759
              + access( 118.0) * 0.000729
              + access( 119.0) * 0.000701
              + access( 120.0) * 0.000674
              + access( 121.0) * 0.000647
              + access( 122.0) * 0.000621
              + access( 123.0) * 0.000597
              + access( 124.0) * 0.000572
              + access( 125.0) * 0.000549
              + access( 126.0) * 0.000527
              + access( 127.0) * 0.000505;
}
