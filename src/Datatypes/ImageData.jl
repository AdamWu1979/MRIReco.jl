export makeAxisArray

# x, y, z, aqData.numEchoes, aqData.numCoils

function makeAxisArray(I::AbstractArray{T,5}, acqData::AcquisitionData) where T

  offset = [0.0, 0.0, 0.0]*Unitful.mm
  spacing = pixelspacing(acqData)

  im = AxisArray(I,
		   Axis{:x}(range(offset[1], step=spacing[1], length=size(I,1))),
		   Axis{:y}(range(offset[2], step=spacing[2], length=size(I,2))),
		   Axis{:z}(range(offset[3], step=spacing[3], length=size(I,3))),
		   Axis{:echos}(1:size(I,4)),
       Axis{:coils}(1:size(I,5)))

  #imMeta = ImageMeta(im, Dict{String,Any}())
  #return imMeta
  return im
end