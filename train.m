function output = train()

p1 = [1 4];
t1 = 0;
p2 = [1 5];
t2 = 0;
p3 = [2 4];
t3 = 0;
p4 = [2 5];
t4 = 0;
p5 = [3 1];
t5 = 1;
p6 = [3 2];
t6 = 1;
p7 = [4 1];
t7 = 1;
p8 = [4 2];
t8 = 1;

inputs = [p1, p2, p3, p4, p5, p6, p7, p8];
expected = [t1, t2, t3, t4, t5, t6, t7, t8];
weight = [0 0];
bias = 0;

counter = 0;
i = 1;
while (counter < 8) 
    mult = weight*inputs(i);
    temp = sum(mult);
    temp = temp + bias;
    result = hardlim(temp);
    if (result == expected(i))
        counter = counter + 1;
        if (i == 8)
            i = 1;
            continue;
        end
        i = i + 1;
        continue;
    elseif (result ~= expected(i))
        %wnew = wold + e(input(i)transposed)
        % e = expected(i) - actual;
        % bnew = bold + e
        error = expected(i) - result;
        bias = bias + error;
        weight = weight + error*(transpose(inputs(i)));
        if (i == 8)
            i = 1;
            continue;
        end
        i = i + 1;
        
        continue
    end
end


        
    
    