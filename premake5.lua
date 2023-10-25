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

	files {"%{prj.name}/src/**.cpp", "%{prj.name}/src/**.h"}

	includedirs {
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{prj.name}/vendor/mono/include"
	}
	
	libdirs {
		"%{prj.name}/vendor/mono/lib/%{cfg.buildcfg}"
	}
	
	postbuildcommands {
        "{COPYDIR} %{prj.location }\\vendor\\mono\\bin\\%{cfg.buildcfg}\\*.dll %{cfg.buildtarget.directory}\\*.dll",
		"{COPYDIR} %{prj.location }\\vendor\\mono\\mono-lib %{cfg.buildtarget.directory}\\mono-lib"
    }
	
	links {
		"eglib.lib",
		"libgcmonosgen.lib",
		"libmini-sgen.lib",
		"libmonoruntime-sgen.lib",
		"libmono-static-sgen.lib",
		"libmonoutils.lib",
		"mono-2.0-sgen.lib",
		"MonoPosixHelper.lib"
	}
	
	dependson { "UserApp" }

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

	files {"%{prj.name}/**.cs"}
	
	postbuildcommands {
        "{COPYDIR} %{cfg.buildtarget.directory}\\*.dll %{cfg.buildtarget.directory}\\..\\Seagull\\*.dll"
    }

	filter { "configurations:Debug" }
		defines { "DEBUG" }
		symbols "On"
	
	filter { "configurations:Release" }
		defines { "NDEBUG" }
		optimize "On"