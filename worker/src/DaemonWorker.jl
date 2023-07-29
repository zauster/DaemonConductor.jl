module DaemonWorker

using Base.Threads
using REPL
using Serialization
using Sockets
using Dates

using BaseDirs

using Logging, LoggingExtras

const WORKER_ID = Ref("")

# macro log(msg...)
#     quote
#         printstyled("[$(now())] ", color=:light_black)
#         $(esc(Expr(:call, :println, msg...)))
#     end
# end

include("setup.jl")

function __init__()
    try_load_revise()
    WORKER_ID[] = String(rand('a':'z', 6))
end

include("precompile.jl")

end
