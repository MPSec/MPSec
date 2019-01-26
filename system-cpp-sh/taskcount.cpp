#include <iostream>
#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int  taskcnt;
    system ("ps -ef | wc -l > /tmp/taskn");

    FILE *file = fopen("/tmp/taskn", "r");
    fscanf(file, "%d", &taskcnt);
    fclose(file);
    system ("rm /tmp/taskn");

//    std::cout << "taskcnt : " << taskcnt << std::endl;
    std::cout << taskcnt << std::endl;

    return 0;
}
