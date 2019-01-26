#include <unistd.h>
#include <fstream>
#include <iostream>
#include <string>

int main(void)
{
    int  memtotal, memfree;
    float memusage;
    FILE *meminfo = fopen("/proc/meminfo", "r");

    char line[256];
    for (int i=0; i<2; i++) {
      fgets(line, sizeof(line), meminfo);
      sscanf(line, "MemTotal: %d kB", &memtotal);
      sscanf(line, "MemFree: %d kB", &memfree);
    }
    fclose(meminfo);

    memusage = ((memtotal - memfree) * 100) / memtotal;

//    std::cout << "memtotal : " << memtotal << "Kb" << std::endl;
//    std::cout << "memfree : " << memfree << "Kb" << std::endl;
//    std::cout << "memusage : " << memusage << "%" << std::endl;
    std::cout << memusage << std::endl;

    return 0;
}
