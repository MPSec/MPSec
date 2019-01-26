#include <unistd.h>
#include <fstream>
#include <iostream>
#include <string>
#include <thread>

int main()
{
    FILE* file;
    float  cpuload;
    float  m1, m5, m15;
    int    core;

    file = fopen("/proc/loadavg", "r");
    fscanf(file, "%f %f %f", &m1, &m5, &m15);
    fclose(file);

//    std::cout << "load average : " << m15  << std::endl;

    core = std::thread::hardware_concurrency();
    m15 *= 100;
    cpuload = m15/core;

//    std::cout << "core : " << core << std::endl;
//    std::cout << "cpuload : " << cpuload << "%" << std::endl;
    std::cout << cpuload << std::endl;

    return 0;
 }
