project "02_geometry"
    language "C++"
    cppdialect "c++17"
    kind "ConsoleApp"

    warnings "Extra"

    -- like in #include
    pchheader "pch.h"
    -- relative path
    pchsource "src/pch.cpp"

    location ""
    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/**.h",
        "src/**.cpp"
    }

    includedirs {
        "src",
        "%{wks.location}/utils/src"
    }

    filter "platforms:WASM"
        linkoptions { "-s WASM=1", "-s EXPORTED_FUNCTIONS='[\"_main\"]'", "-s EXPORTED_RUNTIME_METHODS='[\"cwrap\"]'", "-s USE_SDL=2" }
        targetname ("%{prj.name}.html")
    filter "platforms:Linux"
        -- I hate everything!
        buildoptions { "`sdl2-config --cflags`" }
        linkoptions { "`sdl2-config --libs`" }
        links {
            "SDL2main",
            "SDL2_image",
            "SDL2_ttf",
            "SDL2_mixer",
        }
        targetname ("%{prj.name}")
    -- not supported
    filter "platforms:Windows"
        targetname ("%{prj.name}.exe")
    filter {}
