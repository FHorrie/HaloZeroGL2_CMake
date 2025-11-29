function(load_libs)

    set(FETCHCONTENT_QUIET OFF)

    include(FetchContent)

    #message(STATUS "Downloading " glm...)
    #FetchContent_Declare(
    #    glm
    #    GIT_REPOSITORY https://github.com/g-truc/glm
    #    GIT_TAG 1.0.1
    #    GIT_SHALLOW TRUE)
    #FetchContent_MakeAvailable(glm)
    #
    #message(STATUS "Downloading " fmt...)
    #FetchContent_Declare(
    #    fmt
    #    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    #    GIT_TAG 10.2.1
    #    GIT_SHALLOW TRUE)
    #FetchContent_MakeAvailable(fmt)
    
    set(SDL_STATIC OFF)

    message(STATUS "Downloading " sdl2...)
    FetchContent_Declare(
        sdl2
        GIT_REPOSITORY https://github.com/libsdl-org/SDL
        GIT_TAG release-2.30.2
        GIT_SHALLOW TRUE
        OVERRIDE_FIND_PACKAGE TRUE
    )

    # MSVC has no package manager, requires building packages
    set(SDL2TTF_VENDORED ON)

    message(STATUS "Downloading " sdl2_ttf...)
    FetchContent_Declare(
        sdl2_ttf
        GIT_REPOSITORY https://github.com/libsdl-org/SDL_ttf
        GIT_TAG release-2.22.0
        GIT_SHALLOW TRUE
        OVERRIDE_FIND_PACKAGE TRUE
    )


    set(SDL2IMAGE_BMP ON)
    set(SDL2IMAGE_GIF OFF)
    set(SDL2IMAGE_JPG ON)
    set(SDL2IMAGE_PNG ON)

    set(SDL2IMAGE_VENDORED ON)
    
    message(STATUS "Downloading " sdl2_image...)
    FetchContent_Declare(
        sdl2_image
        GIT_REPOSITORY https://github.com/libsdl-org/SDL_image
        GIT_TAG release-2.8.2
        GIT_SHALLOW TRUE
        OVERRIDE_FIND_PACKAGE TRUE
    )

    #set(SDL2MIXER_MP3 ON)
    #
    #set(SDL2MIXER_VENDORED ON)
    #
    #message(STATUS "Downloading " sdl2_mixer...)
    #FetchContent_Declare(
    #    sdl2_mixer
    #    GIT_REPOSITORY https://github.com/libsdl-org/SDL_mixer
    #    GIT_TAG release-2.6.3
    #    GIT_SHALLOW TRUE
    #    OVERRIDE_FIND_PACKAGE TRUE
    #)

    FetchContent_MakeAvailable(sdl2 sdl2_ttf sdl2_image)

endfunction()