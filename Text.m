clear;clc; close all;
%load data that needs to be cleaned (DNA sequences)
data=fileread('BETTY Haplotypes final sorted by patient copy 2.txt')

%separate every time there is a '>'
par=strsplit(data, '>');

%stored each separated sequence in cell arrays 
for k=2:length(par)
    par{k}=['>' par{k}];
end

%data=readlines('BETTY Haplotypes final sorted by patient copy 2.txt')
%data= strtrim(data);

%load list of names (names are kind of the titles of the different dna
%sequences that need to be grouped together)
name = readlines('Name list.txt');
name = strtrim(name);
%quick clean up
name(16)=''

for j=1:length(name)
    for k=2:length(par)
        %if the 'name' correspond to the beggining of the sequence then add
        %it to that text file, with the tile as that 'name'.
        if strcmp(par{k}(2:14),name{j})
            fid=fopen(name{j} + ".txt", 'a')
            fprintf(fid, '%s\n', par{k});
            fclose(fid);
        end
    end
end


        
