#ifndef DSTRUCT_H
#define DSTRUCT_H

#include <stdio.h>
#include <string.h>
#include <malloc.h>
enum RELATION {NONE, USING_R,HAS_A_R, KIND_OF_R };
enum BOOL {FALSE,TRUE };

typedef struct COLABR {
                 char* className;
                 int relation;
                 struct COLABR *next;
               }COLABR ;

typedef struct  ATTR {
               char *attribute;
               struct ATTR *next;
             } ATTR;

typedef struct RESPONS{
               char *methodName;
               ATTR *attribute;
               struct RESPONS *next;
               }RESPONS;

typedef struct CARD {
               char *className;
               struct RESPONS *responsibility;
               struct COLABR  *colabration;
               struct CARD *next;
               } CARD;

COLABR *getNewColbr();
RESPONS *getNewResp();
CARD *getNewCard();
ATTR *getNewAttr();
void generatePseudoCode(CARD *cardList,FILE* fp);
void displayDataStruct(CARD *cardList);
#endif