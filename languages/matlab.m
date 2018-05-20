% Textfile parsen

[node_logfile, attempt , launch, output] = textread('allTimes.txt','%s %s %d %d')

% CDF

stairs(sort(delay),(1:length(delay))/length(delay))

% Find String Pattern
k = strfind(str, pattern)

% String to Float/Int
x = str2num('str')