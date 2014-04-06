#Phing-mode#

Emacs mode for <http://www.phing.info/>, the PHP build tool, similar to GNU Make.

#Features#

##Navigating through properties and targets##

Use imenu to list or navigate across targets and properties.

    M-x idomenu

or

    M-x imenu

##Quoting and unquoting strings inside commands##

Writing comples commands in targets like:

    <exec passthru="true" command="sed -i "s/const IS        = '=';/const IS        = 'IS';/" vendor/doctrine/collections/lib/Doctrine/Common/Collections/Expr/Comparison.php"/>

is painful because of mixing quotes and XML schema, which not allowing using same quotes and other symbols inside string properties.

To overcome it, select the content of "command" property without wrapping quotes, and use one of those functions:

    M-x phing-escape-string
    M-x phing-unescape-string

## Snippets ##

There are build in snippets:

- project skeleton `M-p p`
- build target `M-p t`
- command to execute `M-p c`
