function data = test_bfsave()

bfCheckJavaPath();

% bfsave-singleplane-start
plane = zeros(64, 64, 'uint8');
bfsave(plane, 'single-plane.ome.tiff');
% bfsave-singleplane-end

% bfsave-multiplanes-start
plane = zeros(64, 64, 1, 2, 2, 'uint8');
bfsave(plane, 'multiple-planes.ome.tiff');
% bfsave-multiplanes-end

% bfsave-metadata-start
plane = zeros(64, 64, 1, 2, 2, 'uint8');
metadata = createMinimalOMEXMLMetadata(plane);
pixelSize = ome.units.quantity.Length(java.lang.Double(.05), ome.units.UNITS.MICROMETER);
metadata.setPixelsPhysicalSizeX(pixelSize, 0);
metadata.setPixelsPhysicalSizeY(pixelSize, 0);
pixelSizeZ = ome.units.quantity.Length(java.lang.Double(.2), ome.units.UNITS.MICROMETER);
metadata.setPixelsPhysicalSizeZ(pixelSizeZ, 0);
bfsave(plane, 'metadata.ome.tiff', 'metadata', metadata);
% bfsave-metadata-end

end
