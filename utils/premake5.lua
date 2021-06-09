-- outputdir need to be defined, like:
-- outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "utils"
    language "C++"
    architecture "x86_64"
    cppdialect "C++17"
    kind "StaticLib"

    warnings "Default"

    location ""
    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
    objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "src/**.h",
        "src/**.cpp"
    }

    filter "platforms:WASM"
        linkoptions { "-s WASM=1", "-s EXPORTED_RUNTIME_METHODS='[\"cwrap\"]'" }
        targetname ("%{prj.name}.html")

    filter "platforms:Linux"
        targetname ("%{prj.name}")

