function downloadCIFAR100Data(destination)

url = 'https://www.cs.toronto.edu/~kriz/cifar-100-matlab.tar.gz';

unpackedData = fullfile(destination,'cifar-100-batches-mat');
if ~exist(unpackedData,'dir')
    fprintf('Downloading CIFAR-100 dataset (176 MB). This can take a while...');
    untar(url,destination);
    fprintf('done.\n\n');
end

end