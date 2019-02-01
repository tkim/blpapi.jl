module blpapi

# binary lib location
if isfile(joinpath(dirname(@__FILE__),"..","lib",
                   string("blpapi3_",(Sys.ARCH==:i686) ? "32" : (Sys.ARCH==:x86_64) ? "64" : error("unknown Sys.ARCH"),
                          ".",Sys.iswindows() ? "dll" : Sys.islinux() ? "so" : error("OS not supported"))))
	const blpapi3=joinpath(dirname(@__FILE__),"..","lib",(Sys.ARCH==:i686) ? "blpapi3_32" : "blpapi3_64")
else
    error("blpapi binary lib not found")
end

if isfile(joinpath(dirname(@__FILE__),"..","lib",
    string("blpapi3_helper_",(Sys.ARCH==:i686) ? "32" : (Sys.ARCH==:x86_64) ? "64" : error("unknown Sys.ARCH"),
    ".",Sys.iswindows() ? "dll" : Sys.islinux() ? "so" : error("OS not supported"))))
const blpapi3_helper=joinpath(dirname(@__FILE__),"..","lib",(Sys.ARCH==:i686) ? "blpapi3_helper_32" : "blpapi3_helper_64")
else
error("blpapi3_helper binary lib not found")
end

macro blpapi_setPointer(var,body)
    :($(esc(var)) = Ref{Ptr{Cvoid}}(0); $(esc(body)); $(esc(var))=$(esc(var))[])
end
macro setPointer(var,body)
    :(@blpapi_setPointer($(esc(var)),$(esc(body))))
end
export @blpapi_setPointer

# versioninfo
include("_blpapi_versioninfo.jl")

# error
include("_blpapi_error.jl")

# types
include("_blpapi_types.jl")

# defs
include("_blpapi_defs.jl")

# correlationid
include("_blpapi_correlationid.jl")

# datetime
include("_blpapi_datetime.jl")

# name
include("_blpapi_name.jl")

# sessionoptions
include("_blpapi_sessionoptions.jl")

# session
include("_blpapi_session.jl")

# service
include("_blpapi_service.jl")

# schema
include("_blpapi_schema.jl")

# event
include("_blpapi_event.jl")

# message
include("_blpapi_message.jl")

# element
include("_blpapi_element.jl")

# request
include("_blpapi_request.jl")

# subscription
include("_blpapi_subscriptionlist.jl")

end

