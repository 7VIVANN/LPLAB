#include <QtCore>
#include <stdio.h>
#include <qfile.h>
#include <QByteArray>
#include <QTextCodec>

#include "lexer.h"

extern FILE *yyin;

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    yyin = fopen("00.txt", "r");

    yylex();

    fclose(yyin);

    return app.exec();
}



