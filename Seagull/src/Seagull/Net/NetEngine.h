#pragma once
#include <mono/jit/jit.h>
#include <mono/metadata/assembly.h>

class NetEngine
{
public:
	void Init();
	~NetEngine();

private:
	MonoDomain* rootDomain = nullptr;
	MonoDomain* appDomain = nullptr;

};

