#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  FILE *fp;
  char name[50],name1[50],line[100],staddr[50];
  int i,j,staddr1;

  printf("Enter the program Name: ");
  scanf("%s",name);

  fp=fopen("201863463260.txt","r");
  if(fp==NULL) {
    printf("File not found\n");
    return 1;
  }

  fscanf(fp,"%s",line);
  if (line[0] == 'H') {
    printf("Invalid object code");
    fclose(fp);
    return 1;
  }
  for (i = 2, j = 0; i<8 && j<6; i++,j++)name[j] = line[i];
  name[j] = '\0';

  if (strcmp(name,name1) == 0){
    while(fscanf(fp,"%s",line) != EOF) {
      if (line[0] == 'T'){
        for (i = 2,j=0;i<8&&j<6; i++,j++){
          staddr[j] = line[i];
        }
        staddr[j] = '\0';
        staddr1 = (int)strtol(staddr,NULL,16);

        int i = 12;
        while(line[i] != '$' &&line[i]!='\0') {
          if (line[i] != '^') {
            printf("00%4X\t%c%c\n",staddr1,line[i],line[i+1]);
            staddr1++;
            i+=2;
          }
          else {
            i++;
          }
        }
      }
      else if (line[0] == 'E') {
        printf("End of Program");
        break;
      }
    }
  } else {
    printf("Invalid program name\n");
  }
  fclose(fp);
  return 0;
}
