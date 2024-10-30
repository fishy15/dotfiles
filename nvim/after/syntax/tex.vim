syntax match texMathSymbol /\\bra{\%([^}]*}\)\@=/ conceal cchar=<
syntax match texMathSymbol /\%(\\bra{[^}]*\)\@<=}/ conceal cchar=|
syntax match texMathSymbol /\\ket{\%([^}]*}\)\@=/ conceal cchar=|
syntax match texMathSymbol /\%(\\ket{[^}]*\)\@<=}/ conceal cchar=>
syntax match texMathSymbol /\\braket{\%([^}]*}\)\@=/ conceal cchar=<
syntax match texMathSymbol /\%(\\braket{[^}]*\)\@<=}/ conceal cchar=>
