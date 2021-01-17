function class = classifyBayes(x, k)

lik = zeros(size(x,1),size(x,2));
for n = 1:length(k)
    lik(n,:) = likelihood(x, k(n).theta);
    lik(n,:) = lik(n,:) * k(n).prior;
end

class = lik(1,:) > lik(2,:);

end