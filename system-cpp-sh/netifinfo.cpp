#include <sys/types.h>
#include <ifaddrs.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <linux/sockios.h>
#include <net/if.h>
#include <sys/ioctl.h>
#include <ctype.h>

typedef struct {
    int ifindex;
    char ifname[20];
    char sectiontype[16];
    char hwaddr[30];
    char inetaddr[16];
    char netmask[16];
    char mediatype[10];
    int  linkspeed;
    char operstatus[16];
} interfaceinfo;

int main(void){
    struct ifaddrs *addrs,*tmp;
    int ifcnt = 0;
    int i;
    char path[50];
    FILE *file;
    interfaceinfo *allif, *tmp2;
    struct sockaddr_in *sa;
    char addr[10];

    getifaddrs(&addrs);
    tmp = addrs;

    while (tmp)
    {
            if (tmp->ifa_addr && tmp->ifa_addr->sa_family == AF_PACKET &&
                strcmp(tmp->ifa_name, "lo")) {
                ifcnt++;
            }
            tmp = tmp->ifa_next;
    }

    allif = (interfaceinfo *)malloc(ifcnt*sizeof(interfaceinfo));
    tmp = addrs;
    tmp2 = allif;
    while (tmp)
    {
            if (tmp->ifa_addr && tmp->ifa_addr->sa_family == AF_PACKET&&
                strcmp(tmp->ifa_name, "lo")) {
                sprintf(path,"/sys/class/net/%s/ifindex", tmp->ifa_name);
                file = fopen(path, "r");
                fscanf(file, "%d", (int *)&tmp2->ifindex);
                fclose(file);

                strcpy(tmp2->ifname, tmp->ifa_name);
                strcpy(tmp2->sectiontype, "NETWORK");
                strcpy(tmp2->mediatype, "ETHERNET");
                strcpy(tmp2->inetaddr, "");
                strcpy(tmp2->netmask, "");

                sprintf(path,"/sys/class/net/%s/address", tmp->ifa_name);
                file = fopen(path, "r");
                fscanf(file, "%s", tmp2->hwaddr);
                fclose(file);

                sprintf(path,"/sys/class/net/%s/operstate", tmp->ifa_name);
                file = fopen(path, "r");
                fscanf(file, "%s", tmp2->operstatus);
                fclose(file);

                sprintf(path,"/sys/class/net/%s/speed", tmp->ifa_name);
                file = fopen(path, "r");
                fscanf(file, "%d", (int *)&tmp2->linkspeed);
                fclose(file);

                tmp2++;
            }
            tmp = tmp->ifa_next;
    }

    tmp = addrs;
    while (tmp)
    {
            if (tmp->ifa_addr && tmp->ifa_addr->sa_family == AF_INET&&
                strcmp(tmp->ifa_name, "lo")) {
                // get inetaddr * netmaek
                tmp2 = allif;
                for (i=0; i<ifcnt; i++) {
                  if (strcmp(tmp2->ifname, tmp->ifa_name)) {
                    tmp2++;
                    continue;
                  }
                  else {
                      sa = (struct sockaddr_in *) tmp->ifa_addr;
                      strcpy(tmp2->inetaddr, inet_ntoa(sa->sin_addr));
                      sa = (struct sockaddr_in *) tmp->ifa_netmask;
                      strcpy(tmp2->netmask, inet_ntoa(sa->sin_addr));
                      break;
                  }
                }
            }
            tmp = tmp->ifa_next;
    }

    freeifaddrs(addrs);

    tmp2 = allif;
		/*
    for (i=0; i<ifcnt; i++) {
      printf("%d %7s %s %s %15s %15s %s %d %s\n",tmp2->ifindex,tmp2->ifname,
      tmp2->sectiontype, tmp2->hwaddr, tmp2->inetaddr, tmp2->netmask,
      tmp2->mediatype, tmp2->linkspeed, tmp2->operstatus);
      tmp2++;
		*/
    for (i=0; i<ifcnt; i++) {
      printf("%d$$$%s$$$%s$$$%s$$$%s$$$%d$$$%s***",
				tmp2->ifindex,tmp2->ifname,
        tmp2->hwaddr, tmp2->inetaddr, tmp2->netmask,
        tmp2->linkspeed, tmp2->operstatus);
        tmp2++;
		printf("\n");
    }
		printf("\n");

    free(allif);


    return 0;
}
