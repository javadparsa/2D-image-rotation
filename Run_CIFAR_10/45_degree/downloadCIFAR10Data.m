function downloadCIFAR10Data(destination)

url = 'https://www.cs.toronto.edu/~kriz/cifar-10-matlab.tar.gz';

unpackedData = fullfile(destination,'cifar-10-batches-mat');
if ~exist(unpackedData,'dir')
    fprintf('Downloading CIFAR-10 dataset (176 MB). This can take a while...');
    untar(url,destination);
    fprintf('done.\n\n');
end

end