/*! \file lexer.g
* \author Ingemar Axelsson
*
* Lexer that recognizes all tokens in a notebookfile. The lexer has a
* lookahead of 3. This is mostly because of the comments. But it is 
* fast enough. Note that everything inside a notebookfile that is 
* between (* and *) are comments. Even the cache is comments. Therefore 
* most of the notebookfile does not need to be read.
*
* 
* Entering characters in Mathematica
*
* -directly (All ASCII 7 Characters)
* -fullname ex. \[Alpha]
* -alias ??
* -character code ex. \053
*
*
* Character strings
* - "characters"
* - \" - a literal " in a string
* - \\ - a literal \ in a string
* - \< ... \> - a substring in which newlines are interpreted literally
* - \!\( ... \) - a substring representing two-dimensional boxes
*
* SYMBOLS
* Can contain digits, but can not start with digits.
* - name   - symbol name
* - `name  - symbol name in current context
* - context`name - symbol name in specified context
*
* NUMBERS
* - digits                  integer
* - digits.digits           approximate number
* - base^^digits            integer in specified base
* - base^^digits.digits     approx. in specified base
* - mantissa *^ n           sci.not (mantissa * 10^n)
* - base^^mantissa *^ n     (mantissa * base^n) base == 2..36
* - number`                 Machine precision approx, number
* - number`s                arbitrary precision number with precision s
* - number``s               arbitrary precision number with accuracy s
*
* BRACKETS
*
* - (* ... *)         Comments
* - { ... }           list
* - < ... >           AngleBracket
* - | ... |           BracketingBar
* - || ... ||         DoubleBracketingBar
* - \( input \)       Input or grouping of boxes.
*
*/

options
{
language="Cpp";     //Generate C++ languages.
genHashLines=false; //Do not generate hashlines.
}

class AntlrNotebookLexer extends Lexer;
options
{
  k= 3;
  charVocabulary='\u0000'..'\u007F'; //Allow ascii
  exportVocab=notebookgrammar;
  defaultErrorHandler = true;
}
tokens
{
    MODULENAME      = "FrontEnd";
    LIST            = "List";
    NOTEBOOK        = "Notebook";
    CELL            = "Cell"; 
    TEXTDATA        = "TextData";
    CELLGROUPDATA   = "CellGroupData";
        
    RULE            = "Rule";
    RULEDELAYED     = "RuleDelayed";

    GRAYLEVEL       = "GrayLevel";
    RGBCOLOR        = "RGBColor";
    FILENAME        = "FileName";
    
    STYLEBOX        = "StyleBox";
    BOXDATA         = "BoxData";
    BUTTONBOX       = "ButtonBox";
    FORMBOX         = "FormBox"; 
    ROWBOX          = "RowBox";
    GRIDBOX         = "GridBox";
    SUPERSCRBOX     = "SuperscriptBox";
    SUBSCRBOX       = "SubscriptBox";    
    SUBSUPERSCRIPTBOX = "SubsuperscriptBox";
    UNDERSCRIPTBOX  = "UnderscriptBox";
    OVERSCRIPTBOX   = "OverscriptBox";
    UNDEROVERSCRIPTBOX = "UnderoverscriptBox";
    FRACTIONBOX     = "FractionBox";
    SQRTBOX         = "SqrtBox";
    RADICALBOX      = "RadicalBox";

//ATTRIBUTE
    FONTSLANT       = "FontSlant";
    FONTSIZE        = "FontSize";
    FONTCOLOR       = "FontColor";
    FONTWEIGHT      = "FontWeight";
    FONTFAMILY      = "FontFamily";
    FONTVARIATIONS  = "FontVariations";
    TEXTALIGNMENT   = "TextAlignment";
    TEXTJUSTIFICATION = "TextJustification";
    INITIALIZATIONCELL = "InitializationCell";
    BUTTONDATA      = "ButtonData";
    BUTTONSTYLE     = "ButtonStyle";
    CHARACHTERENCODING = "CharacterEncoding";
    SCREENRECTANGLE = "ScreenRectangle";
    AUTOGENERATEDPACKAGE = "AutoGeneratedPackage";      

//CELLOPTIONS
    CELLTAGS        = "CellTags";
    CELLFRAME       = "CellFrame";
    EDITABLE        = "Editable";
    BACKGROUNT      = "Background";

//NOTEBOOKOPTIONS
    WINDOWSIZE      = "WindowSize";
    WINDOWMARGINS   = "WindowMargins";
    WINDOWFRAME     = "WindowFrame";
    WINDOWELEMENTS  = "WindowElements";
    WINDOWTITLE     = "WindowTitle";
    WINDOWTOOLBARS  = "WindowToolbars";
    WINDOWMOVEABLE  = "WindowMoveable";
    WINDOWFLOATING  = "WindowFloating";
    WINDOWCLICKSELECT = "WindowClickSelect";
    STYLEDEFINITIONS = "StyleDefinitions";
    FRONTENDVERSION = "FrontEndVersion";
  
//ANNAT
    CELLGROUPOPEN   = "Open";
    CELLGROUPCLOSED = "Closed";
    VALUERIGHT      = "Right";
    VALUELEFT       = "Left"; 
    TRUE_           = "True";
    FALSE_          = "False";
    AUTOMATIC       = "Automatic";
    TRADITIONALFORM = "TraditionalForm";
    STANDARDFORM    = "StandardForm";
    INPUTFORM       = "InputForm";
    OUTPUTFORM      = "OutputForm";
    NULLSYM         = "Null";
    NONESYM         = "None";

    GRAPHICSDATA    = "GraphicsData";
    IMAGESIZE       = "ImageSize";
    IMAGEMARGINS    = "ImageMargins";
    IMAGEREGION     = "ImageRegion";
    IMAGERANGECACHE = "ImageRangeCache";
    IMAGECACHE      = "ImageCache";
    GENERATECELL    = "GenerateCell";
    CELLAUTOOVRT    = "CellAutoOverwrite";
    MAGNIFICATION   = "Magnification";
    PARENTDIRECTORY = "ParentDirectory";
    

    //Old tokens? Needed.
//     LISTBODY;
//     SEXPR;
//     EXPRESSIONS;
//     EXPRESSION;
//     ATTRIBUTE;
//     VALUE;
//     STRING;
}

RBRACK      : ']';
LBRACK      : '[';
RCURLY      : '}';
LCURLY      : '{';
COMMA       : ',';
THICK       : '`';

COMMENTSTART    : "(*";
COMMENTEND      : "*)";

/*
* NUMBERS
* - digits                  integer
* - digits.digits           approximate number
* - base^^digits            integer in specified base
* - base^^digits.digits     approx. in specified base
* - mantissa *^ n           sci.not (mantissa * 10^n)
* - base^^mantissa *^ n     (mantissa * base^n) base == 2..36
* - number`                 Machine precision approx, number
* - number`s                arbitrary precision number with precision s
* - number``s               arbitrary precision number with accuracy s
*/
NUMBER
    : ('-')?(DIGIT)+ ('.' (DIGIT)+)? (EXP)?
    ;

ID  : ('a'..'z'|'A'..'Z')+
    ;

protected
EXP 
    :    ('e'|'E') NUMBER
    |    (THICK (THICK)? (NUMBER)?)
    ;

protected
DIGIT    
    : '0'..'9'
    ;

/*
 * Strings can not be implemented in the lexer. Some part of them must 
 * be in the parser
 * Character strings
 * - "characters"
 * - \" - a literal " in a string
 * - \\ - a literal \ in a string
 * - \< ... \> - a substring in which newlines are interpreted literally
 * - \!\( ... \) - a substring representing two-dimensional boxes
 */
QSTRING 
    :   '"' 
        ({LA(2) != '"'}? '\\'
        | ('\r'|'\n'){ newline();} 
        | '\\' '"'
        | ~('"'|'\r'|'\n'|'\\')
        )*
        '"'
    ;

WHITESPACE 
    :   (' '
        |'\t'
        |('\r'|'\n'|"\r\n") {newline();} 
        )
        { $setType(ANTLR_USE_NAMESPACE(antlr)Token::SKIP);}
    ;

COMMENT    : COMMENTSTART //'(' '*'
           ({LA(2) != ')'}? '*'
           | ('\r'|'\n'){ newline();} 
           | ~('*'|'\r'|'\n')
           )*
           COMMENTEND //'*'')'
           { $setType(ANTLR_USE_NAMESPACE(antlr)Token::SKIP); }
           ;
