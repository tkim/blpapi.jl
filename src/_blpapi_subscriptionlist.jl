function blpapi_SubscriptionList_create()
    ccall((:blpapi_SubscriptionList_create, blpapi3), Ptr{Cvoid}, ())
end

function blpapi_SubscriptionList_destroy(list)
    ccall((:blpapi_SubscriptionList_destroy, blpapi3), Cvoid, (Ptr{Cvoid},), list)
end

function blpapi_SubscriptionList_add(list, subscriptionString, correlationId::Union{Signed,String}, fields, options, numfields::Signed, numOptions::Signed)
	if correlationId isa Signed
        ccall((:blpapi_SubscriptionList_add_intId, blpapi3_helper), Cint, (Ptr{Cvoid}, Cstring, Ptr{Cstring}, Ptr{Cstring}, Cint, Cint, Clonglong), list, subscriptionString, fields, options, Cint(numfields), Cint(numOptions), correlationId)
	elseif correlationId isa String
	    ccall((:blpapi_SubscriptionList_add_strId, blpapi3_helper), Cint, (Ptr{Cvoid}, Cstring, Ptr{Cstring}, Ptr{Cstring}, Cint, Cint, Cstring), list, subscriptionString, fields, options, Cint(numfields), Cint(numOptions), pointer(correlationId))
	end
end

SubscriptionList_create          = blpapi_SubscriptionList_create         
SubscriptionList_destroy         = blpapi_SubscriptionList_destroy       
SubscriptionList_add             = blpapi_SubscriptionList_add 

export blpapi_SubscriptionList_create          ,
       blpapi_SubscriptionList_destroy         ,
	   blpapi_SubscriptionList_add
