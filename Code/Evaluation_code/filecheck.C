#include <unistd.h>
#include <string>

inline bool filecheck(const std::string &name){
	struct stat buffer;
	return (stat(name.c_str(), &buffer)==0);
}
