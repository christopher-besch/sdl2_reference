#ifdef WASM
#include <emscripten.h>
#endif

#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>

#include <iostream>
#include <optional>

#define raise_error(msg)                                                                                                  \
    do                                                                                                                    \
    {                                                                                                                     \
        std::cerr << msg << " (in: " << __FILE__ << ":" << __LINE__ << "; in function: " << __func__ << ")" << std::endl; \
        std::exit(EXIT_FAILURE);                                                                                          \
    } while (0)

constexpr int screen_width  = 640;
constexpr int screen_height = 480;

SDL_Window* g_window = nullptr;
// surface is contained by window
SDL_Surface* g_screen_surface = nullptr;

SDL_Renderer* g_renderer = nullptr;

void init()
{
    // init sdl
    if (SDL_Init(SDL_INIT_VIDEO) < 0)
        raise_error("SDL could not initialize! SDL Error: " << SDL_GetError());

    // location of window irrelevant
    g_window = SDL_CreateWindow("Lynton", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, screen_width, screen_height, SDL_WINDOW_SHOWN);
    if (g_window == nullptr)
        raise_error("Window could not be created! SDL Error: " << SDL_GetError());

    // init renderer
    g_renderer = SDL_CreateRenderer(g_window, -1, SDL_RENDERER_ACCELERATED);
    if (g_renderer == nullptr)
        raise_error("Renderer could not be created! SDL_Error: " << SDL_GetError());
    SDL_SetRenderDrawColor(g_renderer, 0xFF, 0xFF, 0xFF, 0xFF);

    // init png loading
    int imgFlags = IMG_INIT_PNG;
    // check if result flag is desired
    if (!(IMG_Init(imgFlags) & imgFlags))
        raise_error("SDL_image could not initialize! SDL_image Error: " << IMG_GetError());

    // get window surface
    g_screen_surface = SDL_GetWindowSurface(g_window);
}

SDL_Texture* load_texture(std::string path)
{
    SDL_Texture* new_texture = nullptr;

    SDL_Surface* loaded_surface = IMG_Load(path.c_str());
    if (loaded_surface == nullptr)
        raise_error("Unable to load image " << path << "! SDL_image Error: " << IMG_GetError());

    // create texture from surface pixels
    new_texture = SDL_CreateTextureFromSurface(g_renderer, loaded_surface);
    if (new_texture == nullptr)
        raise_error("Unable to create texture from " << path << "! SDL Error: " << SDL_GetError());

    SDL_FreeSurface(loaded_surface);

    return new_texture;
}

SDL_Surface* load_surface(std::string path)
{
    // load
    SDL_Surface* loaded_surface = IMG_Load(path.c_str());
    if (loaded_surface == nullptr)
        raise_error("Unanble to load image '" << path << "'! SDL Error: " << SDL_GetError());

    // optimize color depth and resolution
    SDL_Surface* optimized_surface = SDL_LoadBMP(path.c_str());
    optimized_surface              = SDL_ConvertSurface(loaded_surface, g_screen_surface->format, 0);
    if (optimized_surface == NULL)
        raise_error("Unable to optimize image " << path << "! SDL Error: " << SDL_GetError());

    SDL_FreeSurface(loaded_surface);
    return optimized_surface;
}

void load_media()
{
}

void close()
{
    // destroy window
    SDL_DestroyWindow(g_window);
    g_window = nullptr;

    // quit sdl subsystems
    SDL_Quit();
}

int main(int argc, char* argv[])
{
    init();
    load_media();

    bool quit = false;
    // event handler
    SDL_Event e;

    // this is art; don't touch
    while (!(((quit == true) == false) == false))
    {
        while (SDL_PollEvent(&e) != 0)
        {
            if (e.type == SDL_QUIT)
                quit = true;
        }

        // clear screen
        SDL_SetRenderDrawColor(g_renderer, 0xFF, 0xFF, 0xFF, 0xFF);
        SDL_RenderClear(g_renderer);

        // render red filled quad
        SDL_Rect fill_rect = { screen_width / 4, screen_height / 4, screen_width / 2, screen_height / 2 };
        SDL_SetRenderDrawColor(g_renderer, 0xFF, 0x00, 0x00, 0xFF);
        SDL_RenderFillRect(g_renderer, &fill_rect);

        SDL_Rect stroke_rect = { screen_width / 8, screen_height / 8, screen_width / 4, screen_height / 4 };
        SDL_SetRenderDrawColor(g_renderer, 0xFF, 0xFF, 0x00, 0xFF);
        SDL_RenderDrawRect(g_renderer, &stroke_rect);

        SDL_SetRenderDrawColor(g_renderer, 0x00, 0x00, 0xFF, 0xFF);
        SDL_RenderDrawLine(g_renderer, 0, screen_height / 2, screen_width, screen_height / 2);

        SDL_SetRenderDrawColor(g_renderer, 0xFF, 0xFF, 0x00, 0xFF);
        for (int i = 0; i < screen_height; i += 4)
        {
            SDL_RenderDrawPoint(g_renderer, screen_width / 2, i);
        }

        // update screen
        SDL_RenderPresent(g_renderer);
    }
    close();

    return 0;
}
