# This file is used to define a specific include order of the dependencies
# The order is defined by the function getOrder.
# The function is called automaticly 

function(getOrder order)
    set(${order}
        easy_profiler.cmake
        Logger.cmake
        DependencyTemplate.cmake
        PARENT_SCOPE
    )
endfunction()