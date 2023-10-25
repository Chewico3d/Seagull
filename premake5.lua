workspace "Seagull"
	configurations {"Debug", "Release" }
	architecture "x64"


outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
project "Seagull"
	kind "ConsoleApp"
	language "C++"
	location "Seagull"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {"**.cpp", "**.h"}

	includedirs {
		"%{prj.name}/src"
	}

	filter { "configurations:Debug" }
		defines { "DEBUG" }
		symbols "On"
	
	filter { "configurations:Release" }
		defines { "NDEBUG" }
		optimize "On"
		
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines{
			"SEAGULL_PLATFORM_WINDOWS"
		}

project "UserApp"
	kind "SharedLib"
	language "C#"
	location "UserApp"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files {"**.cs"}

	filter { "configurations:Debug" }
		defines { "DEBUG" }
		symbols "On"
	
	filter { "configurations:Release" }
		defines { "NDEBUG" }
		optimize "On"