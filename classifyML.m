function klasse = classifyML(x, k)

lik = zeros(size(x,1),size(x,2));
for n = 1:length(k)
    lik(n,:) = likelihood(x, k(n).theta);
end

klasse = lik(1,:) > lik(2,:);

end