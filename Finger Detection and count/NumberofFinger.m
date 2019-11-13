n=5;
c=1;
for i=1:n
    %loading image
    image = imread(sprintf('f%d.png',i));
    subplot(n,n+1,c);
    imshow(image);
    title('Original');
    c=c+1;
    
    %converting image to binary
    image2=im2bw(image,0.2);
    subplot(n,n+1,c);
    imshow(image2);
    title('Binary Image');
    c=c+1;
    
    % preprocessing
   % image3=bwareaopen(image2,21000); % removing tiny object
    %image3=imfill(image3,'holes'); %filling tiny holes
    image3=image2;
    % finding finger
    structuredElement=strel('disk',62);
    image4=imerode(image3,structuredElement); % eroding finger
    image5=imdilate(image4,structuredElement);% dialating palm
    
    subplot(n,n+1,c);
    imshow(image5);
    title('Palm');
    c=c+1;
    
    fingers=image3-image5;
    
    subplot(n,n+1,c);
    imshow(fingers);
    title('Fingers (Noisy)');
    c=c+1;
    
    
    %preprocessing (removing noise) for counting finger
    fingers=bwareaopen(fingers,200);
    fingers=imerode(fingers,strel('disk',10));
    %fingers=bwareaopen(fingers,400);
    
    subplot(n,n+1,c);
    imshow(fingers);
    title('Fingers (NoiseleSS)');
    c=c+1;
    
    %counting number of finger
    [labeled,numberOfObject]=bwlabel(fingers);
    disp('Number of finger: ');
    disp(numberOfObject);
    
    subplot(n,n+1,c);
    text(0.5,0.5,sprintf('%d',numberOfObject));
    set(gca,'XTick',[], 'YTick', []);
    title('Number of Finger');
    c=c+1;
    
 end

