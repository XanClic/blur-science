#include <chrono>
#include <cmath>
#include <cstdint>
#include <cstdio>

#include <SDL2/SDL.h>

#include <dake/gl/gl.hpp>
#include <dake/gl/framebuffer.hpp>
#include <dake/gl/shader.hpp>
#include <dake/gl/texture.hpp>
#include <dake/gl/vertex_array.hpp>
#include <dake/gl/vertex_attrib.hpp>
#include <dake/math/matrix.hpp>


#define stringify_helper(x) #x
#define stringify(x) stringify_helper(x)


// #define SIZE_DIV 4
// #define SIZE_DIV_EXP 2

#define PING_PONG
#define PING_PONG_QUALITY


#define WIDTH  1920
#define HEIGHT 1080


#define RUNS 10


using namespace dake::gl;
using namespace dake::math;


int main(void)
{
    SDL_Init(SDL_INIT_VIDEO);

    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 3);
    SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);

    SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
    SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);

    SDL_Window *wnd = SDL_CreateWindow("blurry science", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 64, 64, SDL_WINDOW_OPENGL);
    SDL_GL_CreateContext(wnd);



    framebuffer fbos[2] = {
        framebuffer(1),
        framebuffer(1)
    };

    framebuffer output(1);

#ifdef SIZE_DIV
    fbos[0].resize(WIDTH / SIZE_DIV, HEIGHT / SIZE_DIV);
    fbos[1].resize(WIDTH / SIZE_DIV, HEIGHT / SIZE_DIV);
#else
    fbos[0].resize(WIDTH, HEIGHT);
    fbos[1].resize(WIDTH, HEIGHT);
#endif

    output.resize(WIDTH, HEIGHT);

    texture input("image.png");
    input.tmu() = 1;


    shader vsh(shader::VERTEX, "vert.glsl");

#ifdef PING_PONG
#ifdef PING_PONG_QUALITY
    program blur0_x_prg {shader::frag("step0q_blur_x.glsl")};
    program blur0_y_prg {shader::frag("step0q_blur_y.glsl")};
#else
    program blur0_x_prg {shader::frag("step0_blur_x.glsl")};
    program blur0_y_prg {shader::frag("step0_blur_y.glsl")};
#endif
    program blurn_x_prg {shader::frag("stepn_blur_x.glsl")};
    program blurn_y_prg {shader::frag("stepn_blur_y.glsl")};
#elif defined SIZE_DIV
    program blur_x_prg {shader::frag("div" stringify(SIZE_DIV) "_blur_x.glsl")};
    program blur_y_prg {shader::frag("div" stringify(SIZE_DIV) "_blur_y.glsl")};
#else
    program blur_x_prg {shader::frag("full_blur_x.glsl")};
    program blur_y_prg {shader::frag("full_blur_y.glsl")};
#endif

#ifdef PING_PONG
    blur0_x_prg << vsh;
    blur0_y_prg << vsh;
    blurn_x_prg << vsh;
    blurn_y_prg << vsh;

    blur0_x_prg.bind_attrib("in_pos", 0);
    blur0_y_prg.bind_attrib("in_pos", 0);
    blurn_x_prg.bind_attrib("in_pos", 0);
    blurn_y_prg.bind_attrib("in_pos", 0);

    blur0_x_prg.bind_frag("out_color", 0);
    blur0_y_prg.bind_frag("out_color", 0);
    blurn_x_prg.bind_frag("out_color", 0);
    blurn_y_prg.bind_frag("out_color", 0);

    blur0_x_prg.link();
    blur0_y_prg.link();
    blurn_x_prg.link();
    blurn_y_prg.link();
#else
    blur_x_prg << vsh;
    blur_y_prg << vsh;

    blur_x_prg.bind_attrib("in_pos", 0);
    blur_y_prg.bind_attrib("in_pos", 0);

    blur_x_prg.bind_frag("out_color", 0);
    blur_y_prg.bind_frag("out_color", 0);

    blur_x_prg.link();
    blur_y_prg.link();
#endif

    program pass_prg {shader::frag("pass_frag.glsl")};
    pass_prg << vsh;
    pass_prg.bind_attrib("in_pos", 0);
    pass_prg.bind_frag("out_color", 0);
    pass_prg.link();


    vec2 vertex_data[4] = {
        vec2(1.f, 0.f),
        vec2(1.f, 1.f),
        vec2(0.f, 0.f),
        vec2(0.f, 1.f)
    };

    vertex_array va;
    va.set_elements(4);
    va.attrib(0)->format(2);
    va.attrib(0)->data(vertex_data);


    // Don't count run 0 (therefore, do RUN + 1 runs)
    std::chrono::steady_clock::time_point runs[RUNS + 1];

    for (int i = 0; i <= RUNS; i++) {
        fbos[0][0].filter(GL_NEAREST);
        fbos[1][0].filter(GL_NEAREST);
        input.filter(GL_NEAREST);

#ifdef SIZE_DIV
        glViewport(0, 0, WIDTH / SIZE_DIV, HEIGHT / SIZE_DIV);
#else
        glViewport(0, 0, WIDTH, HEIGHT);
#endif

#ifdef PING_PONG
        int si = 7;
#ifdef SIZE_DIV
        si -= SIZE_DIV_EXP;
#endif

        texture *input_tex = &input;
        for (int i = si; i >= 0; i--) {
            float mag = exp2f(i);

            for (int fbo: {0, 1}) {
                input_tex->bind();
                fbos[fbo].bind();

                program &prg = i == si ? (fbo ? blur0_y_prg : blur0_x_prg)
                                       : (fbo ? blurn_y_prg : blurn_x_prg);
                prg.use();

#ifdef SIZE_DIV
                prg.uniform<float>("res_epsilon") = 1.f / (fbo ? (HEIGHT / SIZE_DIV) : (WIDTH / SIZE_DIV));
                prg.uniform<float>("epsilon")     = mag / (fbo ? (HEIGHT / SIZE_DIV) : (WIDTH / SIZE_DIV));
#else
                prg.uniform<float>("res_epsilon") = 1.f / static_cast<float>(fbo ? HEIGHT : WIDTH);
                prg.uniform<float>("epsilon")     = mag / static_cast<float>(fbo ? HEIGHT : WIDTH);
#endif
                prg.uniform<texture>("tex") = *input_tex;

                va.draw(GL_TRIANGLE_STRIP);

                input_tex = &fbos[fbo][0];
            }
        }

#else // !PING_PONG

        input.bind();
        fbos[0].bind();

        blur_x_prg.use();
#ifdef SIZE_DIV
        blur_x_prg.uniform<float>("epsilon") = 1.f / (WIDTH / SIZE_DIV);
#else
        blur_x_prg.uniform<float>("epsilon") = 1.f / WIDTH;
#endif
        blur_x_prg.uniform<texture>("tex") = input;

        va.draw(GL_TRIANGLE_STRIP);

        fbos[0][0].bind();
        fbos[1].bind();

        blur_y_prg.use();
#ifdef SIZE_DIV
        blur_y_prg.uniform<float>("epsilon") = 1.f / (HEIGHT / SIZE_DIV);
#else
        blur_y_prg.uniform<float>("epsilon") = 1.f / HEIGHT;
#endif
        blur_y_prg.uniform<texture>("tex") = fbos[0][0];

        va.draw(GL_TRIANGLE_STRIP);
#endif // PING_PONG

#ifdef SIZE_DIV
        glViewport(0, 0, WIDTH, HEIGHT);
#endif

        fbos[1][0].bind();
        fbos[1][0].filter(GL_LINEAR);
        output.bind();

        pass_prg.use();
        pass_prg.uniform<texture>("tex") = fbos[1][0];

        va.draw(GL_TRIANGLE_STRIP);

        glFinish();

        runs[i] = std::chrono::steady_clock::now();
    }

    double run_times[RUNS];
    for (int i = 0; i < RUNS; i++) {
        run_times[i] = std::chrono::duration_cast<std::chrono::microseconds>(runs[i + 1] - runs[i]).count();
    }

    double mean = 0.;
    for (int i = 0; i < RUNS; i++) {
        mean += run_times[i] / RUNS;
    }

    double variance = 0.;
    for (int i = 0; i < RUNS; i++) {
        double diff = run_times[i] - mean;
        variance += diff * diff / RUNS;
    }

    printf("%f ±%f\n", mean, sqrt(variance));

    uint8_t *buffer = new uint8_t[WIDTH * HEIGHT * 3];

    output[0].bind();
    glGetTexImage(GL_TEXTURE_2D, 0, GL_RGB, GL_UNSIGNED_BYTE, buffer);

    FILE *fp = fopen("output.ppm", "wb");
    if (!fp) {
        delete[] buffer;
        perror("Failed to open output.ppm");
        return 1;
    }

    fputs("P6\n" stringify(WIDTH) " " stringify(HEIGHT) " 255\n", fp);

    uint8_t *ptr = buffer;
    for (int y = 0; y < HEIGHT; y++) {
        for (int x = 0; x < WIDTH; x++) {
            fputc(*(ptr++), fp);
            fputc(*(ptr++), fp);
            fputc(*(ptr++), fp);
        }
    }

    fclose(fp);

    delete[] buffer;

    return 0;
}
