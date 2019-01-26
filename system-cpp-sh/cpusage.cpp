#include <unistd.h>
#include <fstream>
#include <iostream>
#include <string>

static unsigned long long lastUser, lastNice, lastSys, lastIdle;

void init(){
    FILE* file = fopen("/proc/stat", "r");
    fscanf(file, "cpu %llu %llu %llu %llu", &lastUser, &lastNice,
        &lastSys, &lastIdle);
    fclose(file);
}


float getCurrentValue(){
    float percent;
    FILE* file;
    unsigned long long curUser, curNice, curSys, curIdle, total;


    file = fopen("/proc/stat", "r");
    fscanf(file, "cpu %llu %llu %llu %llu", &curUser, &curNice,
        &curSys, &curIdle);
    fclose(file);


    if (curUser < lastUser || curNice < lastNice ||
        curSys < lastSys || curIdle < lastIdle){
        //overflow detection
        percent = 0;
    }
    else{
        total = (curUser - lastUser) + (curNice - lastNice) +
            (curSys - lastSys);
        percent = total;
        total += (curIdle - lastIdle);
        percent /= total;
        percent *= 100;
    }

    lastUser = curUser;
    lastNice = curNice;
    lastSys = curSys;
    lastIdle = curIdle;

    return percent;
}

int main()
{
    float  cpuusage;

    init();
    for (int i=0; i<1; i++){
      sleep(1);
      cpuusage = getCurrentValue();
      if (cpuusage)
//				  std::cout << cpuusage << "%" << std::endl;
          std::cout << cpuusage << std::endl;
    }

    return 0;
 }
