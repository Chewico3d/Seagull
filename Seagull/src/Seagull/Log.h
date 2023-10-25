#pragma once
#include <memory>
#include "spdlog/spdlog.h"
#include "spdlog/sinks/stdout_color_sinks.h"

namespace Seagull {
	class Log
	{
	public: 
		static void Init();

		static inline std::shared_ptr<spdlog::logger>& GetSeagullLogger() { return s_SeagullLogger; }
		static inline std::shared_ptr<spdlog::logger>& GetAppLogger() { return s_AppLogger; }

	private:
		static std::shared_ptr<spdlog::logger> s_SeagullLogger;
		static std::shared_ptr<spdlog::logger> s_AppLogger;

	};

}

#define SEAGULL_INFO(msg)		::Seagull::Log::GetSeagullLogger()->info(msg) 
#define SEAGULL_WARN(msg)		::Seagull::Log::GetSeagullLogger()->warn(msg) 
#define SEAGULL_ERROR(msg)		::Seagull::Log::GetSeagullLogger()->error(msg) 
#define SEAGULL_CRITICAL(msg)	::Seagull::Log::GetSeagullLogger()->critical(msg) 

#define APP_INFO(msg)		::Seagull::Log::GetAppLogger()->info(msg) 
#define APP_WARN(msg)		::Seagull::Log::GetAppLogger()->warn(msg) 
#define APP_ERROR(msg)		::Seagull::Log::GetAppLogger()->error(msg) 
#define APP_CRITICAL(msg)	::Seagull::Log::GetAppLogger()->critical(msg) 