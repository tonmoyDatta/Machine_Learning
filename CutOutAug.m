function dataOut = CutOutAug(data)
    % Function to perform CutOut augmentation
    dataOut = data;
    for i = 1:size(data, 1)
        img = data{i,1};
        imgSize = size(img);
        
        % Define CutOut parameters
        cutoutSize = round([imgSize(1), imgSize(2)] * 0.2); % 20% of image size
        x = randi([1, imgSize(1) - cutoutSize(1)]);
        y = randi([1, imgSize(2) - cutoutSize(2)]);
        
        % Apply CutOut (set region to black)
        img(x:x+cutoutSize(1)-1, y:y+cutoutSize(2)-1, :) = 0;
        
        dataOut{i,1} = img;
    end
end
