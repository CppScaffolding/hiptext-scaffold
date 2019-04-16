-- scaffold geniefile for hiptext

hiptext_script = path.getabsolute(path.getdirectory(_SCRIPT))
hiptext_root = path.join(hiptext_script, "hiptext")

hiptext_includedirs = {
	path.join(hiptext_script, "config"),
	hiptext_root,
}

hiptext_libdirs = {}
hiptext_links = {}
hiptext_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { hiptext_includedirs }
	end,

	_add_defines = function()
		defines { hiptext_defines }
	end,

	_add_libdirs = function()
		libdirs { hiptext_libdirs }
	end,

	_add_external_links = function()
		links { hiptext_links }
	end,

	_add_self_links = function()
		links { "hiptext" }
	end,

	_create_projects = function()

project "hiptext"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		hiptext_includedirs,
	}

	defines {}

	files {
		path.join(hiptext_script, "config", "**.h"),
		path.join(hiptext_root, "**.h"),
		path.join(hiptext_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
