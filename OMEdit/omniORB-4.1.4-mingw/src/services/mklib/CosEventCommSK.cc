// This file is generated by omniidl (C++ backend)- omniORB_4_1. Do not edit.

#include "CosEventComm.hh"
#include <omniORB4/IOP_S.h>
#include <omniORB4/IOP_C.h>
#include <omniORB4/callDescriptor.h>
#include <omniORB4/callHandle.h>
#include <omniORB4/objTracker.h>


OMNI_USING_NAMESPACE(omni)

static const char* _0RL_library_version = omniORB_4_1;



::CORBA::Exception::insertExceptionToAny CosEventComm::Disconnected::insertToAnyFn = 0;
::CORBA::Exception::insertExceptionToAnyNCP CosEventComm::Disconnected::insertToAnyFnNCP = 0;

CosEventComm::Disconnected::Disconnected(const CosEventComm::Disconnected& _s) : ::CORBA::UserException(_s)
{
  
}



CosEventComm::Disconnected& CosEventComm::Disconnected::operator=(const CosEventComm::Disconnected& _s)
{
  ((::CORBA::UserException*) this)->operator=(_s);
  
  return *this;
}

CosEventComm::Disconnected::~Disconnected() {}

void CosEventComm::Disconnected::_raise() const { throw *this; }

const char* CosEventComm::Disconnected::_PD_repoId = "IDL:omg.org/CosEventComm/Disconnected:1.0";
const char* CosEventComm::Disconnected::_PD_typeId = "Exception/UserException/CosEventComm::Disconnected";

CosEventComm::Disconnected* CosEventComm::Disconnected::_downcast(::CORBA::Exception* _e) {
  return (Disconnected*) _NP_is_a(_e, _PD_typeId);
}

const CosEventComm::Disconnected* CosEventComm::Disconnected::_downcast(const ::CORBA::Exception* _e) {
  return (const Disconnected*) _NP_is_a(_e, _PD_typeId);
}

::CORBA::Exception* CosEventComm::Disconnected::_NP_duplicate() const {
  return new Disconnected(*this);
}

const char* CosEventComm::Disconnected::_NP_typeId() const {
  return _PD_typeId;
}

const char* CosEventComm::Disconnected::_NP_repoId(int* _size) const {
  *_size = sizeof("IDL:omg.org/CosEventComm/Disconnected:1.0");
  return _PD_repoId;
}
 
void CosEventComm::Disconnected::_NP_marshal(cdrStream& _s) const {
  *this >>= _s;
}

CosEventComm::PushConsumer_ptr CosEventComm::PushConsumer_Helper::_nil() {
  return ::CosEventComm::PushConsumer::_nil();
}

::CORBA::Boolean CosEventComm::PushConsumer_Helper::is_nil(::CosEventComm::PushConsumer_ptr p) {
  return ::CORBA::is_nil(p);

}

void CosEventComm::PushConsumer_Helper::release(::CosEventComm::PushConsumer_ptr p) {
  ::CORBA::release(p);
}

void CosEventComm::PushConsumer_Helper::marshalObjRef(::CosEventComm::PushConsumer_ptr obj, cdrStream& s) {
  ::CosEventComm::PushConsumer::_marshalObjRef(obj, s);
}

CosEventComm::PushConsumer_ptr CosEventComm::PushConsumer_Helper::unmarshalObjRef(cdrStream& s) {
  return ::CosEventComm::PushConsumer::_unmarshalObjRef(s);
}

void CosEventComm::PushConsumer_Helper::duplicate(::CosEventComm::PushConsumer_ptr obj) {
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
}

CosEventComm::PushConsumer_ptr
CosEventComm::PushConsumer::_duplicate(::CosEventComm::PushConsumer_ptr obj)
{
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
  return obj;
}

CosEventComm::PushConsumer_ptr
CosEventComm::PushConsumer::_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_realNarrow(_PD_repoId);
  return e ? e : _nil();
}


CosEventComm::PushConsumer_ptr
CosEventComm::PushConsumer::_unchecked_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_uncheckedNarrow(_PD_repoId);
  return e ? e : _nil();
}

CosEventComm::PushConsumer_ptr
CosEventComm::PushConsumer::_nil()
{
#ifdef OMNI_UNLOADABLE_STUBS
  static _objref_PushConsumer _the_nil_obj;
  return &_the_nil_obj;
#else
  static _objref_PushConsumer* _the_nil_ptr = 0;
  if( !_the_nil_ptr ) {
    omni::nilRefLock().lock();
    if( !_the_nil_ptr ) {
      _the_nil_ptr = new _objref_PushConsumer;
      registerNilCorbaObject(_the_nil_ptr);
    }
    omni::nilRefLock().unlock();
  }
  return _the_nil_ptr;
#endif
}

const char* CosEventComm::PushConsumer::_PD_repoId = "IDL:omg.org/CosEventComm/PushConsumer:1.0";


CosEventComm::_objref_PushConsumer::~_objref_PushConsumer() {
  
}


CosEventComm::_objref_PushConsumer::_objref_PushConsumer(omniIOR* ior, omniIdentity* id) :
   omniObjRef(::CosEventComm::PushConsumer::_PD_repoId, ior, id, 1)
   
   
{
  _PR_setobj(this);
}

void*
CosEventComm::_objref_PushConsumer::_ptrToObjRef(const char* id)
{
  if( id == ::CosEventComm::PushConsumer::_PD_repoId )
    return (::CosEventComm::PushConsumer_ptr) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (::CORBA::Object_ptr) this;

  if( omni::strMatch(id, ::CosEventComm::PushConsumer::_PD_repoId) )
    return (::CosEventComm::PushConsumer_ptr) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (::CORBA::Object_ptr) this;

  return 0;
}

// Proxy call descriptor class. Mangled signature:
//  void_i_cany_e_cCosEventComm_mDisconnected
class _0RL_cd_BD959CC57B2E138F_00000000
  : public omniCallDescriptor
{
public:
  inline _0RL_cd_BD959CC57B2E138F_00000000(LocalCallFn lcfn,const char* op_,size_t oplen,_CORBA_Boolean upcall=0):
     omniCallDescriptor(lcfn, op_, oplen, 0, _user_exns, 1, upcall)
  {
    
  }
  
  void marshalArguments(cdrStream&);
  void unmarshalArguments(cdrStream&);

    
  void userException(cdrStream&,_OMNI_NS(IOP_C)*,const char*);
  static const char* const _user_exns[];

  ::CORBA::Any_var arg_0_;
  const ::CORBA::Any* arg_0;
};

void _0RL_cd_BD959CC57B2E138F_00000000::marshalArguments(cdrStream& _n)
{
  (const ::CORBA::Any&) *arg_0 >>= _n;

}

void _0RL_cd_BD959CC57B2E138F_00000000::unmarshalArguments(cdrStream& _n)
{
  arg_0_ = new ::CORBA::Any;
  (::CORBA::Any&)arg_0_ <<= _n;
  arg_0 = &arg_0_.in();

}

const char* const _0RL_cd_BD959CC57B2E138F_00000000::_user_exns[] = {
  CosEventComm::Disconnected::_PD_repoId
};

void _0RL_cd_BD959CC57B2E138F_00000000::userException(cdrStream& s, _OMNI_NS(IOP_C)* iop_client, const char* repoId)
{
  if ( omni::strMatch(repoId, CosEventComm::Disconnected::_PD_repoId) ) {
    CosEventComm::Disconnected _ex;
    _ex <<= s;
    if (iop_client) iop_client->RequestCompleted();
    throw _ex;
  }


  else {
    if (iop_client) iop_client->RequestCompleted(1);
    OMNIORB_THROW(UNKNOWN,UNKNOWN_UserException,
                  (::CORBA::CompletionStatus)s.completion());
  }
}

// Local call call-back function.
static void
_0RL_lcfn_BD959CC57B2E138F_10000000(omniCallDescriptor* cd, omniServant* svnt)
{
  _0RL_cd_BD959CC57B2E138F_00000000* tcd = (_0RL_cd_BD959CC57B2E138F_00000000*)cd;
  CosEventComm::_impl_PushConsumer* impl = (CosEventComm::_impl_PushConsumer*) svnt->_ptrToInterface(CosEventComm::PushConsumer::_PD_repoId);
#ifdef HAS_Cplusplus_catch_exception_by_base
  impl->push(*tcd->arg_0);
#else
  if (!cd->is_upcall())
    impl->push(*tcd->arg_0);
  else {
    try {
      impl->push(*tcd->arg_0);
    }
    catch(CosEventComm::Disconnected& ex) {
      throw omniORB::StubUserException(ex._NP_duplicate());
    }


  }
#endif


}

void CosEventComm::_objref_PushConsumer::push(const ::CORBA::Any& data)
{
  _0RL_cd_BD959CC57B2E138F_00000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_10000000, "push", 5);
  _call_desc.arg_0 = &(::CORBA::Any&) data;

  _invoke(_call_desc);



}
// Proxy call descriptor class. Mangled signature:
//  void
class _0RL_cd_BD959CC57B2E138F_20000000
  : public omniCallDescriptor
{
public:
  inline _0RL_cd_BD959CC57B2E138F_20000000(LocalCallFn lcfn,const char* op_,size_t oplen,_CORBA_Boolean upcall=0):
     omniCallDescriptor(lcfn, op_, oplen, 0, _user_exns, 0, upcall)
  {
    
  }
  
  
    
  
  static const char* const _user_exns[];

  
};

const char* const _0RL_cd_BD959CC57B2E138F_20000000::_user_exns[] = {
  0
};

// Local call call-back function.
static void
_0RL_lcfn_BD959CC57B2E138F_30000000(omniCallDescriptor*, omniServant* svnt)
{
  
  CosEventComm::_impl_PushConsumer* impl = (CosEventComm::_impl_PushConsumer*) svnt->_ptrToInterface(CosEventComm::PushConsumer::_PD_repoId);
  impl->disconnect_push_consumer();


}

void CosEventComm::_objref_PushConsumer::disconnect_push_consumer()
{
  _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_30000000, "disconnect_push_consumer", 25);


  _invoke(_call_desc);



}
CosEventComm::_pof_PushConsumer::~_pof_PushConsumer() {}


omniObjRef*
CosEventComm::_pof_PushConsumer::newObjRef(omniIOR* ior, omniIdentity* id)
{
  return new ::CosEventComm::_objref_PushConsumer(ior, id);
}


::CORBA::Boolean
CosEventComm::_pof_PushConsumer::is_a(const char* id) const
{
  if( omni::ptrStrMatch(id, ::CosEventComm::PushConsumer::_PD_repoId) )
    return 1;
  
  return 0;
}

const CosEventComm::_pof_PushConsumer _the_pof_CosEventComm_mPushConsumer;

CosEventComm::_impl_PushConsumer::~_impl_PushConsumer() {}


::CORBA::Boolean
CosEventComm::_impl_PushConsumer::_dispatch(omniCallHandle& _handle)
{
  const char* op = _handle.operation_name();

  if( omni::strMatch(op, "push") ) {

    _0RL_cd_BD959CC57B2E138F_00000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_10000000, "push", 5, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }

  if( omni::strMatch(op, "disconnect_push_consumer") ) {

    _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_30000000, "disconnect_push_consumer", 25, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }


  return 0;
}

void*
CosEventComm::_impl_PushConsumer::_ptrToInterface(const char* id)
{
  if( id == ::CosEventComm::PushConsumer::_PD_repoId )
    return (::CosEventComm::_impl_PushConsumer*) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (void*) 1;

  if( omni::strMatch(id, ::CosEventComm::PushConsumer::_PD_repoId) )
    return (::CosEventComm::_impl_PushConsumer*) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (void*) 1;
  return 0;
}

const char*
CosEventComm::_impl_PushConsumer::_mostDerivedRepoId()
{
  return ::CosEventComm::PushConsumer::_PD_repoId;
}

CosEventComm::PushSupplier_ptr CosEventComm::PushSupplier_Helper::_nil() {
  return ::CosEventComm::PushSupplier::_nil();
}

::CORBA::Boolean CosEventComm::PushSupplier_Helper::is_nil(::CosEventComm::PushSupplier_ptr p) {
  return ::CORBA::is_nil(p);

}

void CosEventComm::PushSupplier_Helper::release(::CosEventComm::PushSupplier_ptr p) {
  ::CORBA::release(p);
}

void CosEventComm::PushSupplier_Helper::marshalObjRef(::CosEventComm::PushSupplier_ptr obj, cdrStream& s) {
  ::CosEventComm::PushSupplier::_marshalObjRef(obj, s);
}

CosEventComm::PushSupplier_ptr CosEventComm::PushSupplier_Helper::unmarshalObjRef(cdrStream& s) {
  return ::CosEventComm::PushSupplier::_unmarshalObjRef(s);
}

void CosEventComm::PushSupplier_Helper::duplicate(::CosEventComm::PushSupplier_ptr obj) {
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
}

CosEventComm::PushSupplier_ptr
CosEventComm::PushSupplier::_duplicate(::CosEventComm::PushSupplier_ptr obj)
{
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
  return obj;
}

CosEventComm::PushSupplier_ptr
CosEventComm::PushSupplier::_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_realNarrow(_PD_repoId);
  return e ? e : _nil();
}


CosEventComm::PushSupplier_ptr
CosEventComm::PushSupplier::_unchecked_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_uncheckedNarrow(_PD_repoId);
  return e ? e : _nil();
}

CosEventComm::PushSupplier_ptr
CosEventComm::PushSupplier::_nil()
{
#ifdef OMNI_UNLOADABLE_STUBS
  static _objref_PushSupplier _the_nil_obj;
  return &_the_nil_obj;
#else
  static _objref_PushSupplier* _the_nil_ptr = 0;
  if( !_the_nil_ptr ) {
    omni::nilRefLock().lock();
    if( !_the_nil_ptr ) {
      _the_nil_ptr = new _objref_PushSupplier;
      registerNilCorbaObject(_the_nil_ptr);
    }
    omni::nilRefLock().unlock();
  }
  return _the_nil_ptr;
#endif
}

const char* CosEventComm::PushSupplier::_PD_repoId = "IDL:omg.org/CosEventComm/PushSupplier:1.0";


CosEventComm::_objref_PushSupplier::~_objref_PushSupplier() {
  
}


CosEventComm::_objref_PushSupplier::_objref_PushSupplier(omniIOR* ior, omniIdentity* id) :
   omniObjRef(::CosEventComm::PushSupplier::_PD_repoId, ior, id, 1)
   
   
{
  _PR_setobj(this);
}

void*
CosEventComm::_objref_PushSupplier::_ptrToObjRef(const char* id)
{
  if( id == ::CosEventComm::PushSupplier::_PD_repoId )
    return (::CosEventComm::PushSupplier_ptr) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (::CORBA::Object_ptr) this;

  if( omni::strMatch(id, ::CosEventComm::PushSupplier::_PD_repoId) )
    return (::CosEventComm::PushSupplier_ptr) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (::CORBA::Object_ptr) this;

  return 0;
}

// Local call call-back function.
static void
_0RL_lcfn_BD959CC57B2E138F_40000000(omniCallDescriptor*, omniServant* svnt)
{
  
  CosEventComm::_impl_PushSupplier* impl = (CosEventComm::_impl_PushSupplier*) svnt->_ptrToInterface(CosEventComm::PushSupplier::_PD_repoId);
  impl->disconnect_push_supplier();


}

void CosEventComm::_objref_PushSupplier::disconnect_push_supplier()
{
  _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_40000000, "disconnect_push_supplier", 25);


  _invoke(_call_desc);



}
CosEventComm::_pof_PushSupplier::~_pof_PushSupplier() {}


omniObjRef*
CosEventComm::_pof_PushSupplier::newObjRef(omniIOR* ior, omniIdentity* id)
{
  return new ::CosEventComm::_objref_PushSupplier(ior, id);
}


::CORBA::Boolean
CosEventComm::_pof_PushSupplier::is_a(const char* id) const
{
  if( omni::ptrStrMatch(id, ::CosEventComm::PushSupplier::_PD_repoId) )
    return 1;
  
  return 0;
}

const CosEventComm::_pof_PushSupplier _the_pof_CosEventComm_mPushSupplier;

CosEventComm::_impl_PushSupplier::~_impl_PushSupplier() {}


::CORBA::Boolean
CosEventComm::_impl_PushSupplier::_dispatch(omniCallHandle& _handle)
{
  const char* op = _handle.operation_name();

  if( omni::strMatch(op, "disconnect_push_supplier") ) {

    _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_40000000, "disconnect_push_supplier", 25, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }


  return 0;
}

void*
CosEventComm::_impl_PushSupplier::_ptrToInterface(const char* id)
{
  if( id == ::CosEventComm::PushSupplier::_PD_repoId )
    return (::CosEventComm::_impl_PushSupplier*) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (void*) 1;

  if( omni::strMatch(id, ::CosEventComm::PushSupplier::_PD_repoId) )
    return (::CosEventComm::_impl_PushSupplier*) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (void*) 1;
  return 0;
}

const char*
CosEventComm::_impl_PushSupplier::_mostDerivedRepoId()
{
  return ::CosEventComm::PushSupplier::_PD_repoId;
}

CosEventComm::PullSupplier_ptr CosEventComm::PullSupplier_Helper::_nil() {
  return ::CosEventComm::PullSupplier::_nil();
}

::CORBA::Boolean CosEventComm::PullSupplier_Helper::is_nil(::CosEventComm::PullSupplier_ptr p) {
  return ::CORBA::is_nil(p);

}

void CosEventComm::PullSupplier_Helper::release(::CosEventComm::PullSupplier_ptr p) {
  ::CORBA::release(p);
}

void CosEventComm::PullSupplier_Helper::marshalObjRef(::CosEventComm::PullSupplier_ptr obj, cdrStream& s) {
  ::CosEventComm::PullSupplier::_marshalObjRef(obj, s);
}

CosEventComm::PullSupplier_ptr CosEventComm::PullSupplier_Helper::unmarshalObjRef(cdrStream& s) {
  return ::CosEventComm::PullSupplier::_unmarshalObjRef(s);
}

void CosEventComm::PullSupplier_Helper::duplicate(::CosEventComm::PullSupplier_ptr obj) {
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
}

CosEventComm::PullSupplier_ptr
CosEventComm::PullSupplier::_duplicate(::CosEventComm::PullSupplier_ptr obj)
{
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
  return obj;
}

CosEventComm::PullSupplier_ptr
CosEventComm::PullSupplier::_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_realNarrow(_PD_repoId);
  return e ? e : _nil();
}


CosEventComm::PullSupplier_ptr
CosEventComm::PullSupplier::_unchecked_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_uncheckedNarrow(_PD_repoId);
  return e ? e : _nil();
}

CosEventComm::PullSupplier_ptr
CosEventComm::PullSupplier::_nil()
{
#ifdef OMNI_UNLOADABLE_STUBS
  static _objref_PullSupplier _the_nil_obj;
  return &_the_nil_obj;
#else
  static _objref_PullSupplier* _the_nil_ptr = 0;
  if( !_the_nil_ptr ) {
    omni::nilRefLock().lock();
    if( !_the_nil_ptr ) {
      _the_nil_ptr = new _objref_PullSupplier;
      registerNilCorbaObject(_the_nil_ptr);
    }
    omni::nilRefLock().unlock();
  }
  return _the_nil_ptr;
#endif
}

const char* CosEventComm::PullSupplier::_PD_repoId = "IDL:omg.org/CosEventComm/PullSupplier:1.0";


CosEventComm::_objref_PullSupplier::~_objref_PullSupplier() {
  
}


CosEventComm::_objref_PullSupplier::_objref_PullSupplier(omniIOR* ior, omniIdentity* id) :
   omniObjRef(::CosEventComm::PullSupplier::_PD_repoId, ior, id, 1)
   
   
{
  _PR_setobj(this);
}

void*
CosEventComm::_objref_PullSupplier::_ptrToObjRef(const char* id)
{
  if( id == ::CosEventComm::PullSupplier::_PD_repoId )
    return (::CosEventComm::PullSupplier_ptr) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (::CORBA::Object_ptr) this;

  if( omni::strMatch(id, ::CosEventComm::PullSupplier::_PD_repoId) )
    return (::CosEventComm::PullSupplier_ptr) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (::CORBA::Object_ptr) this;

  return 0;
}

// Proxy call descriptor class. Mangled signature:
//  _cany_e_cCosEventComm_mDisconnected
class _0RL_cd_BD959CC57B2E138F_50000000
  : public omniCallDescriptor
{
public:
  inline _0RL_cd_BD959CC57B2E138F_50000000(LocalCallFn lcfn,const char* op_,size_t oplen,_CORBA_Boolean upcall=0):
     omniCallDescriptor(lcfn, op_, oplen, 0, _user_exns, 1, upcall)
  {
    
  }
  
  
  void unmarshalReturnedValues(cdrStream&);
  void marshalReturnedValues(cdrStream&);
  
  void userException(cdrStream&,_OMNI_NS(IOP_C)*,const char*);
  static const char* const _user_exns[];

  ::CORBA::Any_var result;
};

void _0RL_cd_BD959CC57B2E138F_50000000::marshalReturnedValues(cdrStream& _n)
{
  (const ::CORBA::Any&) result >>= _n;

}

void _0RL_cd_BD959CC57B2E138F_50000000::unmarshalReturnedValues(cdrStream& _n)
{
  result = new ::CORBA::Any;
  (::CORBA::Any&)result <<= _n;

}

const char* const _0RL_cd_BD959CC57B2E138F_50000000::_user_exns[] = {
  CosEventComm::Disconnected::_PD_repoId
};

void _0RL_cd_BD959CC57B2E138F_50000000::userException(cdrStream& s, _OMNI_NS(IOP_C)* iop_client, const char* repoId)
{
  if ( omni::strMatch(repoId, CosEventComm::Disconnected::_PD_repoId) ) {
    CosEventComm::Disconnected _ex;
    _ex <<= s;
    if (iop_client) iop_client->RequestCompleted();
    throw _ex;
  }


  else {
    if (iop_client) iop_client->RequestCompleted(1);
    OMNIORB_THROW(UNKNOWN,UNKNOWN_UserException,
                  (::CORBA::CompletionStatus)s.completion());
  }
}

// Local call call-back function.
static void
_0RL_lcfn_BD959CC57B2E138F_60000000(omniCallDescriptor* cd, omniServant* svnt)
{
  _0RL_cd_BD959CC57B2E138F_50000000* tcd = (_0RL_cd_BD959CC57B2E138F_50000000*)cd;
  CosEventComm::_impl_PullSupplier* impl = (CosEventComm::_impl_PullSupplier*) svnt->_ptrToInterface(CosEventComm::PullSupplier::_PD_repoId);
#ifdef HAS_Cplusplus_catch_exception_by_base
  tcd->result = impl->pull();
#else
  if (!cd->is_upcall())
    tcd->result = impl->pull();
  else {
    try {
      tcd->result = impl->pull();
    }
    catch(CosEventComm::Disconnected& ex) {
      throw omniORB::StubUserException(ex._NP_duplicate());
    }


  }
#endif


}

::CORBA::Any* CosEventComm::_objref_PullSupplier::pull()
{
  _0RL_cd_BD959CC57B2E138F_50000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_60000000, "pull", 5);


  _invoke(_call_desc);
  return _call_desc.result._retn();


}
// Proxy call descriptor class. Mangled signature:
//  _cany_o_cboolean_e_cCosEventComm_mDisconnected
class _0RL_cd_BD959CC57B2E138F_70000000
  : public omniCallDescriptor
{
public:
  inline _0RL_cd_BD959CC57B2E138F_70000000(LocalCallFn lcfn,const char* op_,size_t oplen,_CORBA_Boolean upcall=0):
     omniCallDescriptor(lcfn, op_, oplen, 0, _user_exns, 1, upcall)
  {
    
  }
  
  
  void unmarshalReturnedValues(cdrStream&);
  void marshalReturnedValues(cdrStream&);
  
  void userException(cdrStream&,_OMNI_NS(IOP_C)*,const char*);
  static const char* const _user_exns[];

  ::CORBA::Boolean arg_0;
  ::CORBA::Any_var result;
};

void _0RL_cd_BD959CC57B2E138F_70000000::marshalReturnedValues(cdrStream& _n)
{
  (const ::CORBA::Any&) result >>= _n;
  _n.marshalBoolean(arg_0);

}

void _0RL_cd_BD959CC57B2E138F_70000000::unmarshalReturnedValues(cdrStream& _n)
{
  result = new ::CORBA::Any;
  (::CORBA::Any&)result <<= _n;
  arg_0 = _n.unmarshalBoolean();

}

const char* const _0RL_cd_BD959CC57B2E138F_70000000::_user_exns[] = {
  CosEventComm::Disconnected::_PD_repoId
};

void _0RL_cd_BD959CC57B2E138F_70000000::userException(cdrStream& s, _OMNI_NS(IOP_C)* iop_client, const char* repoId)
{
  if ( omni::strMatch(repoId, CosEventComm::Disconnected::_PD_repoId) ) {
    CosEventComm::Disconnected _ex;
    _ex <<= s;
    if (iop_client) iop_client->RequestCompleted();
    throw _ex;
  }


  else {
    if (iop_client) iop_client->RequestCompleted(1);
    OMNIORB_THROW(UNKNOWN,UNKNOWN_UserException,
                  (::CORBA::CompletionStatus)s.completion());
  }
}

// Local call call-back function.
static void
_0RL_lcfn_BD959CC57B2E138F_80000000(omniCallDescriptor* cd, omniServant* svnt)
{
  _0RL_cd_BD959CC57B2E138F_70000000* tcd = (_0RL_cd_BD959CC57B2E138F_70000000*)cd;
  CosEventComm::_impl_PullSupplier* impl = (CosEventComm::_impl_PullSupplier*) svnt->_ptrToInterface(CosEventComm::PullSupplier::_PD_repoId);
#ifdef HAS_Cplusplus_catch_exception_by_base
  tcd->result = impl->try_pull(tcd->arg_0);
#else
  if (!cd->is_upcall())
    tcd->result = impl->try_pull(tcd->arg_0);
  else {
    try {
      tcd->result = impl->try_pull(tcd->arg_0);
    }
    catch(CosEventComm::Disconnected& ex) {
      throw omniORB::StubUserException(ex._NP_duplicate());
    }


  }
#endif


}

::CORBA::Any* CosEventComm::_objref_PullSupplier::try_pull(::CORBA::Boolean& has_event)
{
  _0RL_cd_BD959CC57B2E138F_70000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_80000000, "try_pull", 9);


  _invoke(_call_desc);
  has_event = _call_desc.arg_0;
  return _call_desc.result._retn();


}
// Local call call-back function.
static void
_0RL_lcfn_BD959CC57B2E138F_90000000(omniCallDescriptor*, omniServant* svnt)
{
  
  CosEventComm::_impl_PullSupplier* impl = (CosEventComm::_impl_PullSupplier*) svnt->_ptrToInterface(CosEventComm::PullSupplier::_PD_repoId);
  impl->disconnect_pull_supplier();


}

void CosEventComm::_objref_PullSupplier::disconnect_pull_supplier()
{
  _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_90000000, "disconnect_pull_supplier", 25);


  _invoke(_call_desc);



}
CosEventComm::_pof_PullSupplier::~_pof_PullSupplier() {}


omniObjRef*
CosEventComm::_pof_PullSupplier::newObjRef(omniIOR* ior, omniIdentity* id)
{
  return new ::CosEventComm::_objref_PullSupplier(ior, id);
}


::CORBA::Boolean
CosEventComm::_pof_PullSupplier::is_a(const char* id) const
{
  if( omni::ptrStrMatch(id, ::CosEventComm::PullSupplier::_PD_repoId) )
    return 1;
  
  return 0;
}

const CosEventComm::_pof_PullSupplier _the_pof_CosEventComm_mPullSupplier;

CosEventComm::_impl_PullSupplier::~_impl_PullSupplier() {}


::CORBA::Boolean
CosEventComm::_impl_PullSupplier::_dispatch(omniCallHandle& _handle)
{
  const char* op = _handle.operation_name();

  if( omni::strMatch(op, "pull") ) {

    _0RL_cd_BD959CC57B2E138F_50000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_60000000, "pull", 5, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }

  if( omni::strMatch(op, "try_pull") ) {

    _0RL_cd_BD959CC57B2E138F_70000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_80000000, "try_pull", 9, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }

  if( omni::strMatch(op, "disconnect_pull_supplier") ) {

    _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_90000000, "disconnect_pull_supplier", 25, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }


  return 0;
}

void*
CosEventComm::_impl_PullSupplier::_ptrToInterface(const char* id)
{
  if( id == ::CosEventComm::PullSupplier::_PD_repoId )
    return (::CosEventComm::_impl_PullSupplier*) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (void*) 1;

  if( omni::strMatch(id, ::CosEventComm::PullSupplier::_PD_repoId) )
    return (::CosEventComm::_impl_PullSupplier*) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (void*) 1;
  return 0;
}

const char*
CosEventComm::_impl_PullSupplier::_mostDerivedRepoId()
{
  return ::CosEventComm::PullSupplier::_PD_repoId;
}

CosEventComm::PullConsumer_ptr CosEventComm::PullConsumer_Helper::_nil() {
  return ::CosEventComm::PullConsumer::_nil();
}

::CORBA::Boolean CosEventComm::PullConsumer_Helper::is_nil(::CosEventComm::PullConsumer_ptr p) {
  return ::CORBA::is_nil(p);

}

void CosEventComm::PullConsumer_Helper::release(::CosEventComm::PullConsumer_ptr p) {
  ::CORBA::release(p);
}

void CosEventComm::PullConsumer_Helper::marshalObjRef(::CosEventComm::PullConsumer_ptr obj, cdrStream& s) {
  ::CosEventComm::PullConsumer::_marshalObjRef(obj, s);
}

CosEventComm::PullConsumer_ptr CosEventComm::PullConsumer_Helper::unmarshalObjRef(cdrStream& s) {
  return ::CosEventComm::PullConsumer::_unmarshalObjRef(s);
}

void CosEventComm::PullConsumer_Helper::duplicate(::CosEventComm::PullConsumer_ptr obj) {
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
}

CosEventComm::PullConsumer_ptr
CosEventComm::PullConsumer::_duplicate(::CosEventComm::PullConsumer_ptr obj)
{
  if( obj && !obj->_NP_is_nil() )  omni::duplicateObjRef(obj);
  return obj;
}

CosEventComm::PullConsumer_ptr
CosEventComm::PullConsumer::_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_realNarrow(_PD_repoId);
  return e ? e : _nil();
}


CosEventComm::PullConsumer_ptr
CosEventComm::PullConsumer::_unchecked_narrow(::CORBA::Object_ptr obj)
{
  if( !obj || obj->_NP_is_nil() || obj->_NP_is_pseudo() ) return _nil();
  _ptr_type e = (_ptr_type) obj->_PR_getobj()->_uncheckedNarrow(_PD_repoId);
  return e ? e : _nil();
}

CosEventComm::PullConsumer_ptr
CosEventComm::PullConsumer::_nil()
{
#ifdef OMNI_UNLOADABLE_STUBS
  static _objref_PullConsumer _the_nil_obj;
  return &_the_nil_obj;
#else
  static _objref_PullConsumer* _the_nil_ptr = 0;
  if( !_the_nil_ptr ) {
    omni::nilRefLock().lock();
    if( !_the_nil_ptr ) {
      _the_nil_ptr = new _objref_PullConsumer;
      registerNilCorbaObject(_the_nil_ptr);
    }
    omni::nilRefLock().unlock();
  }
  return _the_nil_ptr;
#endif
}

const char* CosEventComm::PullConsumer::_PD_repoId = "IDL:omg.org/CosEventComm/PullConsumer:1.0";


CosEventComm::_objref_PullConsumer::~_objref_PullConsumer() {
  
}


CosEventComm::_objref_PullConsumer::_objref_PullConsumer(omniIOR* ior, omniIdentity* id) :
   omniObjRef(::CosEventComm::PullConsumer::_PD_repoId, ior, id, 1)
   
   
{
  _PR_setobj(this);
}

void*
CosEventComm::_objref_PullConsumer::_ptrToObjRef(const char* id)
{
  if( id == ::CosEventComm::PullConsumer::_PD_repoId )
    return (::CosEventComm::PullConsumer_ptr) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (::CORBA::Object_ptr) this;

  if( omni::strMatch(id, ::CosEventComm::PullConsumer::_PD_repoId) )
    return (::CosEventComm::PullConsumer_ptr) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (::CORBA::Object_ptr) this;

  return 0;
}

// Local call call-back function.
static void
_0RL_lcfn_BD959CC57B2E138F_a0000000(omniCallDescriptor*, omniServant* svnt)
{
  
  CosEventComm::_impl_PullConsumer* impl = (CosEventComm::_impl_PullConsumer*) svnt->_ptrToInterface(CosEventComm::PullConsumer::_PD_repoId);
  impl->disconnect_pull_consumer();


}

void CosEventComm::_objref_PullConsumer::disconnect_pull_consumer()
{
  _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_a0000000, "disconnect_pull_consumer", 25);


  _invoke(_call_desc);



}
CosEventComm::_pof_PullConsumer::~_pof_PullConsumer() {}


omniObjRef*
CosEventComm::_pof_PullConsumer::newObjRef(omniIOR* ior, omniIdentity* id)
{
  return new ::CosEventComm::_objref_PullConsumer(ior, id);
}


::CORBA::Boolean
CosEventComm::_pof_PullConsumer::is_a(const char* id) const
{
  if( omni::ptrStrMatch(id, ::CosEventComm::PullConsumer::_PD_repoId) )
    return 1;
  
  return 0;
}

const CosEventComm::_pof_PullConsumer _the_pof_CosEventComm_mPullConsumer;

CosEventComm::_impl_PullConsumer::~_impl_PullConsumer() {}


::CORBA::Boolean
CosEventComm::_impl_PullConsumer::_dispatch(omniCallHandle& _handle)
{
  const char* op = _handle.operation_name();

  if( omni::strMatch(op, "disconnect_pull_consumer") ) {

    _0RL_cd_BD959CC57B2E138F_20000000 _call_desc(_0RL_lcfn_BD959CC57B2E138F_a0000000, "disconnect_pull_consumer", 25, 1);
    
    _handle.upcall(this,_call_desc);
    return 1;
  }


  return 0;
}

void*
CosEventComm::_impl_PullConsumer::_ptrToInterface(const char* id)
{
  if( id == ::CosEventComm::PullConsumer::_PD_repoId )
    return (::CosEventComm::_impl_PullConsumer*) this;
  
  if( id == ::CORBA::Object::_PD_repoId )
    return (void*) 1;

  if( omni::strMatch(id, ::CosEventComm::PullConsumer::_PD_repoId) )
    return (::CosEventComm::_impl_PullConsumer*) this;
  
  if( omni::strMatch(id, ::CORBA::Object::_PD_repoId) )
    return (void*) 1;
  return 0;
}

const char*
CosEventComm::_impl_PullConsumer::_mostDerivedRepoId()
{
  return ::CosEventComm::PullConsumer::_PD_repoId;
}

POA_CosEventComm::PushConsumer::~PushConsumer() {}

POA_CosEventComm::PushSupplier::~PushSupplier() {}

POA_CosEventComm::PullSupplier::~PullSupplier() {}

POA_CosEventComm::PullConsumer::~PullConsumer() {}

