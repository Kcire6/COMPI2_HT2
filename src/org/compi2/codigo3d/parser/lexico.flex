package org.compi2.codigo3d.parser;

import java_cup.runtime.Symbol;

//Scanner para generar C3D
%%
%{
    //Código de usuario
    

%}

%cup
%class scanner
%public
%line
%char
%column
%full
//Aritmeticos
MAS		= "+"
MENOS		= "-"
MULT       	= "*"
DIV             = "/"
POT             = "^"
PAR_IZQ         = "("
PAR_DER         = ")"
//Relacionales
IGUAL           = "=="
DIF             = "!="
MAYOR           = ">"
MENOR           = "<"
MAYIG           = ">="
MENIG           = "<="
//Logicos
AND             = "&&"
OR              = "||"
NOT             = "!"
//Tipo de dato
ID              = [A-Za-z][_0-9A-Za-z]*
ENTERO          = [0-9]+
DECIMAL         = [0-9]+"."[0-9]+

SPACE   = [\ \r\t\f\t]
ENTER   = [\ \n]

%%
//TIPOS
<YYINITIAL> {ID}            { return new Symbol(sym.ID, yyline, yycolumn, yytext()); }
<YYINITIAL> {ENTERO}        { return new Symbol(sym.ENTERO, yyline, yycolumn, yytext()); }
<YYINITIAL> {DECIMAL}       { return new Symbol(sym.DECIMAL, yyline, yycolumn, yytext()); }
//ARITMETICOS
<YYINITIAL> {MAS}           { return new Symbol(sym.MAS, yyline, yycolumn, null); }
<YYINITIAL> {MENOS}	    { return new Symbol(sym.MENOS, yyline, yycolumn, null); }
<YYINITIAL> {MULT}          { return new Symbol(sym.MULT, yyline, yycolumn, null); }
<YYINITIAL> {DIV}	    { return new Symbol(sym.DIV, yyline, yycolumn, null); }
<YYINITIAL> {POT}	    { return new Symbol(sym.POT, yyline, yycolumn, null); }
<YYINITIAL> {PAR_IZQ}	    { return new Symbol(sym.PAR_IZQ, yyline, yycolumn, null); }
<YYINITIAL> {PAR_DER}	    { return new Symbol(sym.PAR_DER, yyline, yycolumn, null); }
//RELACIONALES
<YYINITIAL> {IGUAL}	    { return new Symbol(sym.IGUAL, yyline, yycolumn, null); }
<YYINITIAL> {DIF}	    { return new Symbol(sym.DIF, yyline, yycolumn, null); }
<YYINITIAL> {MAYOR}	    { return new Symbol(sym.MAYOR, yyline, yycolumn, null); }
<YYINITIAL> {MENOR}	    { return new Symbol(sym.MENOR, yyline, yycolumn, null); }
<YYINITIAL> {MAYIG}	    { return new Symbol(sym.MAYIG, yyline, yycolumn, null); }
<YYINITIAL> {MENIG}	    { return new Symbol(sym.MENIG, yyline, yycolumn, null); }
//LOGICOS
<YYINITIAL> {AND}	    { return new Symbol(sym.AND, yyline, yycolumn, null); }
<YYINITIAL> {OR}	    { return new Symbol(sym.OR, yyline, yycolumn, null); }
<YYINITIAL> {NOT}	    { return new Symbol(sym.NOT, yyline, yycolumn, null); }

<YYINITIAL> {SPACE}     { /*Espacios en blanco, ignorados*/ }
<YYINITIAL> {ENTER}     { /*Saltos de linea, ignorados*/}

<YYINITIAL>. {
        String errLex = "Error léxico, caracter irreconocible: '"+yytext()+"' en la línea: "+(yyline+1)+" y columna: "+yycolumn;
        System.err.println(errLex);
}