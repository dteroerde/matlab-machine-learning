function theta = gaussianEstimation(x)

theta.mu = sum(x,2) / length(x);
theta.C = ((x - theta.mu) * (x - theta.mu)') / length(x);  
theta.type = 'Gauss';
    
end