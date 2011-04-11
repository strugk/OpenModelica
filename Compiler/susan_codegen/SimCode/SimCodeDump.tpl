package SimCodeDump

import interface SimCodeTV;
import SimCodeC.*;

template dumpSimCode(SimCode code)
::=
  match code
  case sc as SIMCODE(modelInfo=mi as MODELINFO(vars=vars as SIMVARS(__))) then
  <<
  SimCode: <%dotPath(mi.name)%>
  <%dumpVars(vars.stateVars)%>
  <%dumpVars(vars.derivativeVars)%>
  <%dumpVars(vars.algVars)%>
  <%dumpVars(vars.intAlgVars)%>
  <%dumpVars(vars.boolAlgVars)%>
  <%dumpVars(vars.inputVars)%>
  <%dumpVars(vars.outputVars)%>
  <%dumpVars(vars.aliasVars)%>
  <%dumpVars(vars.intAliasVars)%>
  <%dumpVars(vars.boolAliasVars)%>
  <%dumpVars(vars.paramVars)%>
  <%dumpVars(vars.intParamVars)%>
  <%dumpVars(vars.boolParamVars)%>
  <%dumpVars(vars.stringAlgVars)%>
  <%dumpVars(vars.stringParamVars)%>
  <%dumpVars(vars.stringAliasVars)%>
  <%dumpVars(vars.extObjVars)%>
  <%dumpVars(vars.jacobianVars)%>
  <%dumpVars(vars.constVars)%>
  <%dumpEqs(sc.allEquations)%>
  /* Removed Equations */
  <%dumpEqs(sc.removedEquations)%>
  >>
end dumpSimCode;

template dumpVars(list<SimVar> vars)
::=
  vars |> v as SIMVAR(__) =>
  <<
  <%crefStr(v.name)%> <%v.comment%> <%dumpAlias(v.aliasvar)%>
    <%dumpElementSource(v.source)%>
  <%\n%>
  >>
end dumpVars;

template dumpAlias(AliasVariable alias)
::=
  match alias
  case ALIAS(__) then 'alias of <%crefStr(varName)%>'
  case NEGATEDALIAS(__) then 'alias of -<%crefStr(varName)%>'
end dumpAlias;

template dumpEqs(list<SimEqSystem> eqs)
::= eqs |> eq =>
  match eq
    case e as SES_RESIDUAL(__) then
      <<
      residual: <%printExpStr(e.exp)%>;
        <%dumpElementSource(e.source)%><%\n%>
      >>
    case e as SES_SIMPLE_ASSIGN(__) then
      <<
      eq: <%crefStr(e.cref)%> = <%printExpStr(e.exp)%>;
        <%dumpElementSource(e.source)%><%\n%>
      >>
    case e as SES_ARRAY_CALL_ASSIGN(__) then "SES_ARRAY_CALL_ASSIGN"
    case e as SES_ALGORITHM(statements={}) then 'empty algorithm<%\n%>'
    case e as SES_ALGORITHM(__)
      then (e.statements |> stmt =>
      <<
      statement: <%ppStmtStr(stmt,2)%>
        <%dumpElementSource(getStatementSource(stmt))%><%\n%>
      >>
      )
    case e as SES_LINEAR(__) then "SES_LINEAR"
    case e as SES_NONLINEAR(__) then
      <<
      nonlinear: <%e.crefs |> cr => crefStr(cr)%>
        <%dumpEqs(e.eqs)%><%\n%>
      >>
    case e as SES_MIXED(__) then "SES_MIXED"
    case e as SES_WHEN(__) then
      <<
      when: conditions
        <%crefStr(e.left)%> = <%printExpStr(e.right)%>
        <%dumpElementSource(e.source)%><%\n%>
      >>
    else "UNKNOWN"
end dumpEqs;

template dumpWithin(Within w)
::=
  match w
    case TOP(__) then "within ;"
    case WITHIN(__) then 'within <%dotPath(path)%>;'
end dumpWithin;

template dumpElementSource(ElementSource source)
::=
  match source
    case s as SOURCE(__) then
      <<
      <%infoStr(s.info)%>
      partOfLst: <%s.partOfLst |> w => dumpWithin(w)%>
      instanceOptLst: <%s.instanceOptLst |> SOME(cr) => crefStr(cr)%>
      connectEquationOptLst: <%s.connectEquationOptLst |> p => "w"%>
      typeLst: <%s.typeLst |> p => "w"%>
      operations: <%s.operations |> op => dumpOperation(op,s.info) %>
      >>
end dumpElementSource;

template dumpOperation(SymbolicOperation op, Info info)
::=
  match op
    case SIMPLIFY(__) then '<%\n%>  simplify: <%printExpStr(before)%> => <%printExpStr(after)%>'
    case SUBSTITUTION(__) then '<%\n%>  subst: <%printExpStr(source)%> => <%printExpStr(target)%>'
    case op as SOLVED(__) then '<%\n%>  simple equation: <%crefStr(op.cr)%> = <%printExpStr(op.exp)%>'
    case op as SOLVE(__) then
      <<<%\n%>
        solve:
          <%printExpStr(op.exp1)%> = <%printExpStr(op.exp2)%>
          =>
          <%crefStr(op.cr)%> = <%printExpStr(op.res)%>
        added assertions:
          <%op.assertConds |> cond => printExpStr(cond); separator="\n"%>
      >>
    else Tpl.addSourceTemplateError("Unknown operation",info)
end dumpOperation;

end SimCodeDump;

// vim: filetype=susan sw=2 sts=2
