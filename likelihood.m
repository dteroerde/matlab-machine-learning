function lik = likelihood(x, theta)

if isequal(theta.type, 'Gauss')
    lik = (1 / sqrt((2*pi)^(length(x)) * det(theta.C))) * ...
        exp(diag(-0.5 * (x - theta.mu)' * inv(theta.C) * (x - theta.mu))');
end

if isequal(theta.type, 'Discrete')
    lik = zeros(1,length(x));
    for n = 1:length(x)
        
        temp = zeros(1, length(theta.values));
        for i = 1:length(theta.values)
            temp(i) = isequal( x(n), theta.values(i));
        end
        
        found = find(temp);
        
        if ~isempty(found)        
            lik(n) = theta.probabilities(found);                           
        else
            lik(n) = 0;
        end
    end
end

end