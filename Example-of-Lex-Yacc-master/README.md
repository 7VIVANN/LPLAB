"# Example-of-Lex-Yacc" 
This is a  simple example that demonstrate writting of a parser. In this example an input file describing a CRC card description in text format is taken as input and corresponding pseudo C++ code is generated. The input file is in a format:
     CRC
        CLASS <class name>
           RESPONSIBILITY
              <method name >  INT <attribute> 
                              CHAR <attribute>
                              INT* <attribute>
                              CHAR* <attribute>
           END
               COLABRATION  
                     <RELATION>  CLASS    <class name>
               END
      END

e.g
       CRC
               CLASS  myclass
               RESPONSIBILITY
                       assign  INT number
               END
               RESPONSIBILITY
                       assign CHAR* name
               END
               COLABRATION
                        USING  CLASS yourclass
               END
       END

The output of this translator is as follows:
      //  Class Name: myclass
      //  Function:
      //        assign int number
      //   Function:
      //        assign char *name
      //    Class Relations :
      //    This Class USES class yourclass
      //    
     Class myclass  {
              public :
                    assign(int number);
                    assign(char *name);
               protected:
               private:
       };