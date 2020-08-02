# Autogenerated wrapper script for figtree_jll for armv7l-linux-gnueabihf
export libann_figtree_version, libfigtree

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"
LIBPATH_default = ""

# Relative path to `libann_figtree_version`
const libann_figtree_version_splitpath = ["lib", "libann_figtree_version.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libann_figtree_version_path = ""

# libann_figtree_version-specific global declaration
# This will be filled out by __init__()
libann_figtree_version_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libann_figtree_version = "libann_figtree_version.so"


# Relative path to `libfigtree`
const libfigtree_splitpath = ["lib", "libfigtree.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libfigtree_path = ""

# libfigtree-specific global declaration
# This will be filled out by __init__()
libfigtree_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libfigtree = "libfigtree.so"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"figtree")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    global libann_figtree_version_path = normpath(joinpath(artifact_dir, libann_figtree_version_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libann_figtree_version_handle = dlopen(libann_figtree_version_path)
    push!(LIBPATH_list, dirname(libann_figtree_version_path))

    global libfigtree_path = normpath(joinpath(artifact_dir, libfigtree_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libfigtree_handle = dlopen(libfigtree_path)
    push!(LIBPATH_list, dirname(libfigtree_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(vcat(LIBPATH_list, [joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)]), ':')

    
end  # __init__()

