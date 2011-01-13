// This file is generated by omniidl (C++ backend) - omniORB_4_1. Do not edit.

#include "bootstrap.hh"

OMNI_USING_NAMESPACE(omni)

static const char* _0RL_dyn_library_version = omniORB_4_1_dyn;

static ::CORBA::TypeCode::_Tracker _0RL_tcTrack(__FILE__);

static CORBA::TypeCode_ptr _0RL_tc_CORBA__InitialReferences_mObjId = CORBA::TypeCode::PR_alias_tc("IDL:CORBA_InitialReferences/ObjId:1.0", "ObjId", CORBA::TypeCode::PR_string_tc(0, &_0RL_tcTrack), &_0RL_tcTrack);


const CORBA::TypeCode_ptr CORBA_InitialReferences::_tc_ObjId = _0RL_tc_CORBA__InitialReferences_mObjId;

static CORBA::TypeCode_ptr _0RL_tc_CORBA__InitialReferences_mObjIdList = CORBA::TypeCode::PR_alias_tc("IDL:CORBA_InitialReferences/ObjIdList:1.0", "ObjIdList", CORBA::TypeCode::PR_sequence_tc(0, CORBA::TypeCode::PR_string_tc(0, &_0RL_tcTrack), &_0RL_tcTrack), &_0RL_tcTrack);


const CORBA::TypeCode_ptr CORBA_InitialReferences::_tc_ObjIdList = _0RL_tc_CORBA__InitialReferences_mObjIdList;

const CORBA::TypeCode_ptr _tc_CORBA_InitialReferences = CORBA::TypeCode::PR_interface_tc("omg.org/CORBA/InitialReferences:1.0", "CORBA_InitialReferences", &_0RL_tcTrack);

static void _0RL_CORBA__InitialReferences_mObjIdList_marshal_fn(cdrStream& _s, void* _v)
{
  CORBA_InitialReferences::ObjIdList* _p = (CORBA_InitialReferences::ObjIdList*)_v;
  *_p >>= _s;
}
static void _0RL_CORBA__InitialReferences_mObjIdList_unmarshal_fn(cdrStream& _s, void*& _v)
{
  CORBA_InitialReferences::ObjIdList* _p = new CORBA_InitialReferences::ObjIdList;
  *_p <<= _s;
  _v = _p;
}
static void _0RL_CORBA__InitialReferences_mObjIdList_destructor_fn(void* _v)
{
  CORBA_InitialReferences::ObjIdList* _p = (CORBA_InitialReferences::ObjIdList*)_v;
  delete _p;
}

void operator<<=(::CORBA::Any& _a, const CORBA_InitialReferences::ObjIdList& _s)
{
  CORBA_InitialReferences::ObjIdList* _p = new CORBA_InitialReferences::ObjIdList(_s);
  _a.PR_insert(_0RL_tc_CORBA__InitialReferences_mObjIdList,
               _0RL_CORBA__InitialReferences_mObjIdList_marshal_fn,
               _0RL_CORBA__InitialReferences_mObjIdList_destructor_fn,
               _p);
}
void operator<<=(::CORBA::Any& _a, CORBA_InitialReferences::ObjIdList* _sp)
{
  _a.PR_insert(_0RL_tc_CORBA__InitialReferences_mObjIdList,
               _0RL_CORBA__InitialReferences_mObjIdList_marshal_fn,
               _0RL_CORBA__InitialReferences_mObjIdList_destructor_fn,
               _sp);
}

::CORBA::Boolean operator>>=(const ::CORBA::Any& _a, CORBA_InitialReferences::ObjIdList*& _sp)
{
  return _a >>= (const CORBA_InitialReferences::ObjIdList*&) _sp;
}
::CORBA::Boolean operator>>=(const ::CORBA::Any& _a, const CORBA_InitialReferences::ObjIdList*& _sp)
{
  void* _v;
  if (_a.PR_extract(_0RL_tc_CORBA__InitialReferences_mObjIdList,
                    _0RL_CORBA__InitialReferences_mObjIdList_unmarshal_fn,
                    _0RL_CORBA__InitialReferences_mObjIdList_marshal_fn,
                    _0RL_CORBA__InitialReferences_mObjIdList_destructor_fn,
                    _v)) {
    _sp = (const CORBA_InitialReferences::ObjIdList*)_v;
    return 1;
  }
  return 0;
}

static void _0RL_CORBA__InitialReferences_marshal_fn(cdrStream& _s, void* _v)
{
  omniObjRef* _o = (omniObjRef*)_v;
  omniObjRef::_marshal(_o, _s);
}
static void _0RL_CORBA__InitialReferences_unmarshal_fn(cdrStream& _s, void*& _v)
{
  omniObjRef* _o = omniObjRef::_unMarshal(CORBA_InitialReferences::_PD_repoId, _s);
  _v = _o;
}
static void _0RL_CORBA__InitialReferences_destructor_fn(void* _v)
{
  omniObjRef* _o = (omniObjRef*)_v;
  if (_o)
    omni::releaseObjRef(_o);
}

void operator<<=(::CORBA::Any& _a, CORBA_InitialReferences_ptr _o)
{
  CORBA_InitialReferences_ptr _no = CORBA_InitialReferences::_duplicate(_o);
  _a.PR_insert(_tc_CORBA_InitialReferences,
               _0RL_CORBA__InitialReferences_marshal_fn,
               _0RL_CORBA__InitialReferences_destructor_fn,
               _no->_PR_getobj());
}
void operator<<=(::CORBA::Any& _a, CORBA_InitialReferences_ptr* _op)
{
  _a.PR_insert(_tc_CORBA_InitialReferences,
               _0RL_CORBA__InitialReferences_marshal_fn,
               _0RL_CORBA__InitialReferences_destructor_fn,
               (*_op)->_PR_getobj());
  *_op = CORBA_InitialReferences::_nil();
}

::CORBA::Boolean operator>>=(const ::CORBA::Any& _a, CORBA_InitialReferences_ptr& _o)
{
  void* _v;
  if (_a.PR_extract(_tc_CORBA_InitialReferences,
                    _0RL_CORBA__InitialReferences_unmarshal_fn,
                    _0RL_CORBA__InitialReferences_marshal_fn,
                    _0RL_CORBA__InitialReferences_destructor_fn,
                    _v)) {
    omniObjRef* _r = (omniObjRef*)_v;
    if (_r)
      _o = (CORBA_InitialReferences_ptr)_r->_ptrToObjRef(CORBA_InitialReferences::_PD_repoId);
    else
      _o = CORBA_InitialReferences::_nil();
    return 1;
  }
  return 0;
}

