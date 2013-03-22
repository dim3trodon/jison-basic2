/* description: Basic grammar that contains a nullable A nonterminal. */

//Modificar para que reconozca id = NUM; id = NUM; id = NUM;

var hash_tokens = {};

%lex
%%

\s+               {/* skip whitespace */}
[a-zA-Z_]\w*      {return 'ID';}
\d		  {return 'NUM';}

/lex

%%

S   : A
           { console.log($$); 
             return [$$, hash_tokens]; } //Esto es retornado por el párser, retorna el número de idenicadores
    ;
A   : /* empty */  
           { 
              console.log("starting");
           }
    | ID '=' NUM ';' { 
              $$ = $3;
              hash_tokens[$1] = $3;
           }
    ;

