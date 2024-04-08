workspace "Engine"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

--IncludeDir = {}
--IncludeDir["GLFW"] = "Engine/vendor/GLFW/include"
--IncludeDir["Glad"] = "Engine/vendor/Glad/include"
--IncludeDir["ImGui"] = "Engine/vendor/ImGui"

--include "Engine/vendor/GLFW"
--include "Engine/vendor/Glad"
--include "Engine/vendor/ImGui"

project "Engine"
	location "Engine"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	--pchheader "cypch.h"
	--pchsource "Engine/src/cypch.cpp"

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/src",
		--"%{prj.name}/vendor/spdlog/include",
		--"%{IncludeDir.GLFW}",
		--"%{IncludeDir.Glad}",
		--"%{IncludeDir.ImGui}"
	}

	links
	{
		--"GLFW",
		--"Glad",
		--"ImGui",
		--"opengl32.lib"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"


	filter "configurations:Debug"
		symbols "On"

	filter "configurations:Release"
		optimize "On"

	filter "configurations:Dist"
		optimize "On"


	