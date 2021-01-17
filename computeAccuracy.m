function accuracy = computeAccuracy(testTargets, networkOutput)

% classify
klasse = zeros(size(networkOutput,1),size(networkOutput,2));
for n=1:size(networkOutput,2)            
    temp = networkOutput(1,n);          
    klasse(1,n) = 1;                        

    for i=1:(size(networkOutput,1) -1)   
      
        if networkOutput(i+1,n) > temp
            klasse(:,n) = 0;
            klasse(i+1,n) = 1;
            temp = networkOutput(i+1,n);     
        end
        
    end
end
correct_class = round(networkOutput).*testTargets;
summe = sum(sum(correct_class));                   
accuracy = summe / size(networkOutput,2);
end