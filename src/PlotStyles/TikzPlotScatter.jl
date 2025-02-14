struct TikzPlotScatter <: AbstractTikzPlot
	x::AbstractVector{Number}
	y::AbstractVector{Number}
	attributes::Dict{String, String}
end

function scatter(x::AbstractVector{<:Real}, y::AbstractVector{<:Real}, attributes::Dict{String,String}=Dict())
	return TikzPlotScatter(x, y, attributes)
end

function ToTikzString(plot::TikzPlotScatter)
	retString = ""
	retString *= "\\addplot[\n"
	for (k,v) in plot.attributes
		retString *= "$k = $v,\n"
	end
	retString *= "]\n"
	retString *= "coordinates\n{\n"
	for pt_i in range(1, length(plot.x))
		retString *= "($(plot.x[pt_i]), $(plot.y[pt_i]))\n"
	end
	retString *= "};\n"
	return retString
end
