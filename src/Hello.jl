module Hello

using CUDA

abstract type MeshGPU end

const _cuda_using_double = Ref(false)

struct FDMeshGPU{T <: AbstractFloat} <: MeshGPU
    dx::T
    dy::T
    dz::T
    nx::Int64
    ny::Int64
    nz::Int64
    nxyz::Int64
    xperiodic::Bool
    yperiodic::Bool
    zperiodic::Bool
    volume::T
  end
  
  function FDMeshGPU(;dx=1e-9, dy=1e-9, dz=1e-9, nx=10, ny=10, nz=1, pbc="open")
    nxyz = nx*ny*nz
    volume = dx*dy*dz
    Float = _cuda_using_double.x ? Float64 : Float32
    xperiodic = 'x' in pbc ? true : false
    yperiodic = 'y' in pbc ? true : false
    zperiodic = 'z' in pbc ? true : false
    return FDMeshGPU(Float(dx), Float(dy), Float(dz), nx, ny, nz, nxyz, xperiodic, yperiodic, zperiodic, Float(volume))
  end

add2(a) = a.+2

add_gpu(a,b) = a.+b

test_gpu() = CUDA.zeros(10)

greet() = print("Hello World!")

add(a,b) = a+b

add(a, b, c) = a+b+c
end # module
