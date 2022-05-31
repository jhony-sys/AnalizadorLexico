package SoloLexico;
import static SoloLexico.Tokens.*;
%%
%class Lexico
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t \r]+
%{
    public String lexemas;
%}
%%

/* Marcador break*/
( "break" ) {lexemas=yytext(); return Break;}

/* Tipo de dato String */
( String ) {lexemas=yytext(); return Cadena;}

/* Marcador de casos*/
( "case" ) {lexemas=yytext(); return Case;}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {lexemas=yytext(); return Comillas;}

/* Marcador de constante*/
( "const" ) {lexemas=yytext(); return Const;}

/* Marcador continue*/
( "continue" ) {lexemas=yytext(); return Continue;}

/* Corchete de apertura */
( "[" ) {lexemas=yytext(); return Corchete_a;}

/* Corchete de cierre */
( "]" ) {lexemas=yytext(); return Corchete_c;}

/* Marcador por defecto*/
( "default" ) {lexemas=yytext(); return Default;}

/* Marcador define*/
( "define" ) {lexemas=yytext(); return Define;}

/* Operador Division*/
( "/" ) {lexemas=yytext(); return Division;}

/* Marcador Do*/
( "do" ) {lexemas=yytext(); return Do;}

/* Double */
(double) {lexemas=yytext(); return Doble;}

/* Marcador Else*/
( "else" ) {lexemas=yytext(); return Else;}

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Ciclo repetitivo for */
( "for" ) {lexemas=yytext(); return For;}

/* Condicional if */
( "if" ) {lexemas=yytext(); return If;}

/* Operador Igual */
( "=" ) {lexemas=yytext(); return Igual;}

/* Integer */
(int) {lexemas=yytext(); return Int;}

/* Marcador include */
( "include" ) {lexemas=yytext(); return Include;}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Llave de apertura */
( "{" ) {lexemas=yytext(); return Llave_a;}

/* Llave de cierre */
( "}" ) {lexemas=yytext(); return Llave_c;}

/* Marcador de inicio de algoritmo */
( "main" ) {lexemas=yytext(); return Main;}

/* Operador Multiplicación */
( "*" ) {lexemas=yytext(); return Multiplicacion;}

/* Numeral # */
( "#" ) {lexemas=yytext(); return Numeral;}

/* Parentesis de apertura */
( "(" ) {lexemas=yytext(); return Parent_a;}

/* Parentesis de cierre */
( ")" ) {lexemas=yytext(); return Parent_c;}

/* P_coma */
( ";" ) {lexemas=yytext(); return P_coma;}

/* punto */
( "." ) {lexemas=yytext(); return Punto;}

/* coma */
( "," ) {lexemas=yytext(); return Coma;}

/* Operador Resta */
( "-" ) {lexemas=yytext(); return Resta;}

/* Return */
( "return" ) {lexemas=yytext(); return Return;}

/* Operador Suma */
( "+" ) {lexemas=yytext(); return Suma;}

/* Identificador */
{L}({L}|{D})* {lexemas=yytext(); return Identificador;}

/* Numero */
/*("-("{D}+")") | ("-("{D}+.{D}+")") | -({D})+ | {D}+ | {D}+.{D}+ | -{D}+.{D}+ {lexemas=yytext(); return Numero;}*/

/* Error de analisis */
 . {return ERROR;}
