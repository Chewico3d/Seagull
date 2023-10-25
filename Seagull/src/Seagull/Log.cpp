#include "Log.h"

namespace Seagull {

	std::shared_ptr<spdlog::logger> Log::s_AppLogger;
	std::shared_ptr<spdlog::logger> Log::s_SeagullLogger;

	void Log::Init()
	{
		spdlog::set_pattern("%^[%T] %n: %v%$");

		s_SeagullLogger = spdlog::stdout_color_mt("Seagull");
		s_SeagullLogger->set_level(spdlog::level::trace);

		s_AppLogger = spdlog::stdout_color_mt("App");
		s_AppLogger->set_level(spdlog::level::trace);

	}
}

