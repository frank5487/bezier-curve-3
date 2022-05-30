%% Part 2iii
for i = 1:2
    fprintf(['Please select >= 5 points for the spline ', ...
             '(no requirements on how you pick them)\n'])
    figure;
    [x_, y_] = getpoints;
    [dx, dy, Bx, By] = interpnatxy(x_, y_);
    %saveas(gcf, sprintf('output/part2iii/img%d.png', i));
    imname = ['output' filesep 'part2iii' filesep sprintf('Ayimg%d.png',i)];
    saveas(gcf, imname);
    close all
end
